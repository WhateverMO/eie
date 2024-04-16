; Auto-generated. Do not edit!


(cl:in-package OTA-srv)


;//! \htmlinclude msg-request.msg.html

(cl:defclass <msg-request> (roslisp-msg-protocol:ros-message)
  ((request
    :reader request
    :initarg :request
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass msg-request (<msg-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <msg-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'msg-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name OTA-srv:<msg-request> is deprecated: use OTA-srv:msg-request instead.")))

(cl:ensure-generic-function 'request-val :lambda-list '(m))
(cl:defmethod request-val ((m <msg-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader OTA-srv:request-val is deprecated.  Use OTA-srv:request instead.")
  (request m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <msg-request>) ostream)
  "Serializes a message object of type '<msg-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'request))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'request))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <msg-request>) istream)
  "Deserializes a message object of type '<msg-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'request) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'request)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<msg-request>)))
  "Returns string type for a service object of type '<msg-request>"
  "OTA/msgRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'msg-request)))
  "Returns string type for a service object of type 'msg-request"
  "OTA/msgRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<msg-request>)))
  "Returns md5sum for a message object of type '<msg-request>"
  "c86ebe885efd9f142a198542f73f2d7f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'msg-request)))
  "Returns md5sum for a message object of type 'msg-request"
  "c86ebe885efd9f142a198542f73f2d7f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<msg-request>)))
  "Returns full string definition for message of type '<msg-request>"
  (cl:format cl:nil "uint8[] request~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'msg-request)))
  "Returns full string definition for message of type 'msg-request"
  (cl:format cl:nil "uint8[] request~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <msg-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'request) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <msg-request>))
  "Converts a ROS message object to a list"
  (cl:list 'msg-request
    (cl:cons ':request (request msg))
))
;//! \htmlinclude msg-response.msg.html

(cl:defclass <msg-response> (roslisp-msg-protocol:ros-message)
  ((response
    :reader response
    :initarg :response
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass msg-response (<msg-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <msg-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'msg-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name OTA-srv:<msg-response> is deprecated: use OTA-srv:msg-response instead.")))

(cl:ensure-generic-function 'response-val :lambda-list '(m))
(cl:defmethod response-val ((m <msg-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader OTA-srv:response-val is deprecated.  Use OTA-srv:response instead.")
  (response m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <msg-response>) ostream)
  "Serializes a message object of type '<msg-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'response))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'response))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <msg-response>) istream)
  "Deserializes a message object of type '<msg-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'response) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'response)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<msg-response>)))
  "Returns string type for a service object of type '<msg-response>"
  "OTA/msgResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'msg-response)))
  "Returns string type for a service object of type 'msg-response"
  "OTA/msgResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<msg-response>)))
  "Returns md5sum for a message object of type '<msg-response>"
  "c86ebe885efd9f142a198542f73f2d7f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'msg-response)))
  "Returns md5sum for a message object of type 'msg-response"
  "c86ebe885efd9f142a198542f73f2d7f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<msg-response>)))
  "Returns full string definition for message of type '<msg-response>"
  (cl:format cl:nil "uint8[] response~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'msg-response)))
  "Returns full string definition for message of type 'msg-response"
  (cl:format cl:nil "uint8[] response~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <msg-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'response) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <msg-response>))
  "Converts a ROS message object to a list"
  (cl:list 'msg-response
    (cl:cons ':response (response msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'msg)))
  'msg-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'msg)))
  'msg-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'msg)))
  "Returns string type for a service object of type '<msg>"
  "OTA/msg")