;; Auto-generated. Do not edit!


(when (boundp 'a3_p2::ExtractedLines)
  (if (not (find-package "A3_P2"))
    (make-package "A3_P2"))
  (shadow 'ExtractedLines (find-package "A3_P2")))
(unless (find-package "A3_P2::EXTRACTEDLINES")
  (make-package "A3_P2::EXTRACTEDLINES"))

(in-package "ROS")
;;//! \htmlinclude ExtractedLines.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass a3_p2::ExtractedLines
  :super ros::object
  :slots (_header _lines ))

(defmethod a3_p2::ExtractedLines
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:lines __lines) (let (r) (dotimes (i 0) (push (instance a3_p2::ExtractedLine :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _lines __lines)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:lines
   (&rest __lines)
   (if (keywordp (car __lines))
       (send* _lines __lines)
     (progn
       (if __lines (setq _lines (car __lines)))
       _lines)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; a3_p2/ExtractedLine[] _lines
    (apply #'+ (send-all _lines :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; a3_p2/ExtractedLine[] _lines
     (write-long (length _lines) s)
     (dolist (elem _lines)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; a3_p2/ExtractedLine[] _lines
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _lines (let (r) (dotimes (i n) (push (instance a3_p2::ExtractedLine :init) r)) r))
     (dolist (elem- _lines)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get a3_p2::ExtractedLines :md5sum-) "84df0150225154ce23ef2354bc707c6e")
(setf (get a3_p2::ExtractedLines :datatype-) "a3_p2/ExtractedLines")
(setf (get a3_p2::ExtractedLines :definition-)
      "Header header
ExtractedLine[] lines
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: a3_p2/ExtractedLine
# The r and alpha parameters define the extracted line.
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



(provide :a3_p2/ExtractedLines "84df0150225154ce23ef2354bc707c6e")


