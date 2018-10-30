; Auto-generated. Do not edit!


(cl:in-package a3_p2-msg)


;//! \htmlinclude ExtractedLine.msg.html

(cl:defclass <ExtractedLine> (roslisp-msg-protocol:ros-message)
  ((r
    :reader r
    :initarg :r
    :type cl:float
    :initform 0.0)
   (alpha
    :reader alpha
    :initarg :alpha
    :type cl:float
    :initform 0.0)
   (firstScanPoint
    :reader firstScanPoint
    :initarg :firstScanPoint
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (lastScanPoint
    :reader lastScanPoint
    :initarg :lastScanPoint
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point)))
)

(cl:defclass ExtractedLine (<ExtractedLine>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExtractedLine>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExtractedLine)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name a3_p2-msg:<ExtractedLine> is deprecated: use a3_p2-msg:ExtractedLine instead.")))

(cl:ensure-generic-function 'r-val :lambda-list '(m))
(cl:defmethod r-val ((m <ExtractedLine>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader a3_p2-msg:r-val is deprecated.  Use a3_p2-msg:r instead.")
  (r m))

(cl:ensure-generic-function 'alpha-val :lambda-list '(m))
(cl:defmethod alpha-val ((m <ExtractedLine>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader a3_p2-msg:alpha-val is deprecated.  Use a3_p2-msg:alpha instead.")
  (alpha m))

(cl:ensure-generic-function 'firstScanPoint-val :lambda-list '(m))
(cl:defmethod firstScanPoint-val ((m <ExtractedLine>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader a3_p2-msg:firstScanPoint-val is deprecated.  Use a3_p2-msg:firstScanPoint instead.")
  (firstScanPoint m))

(cl:ensure-generic-function 'lastScanPoint-val :lambda-list '(m))
(cl:defmethod lastScanPoint-val ((m <ExtractedLine>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader a3_p2-msg:lastScanPoint-val is deprecated.  Use a3_p2-msg:lastScanPoint instead.")
  (lastScanPoint m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExtractedLine>) ostream)
  "Serializes a message object of type '<ExtractedLine>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'r))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'alpha))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'firstScanPoint) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'lastScanPoint) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExtractedLine>) istream)
  "Deserializes a message object of type '<ExtractedLine>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'r) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'alpha) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'firstScanPoint) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'lastScanPoint) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExtractedLine>)))
  "Returns string type for a message object of type '<ExtractedLine>"
  "a3_p2/ExtractedLine")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExtractedLine)))
  "Returns string type for a message object of type 'ExtractedLine"
  "a3_p2/ExtractedLine")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExtractedLine>)))
  "Returns md5sum for a message object of type '<ExtractedLine>"
  "f75a43af20e7eac85f98816304fa2031")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExtractedLine)))
  "Returns md5sum for a message object of type 'ExtractedLine"
  "f75a43af20e7eac85f98816304fa2031")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExtractedLine>)))
  "Returns full string definition for message of type '<ExtractedLine>"
  (cl:format cl:nil "# The r and alpha parameters define the extracted line.~%float32 r~%float32 alpha~%#~%# The following points are used for display / debugging purposes only.~%# These points come from the position of the first and last laser scan points~%# used to estimate the line. They do not define the line and may not have even~%# been used in estimating the line (e.g. they may have exceeded the~%# maximum_range parameter). However, they are useful in visualizing what range~%# of scan points were used to estimate the line.~%geometry_msgs/Point firstScanPoint~%geometry_msgs/Point lastScanPoint~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExtractedLine)))
  "Returns full string definition for message of type 'ExtractedLine"
  (cl:format cl:nil "# The r and alpha parameters define the extracted line.~%float32 r~%float32 alpha~%#~%# The following points are used for display / debugging purposes only.~%# These points come from the position of the first and last laser scan points~%# used to estimate the line. They do not define the line and may not have even~%# been used in estimating the line (e.g. they may have exceeded the~%# maximum_range parameter). However, they are useful in visualizing what range~%# of scan points were used to estimate the line.~%geometry_msgs/Point firstScanPoint~%geometry_msgs/Point lastScanPoint~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExtractedLine>))
  (cl:+ 0
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'firstScanPoint))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'lastScanPoint))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExtractedLine>))
  "Converts a ROS message object to a list"
  (cl:list 'ExtractedLine
    (cl:cons ':r (r msg))
    (cl:cons ':alpha (alpha msg))
    (cl:cons ':firstScanPoint (firstScanPoint msg))
    (cl:cons ':lastScanPoint (lastScanPoint msg))
))
