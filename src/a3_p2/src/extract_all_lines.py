#!/usr/bin/env python
"""
ROS node which subscribes to the /scan topic and fits a single line to
this scan, publishing it on the /extracted_lines topic.
"""

import rospy
import math
from fit_line import fit_line

from sensor_msgs.msg import LaserScan
from a3_p2.msg import ExtractedLine
from a3_p2.msg import ExtractedLines

debug = True

def to_cartesian(r, phi):        
    return (r * math.cos(phi), r * math.sin(phi))

def euclid_dist(p0, p1):
    return math.sqrt((p0[0] - p1[0])**2 + (p0[1] - p1[1])**2)

# https://en.wikipedia.org/wiki/Distance_from_a_point_to_a_line
# p0 and p1 are the endpoints on a line, p2 is the candidate point
def line_distance(p0, p1, p2):
    return (abs((p1[1] - p0[1])*p2[0] - (p1[0] - p0[0])*p2[1] + p1[0]*p0[1] - p1[1]*p0[0])/math.sqrt((p1[1] - p0[1])**2 + (p1[0] - p0[0])**2))

def split_for_extrema(scan, start, end, p0, p1):
    # get segmented start / stop locations
    delta_phi = scan.angle_increment
    min_phi   = scan.angle_min + (start * delta_phi) 
    max_phi   = scan.angle_max - (end * delta_phi)

    phi = min_phi
    local_extrema = [(0.0,0.0),(0.0,0.0),-1.0,0] # includes location and max distance value -1
    for i in range(start, end):
        r = scan.ranges[i]
        if math.isnan(r):
            r = 10.0
            #print "found NaN"
        point = to_cartesian(r,phi)
        d = line_distance(p0,p1,point)
        if d > local_extrema[2]:
            local_extrema[0] = point
            local_extrema[1] = (r,phi)
            local_extrema[2] = d
            local_extrema[3] = i
        phi += delta_phi

    return local_extrema

# helper function for sorting extrema by index
def extremaSortKey(elem):
        return elem[3]

def callback(scan):    
    # no thought was given to the effecency of this function
    # initial setup of situation
    delta_phi = scan.angle_increment
    min_phi   = scan.angle_min
    max_phi   = scan.angle_max
    
    if debug:
        print "delta phi: " + str(delta_phi) + "\nmin phi: " + str(min_phi) + "\nmax phi: " + str(max_phi)

    max_dist = -1
    min_dist = 9999 
    point_list = []
    extrema = [] # will only be 2 in this case. elements are ((x,y), (r,phi), distance, scan_index)
    phi = min_phi
    index = 0
    extrema.append([(0.0,0.0),(0.0,0.0),0.0,0])
    extrema.append([(0.0,0.0),(0.0,0.0),0.0,0])
    # converts to cartesian and finds min / max
    for r in scan.ranges:
        if math.isnan(r):
            r = 10.0
            #print "NaN found..."
        point = to_cartesian(r, phi)
        point_list.append([point, (r, phi)])
        d = euclid_dist((0,0),point)
        if d > max_dist:
            extrema[0] = ([point, (r, phi), d, index])
            max_dist = d
        if d < min_dist:
            extrema[1] = ([point, (r, phi), d, index])
            min_dist = d
        index += 1
        phi += delta_phi

    lines = ExtractedLines()
    lines.header.frame_id = scan.header.frame_id

    # intialize the system
    new_extrema = split_for_extrema(scan, extrema[0][3], extrema[1][3], extrema[0][0], extrema[1][0])
    extrema.append(new_extrema)
    looper = True
    lgi = 0 # lowest good index
    while looper:
        extrema.sort(key=extremaSortKey)
        looper = False # need to prove we must continue
        for x in range(lgi,len(extrema)-1):
            new_extrema = split_for_extrema(scan, extrema[x][3], extrema[x+1][3], extrema[x][0], extrema[x+1][0])
            d = new_extrema[2]
            point_num = abs(extrema[x+1][3] - new_extrema[3]) + abs(extrema[x][3] - new_extrema[3])
            if d > orthog_distance_threshold and point_num > 2* min_points_per_line:
                extrema.append(new_extrema)
                looper = True
                lgi = new_extrema[3]

    for x in range(0, len(extrema)-1):
        line = fit_line(scan, extrema[x][3], extrema[x+1][3], maximum_range)
        if line is not None:
            lines.lines.append(line)                        

    if debug:
        print "found: " + str(len(extrema)) + " extrema"
        print "found: " + str(len(lines.lines)) + " lines from valid extrema"

    extracted_publisher.publish(lines)
    
if __name__ == '__main__':
    global maximum_range, extracted_publisher, min_points_per_line, orthog_distance_threshold
    
    # Initialize this node.
    rospy.init_node('extract_all_lines')
    
    maximum_range = rospy.get_param('maximum_range')
    min_points_per_line = rospy.get_param('min_points_per_line')
    orthog_distance_threshold = rospy.get_param('orthog_distance_threshold')

    if debug:
        print "Max range: " + str(maximum_range)
        print "min points per line: " + str(min_points_per_line)
        print "max orthog dist: " + str(orthog_distance_threshold)
    
    rospy.Subscriber('/base_scan', LaserScan, callback)
    
    extracted_publisher = rospy.Publisher('/extracted_lines', ExtractedLines, queue_size=1)
    
    rospy.spin()
