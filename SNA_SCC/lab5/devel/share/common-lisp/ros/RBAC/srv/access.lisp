; Auto-generated. Do not edit!


(cl:in-package RBAC-srv)


;//! \htmlinclude access-request.msg.html

(cl:defclass <access-request> (roslisp-msg-protocol:ros-message)
  ((user_id
    :reader user_id
    :initarg :user_id
    :type cl:integer
    :initform 0)
   (otp_code
    :reader otp_code
    :initarg :otp_code
    :type cl:string
    :initform "")
   (operation
    :reader operation
    :initarg :operation
    :type cl:string
    :initform "")
   (resource
    :reader resource
    :initarg :resource
    :type cl:string
    :initform "")
   (content
    :reader content
    :initarg :content
    :type cl:string
    :initform ""))
)

(cl:defclass access-request (<access-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <access-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'access-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name RBAC-srv:<access-request> is deprecated: use RBAC-srv:access-request instead.")))

(cl:ensure-generic-function 'user_id-val :lambda-list '(m))
(cl:defmethod user_id-val ((m <access-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader RBAC-srv:user_id-val is deprecated.  Use RBAC-srv:user_id instead.")
  (user_id m))

(cl:ensure-generic-function 'otp_code-val :lambda-list '(m))
(cl:defmethod otp_code-val ((m <access-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader RBAC-srv:otp_code-val is deprecated.  Use RBAC-srv:otp_code instead.")
  (otp_code m))

(cl:ensure-generic-function 'operation-val :lambda-list '(m))
(cl:defmethod operation-val ((m <access-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader RBAC-srv:operation-val is deprecated.  Use RBAC-srv:operation instead.")
  (operation m))

(cl:ensure-generic-function 'resource-val :lambda-list '(m))
(cl:defmethod resource-val ((m <access-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader RBAC-srv:resource-val is deprecated.  Use RBAC-srv:resource instead.")
  (resource m))

(cl:ensure-generic-function 'content-val :lambda-list '(m))
(cl:defmethod content-val ((m <access-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader RBAC-srv:content-val is deprecated.  Use RBAC-srv:content instead.")
  (content m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <access-request>) ostream)
  "Serializes a message object of type '<access-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'user_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'user_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'user_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'user_id)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'otp_code))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'otp_code))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'operation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'operation))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'resource))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'resource))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'content))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'content))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <access-request>) istream)
  "Deserializes a message object of type '<access-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'user_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'user_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'user_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'user_id)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'otp_code) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'otp_code) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'operation) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'operation) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'resource) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'resource) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'content) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'content) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<access-request>)))
  "Returns string type for a service object of type '<access-request>"
  "RBAC/accessRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'access-request)))
  "Returns string type for a service object of type 'access-request"
  "RBAC/accessRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<access-request>)))
  "Returns md5sum for a message object of type '<access-request>"
  "a35aabb2e81bd422fdd731c4a33a3278")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'access-request)))
  "Returns md5sum for a message object of type 'access-request"
  "a35aabb2e81bd422fdd731c4a33a3278")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<access-request>)))
  "Returns full string definition for message of type '<access-request>"
  (cl:format cl:nil "uint32 user_id~%string otp_code~%string operation~%string resource~%string content~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'access-request)))
  "Returns full string definition for message of type 'access-request"
  (cl:format cl:nil "uint32 user_id~%string otp_code~%string operation~%string resource~%string content~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <access-request>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'otp_code))
     4 (cl:length (cl:slot-value msg 'operation))
     4 (cl:length (cl:slot-value msg 'resource))
     4 (cl:length (cl:slot-value msg 'content))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <access-request>))
  "Converts a ROS message object to a list"
  (cl:list 'access-request
    (cl:cons ':user_id (user_id msg))
    (cl:cons ':otp_code (otp_code msg))
    (cl:cons ':operation (operation msg))
    (cl:cons ':resource (resource msg))
    (cl:cons ':content (content msg))
))
;//! \htmlinclude access-response.msg.html

(cl:defclass <access-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass access-response (<access-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <access-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'access-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name RBAC-srv:<access-response> is deprecated: use RBAC-srv:access-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <access-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader RBAC-srv:result-val is deprecated.  Use RBAC-srv:result instead.")
  (result m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <access-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader RBAC-srv:message-val is deprecated.  Use RBAC-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <access-response>) ostream)
  "Serializes a message object of type '<access-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <access-response>) istream)
  "Deserializes a message object of type '<access-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<access-response>)))
  "Returns string type for a service object of type '<access-response>"
  "RBAC/accessResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'access-response)))
  "Returns string type for a service object of type 'access-response"
  "RBAC/accessResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<access-response>)))
  "Returns md5sum for a message object of type '<access-response>"
  "a35aabb2e81bd422fdd731c4a33a3278")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'access-response)))
  "Returns md5sum for a message object of type 'access-response"
  "a35aabb2e81bd422fdd731c4a33a3278")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<access-response>)))
  "Returns full string definition for message of type '<access-response>"
  (cl:format cl:nil "bool result~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'access-response)))
  "Returns full string definition for message of type 'access-response"
  (cl:format cl:nil "bool result~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <access-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <access-response>))
  "Converts a ROS message object to a list"
  (cl:list 'access-response
    (cl:cons ':result (result msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'access)))
  'access-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'access)))
  'access-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'access)))
  "Returns string type for a service object of type '<access>"
  "RBAC/access")