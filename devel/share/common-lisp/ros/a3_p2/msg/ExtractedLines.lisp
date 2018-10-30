; Auto-generated. Do not edit!


(cl:in-package a3_p2-msg)


;//! \htmlinclude ExtractedLines.msg.html

(cl:defclass <ExtractedLines> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (lines
    :reader lines
    :initarg :lines
    :type (cl:vector a3_p2-msg:ExtractedLine)
   :initform (cl:make-array 0 :element-type 'a3_p2-msg:ExtractedLine :initial-element (cl:make-instance 'a3_p2-msg:ExtractedLine))))
)

(cl:defclass ExtractedLines (<ExtractedLines>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExtractedLines>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExtractedLines)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name a3_p2-msg:<ExtractedLines> is deprecated: use a3_p2-msg:ExtractedLines instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ExtractedLines>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader a3_p2-msg:header-val is deprecated.  Use a3_p2-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'lines-val :lambda-list '(m))
(cl:defmethod lines-val ((m <ExtractedLines>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader a3_p2-msg:lines-val is deprecated.  Use a3_p2-msg:lines instead.")
  (lines m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExtractedLines>) ostream)
  "Serializes a message object of type '<ExtractedLines>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'lines))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'lines))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExtractedLines>) istream)
  "Deserializes a message object of type '<ExtractedLines>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'lines) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'lines)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'a3_p2-msg:ExtractedLine))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExtractedLines>)))
  "Returns string type for a message object of type '<ExtractedLines>"
  "a3_p2/ExtractedLines")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExtractedLines)))
  "Returns string type for a message object of type 'ExtractedLines"
  "a3_p2/ExtractedLines")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExtractedLines>)))
  "Returns md5sum for a message object of type '<ExtractedLines>"
  "84df0150225154ce23ef2354bc707c6e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExtractedLines)))
  "Returns md5sum for a message object of type 'ExtractedLines"
  "84df0150225154ce23ef2354bc707c6e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExtractedLines>)))
  "Returns full string definition for message of type '<ExtractedLines>"
  (cl:format cl:nil "Header header~%ExtractedLine[] lines~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: a3_p2/ExtractedLine~%# The r and alpha parameters define the extracted line.~%float32 r~%float32 alpha~%#~%# The following points are used for display / debugging purposes only.~%# These points come from the position of the first and last laser scan points~%# used to estimate the line. They do not define the line and may not have even~%# been used in estimating the line (e.g. they may have exceeded the~%# maximum_range parameter). However, they are useful in visualizing what range~%# of scan points were used to estimate the line.~%geometry_msgs/Point firstScanPoint~%geometry_msgs/Point lastScanPoint~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExtractedLines)))
  "Returns full string definition for message of type 'ExtractedLines"
  (cl:format cl:nil "Header header~%ExtractedLine[] lines~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: a3_p2/ExtractedLine~%# The r and alpha parameters define the extracted line.~%float32 r~%float32 alpha~%#~%# The following points are used for display / debugging purposes only.~%# These points come from the position of the first and last laser scan points~%# used to estimate the line. They do not define the line and may not have even~%# been used in estimating the line (e.g. they may have exceeded the~%# maximum_range parameter). However, they are useful in visualizing what range~%# of scan points were used to estimate the line.~%geometry_msgs/Point firstScanPoint~%geometry_msgs/Point lastScanPoint~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExtractedLines>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'lines) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExtractedLines>))
  "Converts a ROS message object to a list"
  (cl:list 'ExtractedLines
    (cl:cons ':header (header msg))
    (cl:cons ':lines (lines msg))
))
