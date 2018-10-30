;; Auto-generated. Do not edit!


(when (boundp 'a3_p2::ExtractedLine)
  (if (not (find-package "A3_P2"))
    (make-package "A3_P2"))
  (shadow 'ExtractedLine (find-package "A3_P2")))
(unless (find-package "A3_P2::EXTRACTEDLINE")
  (make-package "A3_P2::EXTRACTEDLINE"))

(in-package "ROS")
;;//! \htmlinclude ExtractedLine.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass a3_p2::ExtractedLine
  :super ros::object
  :slots (_r _alpha _firstScanPoint _lastScanPoint ))

(defmethod a3_p2::ExtractedLine
  (:init
   (&key
    ((:r __r) 0.0)
    ((:alpha __alpha) 0.0)
    ((:firstScanPoint __firstScanPoint) (instance geometry_msgs::Point :init))
    ((:lastScanPoint __lastScanPoint) (instance geometry_msgs::Point :init))
    )
   (send-super :init)
   (setq _r (float __r))
   (setq _alpha (float __alpha))
   (setq _firstScanPoint __firstScanPoint)
   (setq _lastScanPoint __lastScanPoint)
   self)
  (:r
   (&optional __r)
   (if __r (setq _r __r)) _r)
  (:alpha
   (&optional __alpha)
   (if __alpha (setq _alpha __alpha)) _alpha)
  (:firstScanPoint
   (&rest __firstScanPoint)
   (if (keywordp (car __firstScanPoint))
       (send* _firstScanPoint __firstScanPoint)
     (progn
       (if __firstScanPoint (setq _firstScanPoint (car __firstScanPoint)))
       _firstScanPoint)))
  (:lastScanPoint
   (&rest __lastScanPoint)
   (if (keywordp (car __lastScanPoint))
       (send* _lastScanPoint __lastScanPoint)
     (progn
       (if __lastScanPoint (setq _lastScanPoint (car __lastScanPoint)))
       _lastScanPoint)))
  (:serialization-length
   ()
   (+
    ;; float32 _r
    4
    ;; float32 _alpha
    4
    ;; geometry_msgs/Point _firstScanPoint
    (send _firstScanPoint :serialization-length)
    ;; geometry_msgs/Point _lastScanPoint
    (send _lastScanPoint :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _r
       (sys::poke _r (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _alpha
       (sys::poke _alpha (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; geometry_msgs/Point _firstScanPoint
       (send _firstScanPoint :serialize s)
     ;; geometry_msgs/Point _lastScanPoint
       (send _lastScanPoint :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _r
     (setq _r (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _alpha
     (setq _alpha (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; geometry_msgs/Point _firstScanPoint
     (send _firstScanPoint :deserialize buf ptr-) (incf ptr- (send _firstScanPoint :serialization-length))
   ;; geometry_msgs/Point _lastScanPoint
     (send _lastScanPoint :deserialize buf ptr-) (incf ptr- (send _lastScanPoint :serialization-length))
   ;;
   self)
  )

(setf (get a3_p2::ExtractedLine :md5sum-) "f75a43af20e7eac85f98816304fa2031")
(setf (get a3_p2::ExtractedLine :datatype-) "a3_p2/ExtractedLine")
(setf (get a3_p2::ExtractedLine :definition-)
      "# The r and alpha parameters define the extracted line.
float32 r
float32 alpha
#
# The following points are used for display / debugging purposes only.
# These points come from the position of the first and last laser scan points
# used to estimate the line. They do not define the line and may not have even
# been used in estimating the line (e.g. they may have exceeded the
# maximum_range parameter). However, they are useful in visualizing what range
# of scan points were used to estimate the line.
geometry_msgs/Point firstScanPoint
geometry_msgs/Point lastScanPoint
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :a3_p2/ExtractedLine "f75a43af20e7eac85f98816304fa2031")


