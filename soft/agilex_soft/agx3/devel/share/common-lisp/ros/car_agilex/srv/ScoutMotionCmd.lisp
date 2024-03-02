; Auto-generated. Do not edit!


(cl:in-package car_agilex-srv)


;//! \htmlinclude ScoutMotionCmd-request.msg.html

(cl:defclass <ScoutMotionCmd-request> (roslisp-msg-protocol:ros-message)
  ((linear_velocity
    :reader linear_velocity
    :initarg :linear_velocity
    :type cl:float
    :initform 0.0)
   (angular_velocity
    :reader angular_velocity
    :initarg :angular_velocity
    :type cl:float
    :initform 0.0))
)

(cl:defclass ScoutMotionCmd-request (<ScoutMotionCmd-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ScoutMotionCmd-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ScoutMotionCmd-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name car_agilex-srv:<ScoutMotionCmd-request> is deprecated: use car_agilex-srv:ScoutMotionCmd-request instead.")))

(cl:ensure-generic-function 'linear_velocity-val :lambda-list '(m))
(cl:defmethod linear_velocity-val ((m <ScoutMotionCmd-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-srv:linear_velocity-val is deprecated.  Use car_agilex-srv:linear_velocity instead.")
  (linear_velocity m))

(cl:ensure-generic-function 'angular_velocity-val :lambda-list '(m))
(cl:defmethod angular_velocity-val ((m <ScoutMotionCmd-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-srv:angular_velocity-val is deprecated.  Use car_agilex-srv:angular_velocity instead.")
  (angular_velocity m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<ScoutMotionCmd-request>)))
    "Constants for message type '<ScoutMotionCmd-request>"
  '((:MAX_LINEAR_VELOCITY . 1.5)
    (:MIN_LINEAR_VELOCITY . -1.5)
    (:MAX_ANGULAR_VELOCITY . 0.5235)
    (:MIN_ANGULAR_VELOCITY . -0.5235))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'ScoutMotionCmd-request)))
    "Constants for message type 'ScoutMotionCmd-request"
  '((:MAX_LINEAR_VELOCITY . 1.5)
    (:MIN_LINEAR_VELOCITY . -1.5)
    (:MAX_ANGULAR_VELOCITY . 0.5235)
    (:MIN_ANGULAR_VELOCITY . -0.5235))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ScoutMotionCmd-request>) ostream)
  "Serializes a message object of type '<ScoutMotionCmd-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'linear_velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angular_velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ScoutMotionCmd-request>) istream)
  "Deserializes a message object of type '<ScoutMotionCmd-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'linear_velocity) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angular_velocity) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ScoutMotionCmd-request>)))
  "Returns string type for a service object of type '<ScoutMotionCmd-request>"
  "car_agilex/ScoutMotionCmdRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ScoutMotionCmd-request)))
  "Returns string type for a service object of type 'ScoutMotionCmd-request"
  "car_agilex/ScoutMotionCmdRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ScoutMotionCmd-request>)))
  "Returns md5sum for a message object of type '<ScoutMotionCmd-request>"
  "cda17c11be66f27fe21573aa44658f84")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ScoutMotionCmd-request)))
  "Returns md5sum for a message object of type 'ScoutMotionCmd-request"
  "cda17c11be66f27fe21573aa44658f84")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ScoutMotionCmd-request>)))
  "Returns full string definition for message of type '<ScoutMotionCmd-request>"
  (cl:format cl:nil "float64 linear_velocity~%float64 angular_velocity~%~%float64 max_linear_velocity=1.5~%float64 min_linear_velocity=-1.5~%float64 max_angular_velocity=0.5235~%float64 min_angular_velocity=-0.5235~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ScoutMotionCmd-request)))
  "Returns full string definition for message of type 'ScoutMotionCmd-request"
  (cl:format cl:nil "float64 linear_velocity~%float64 angular_velocity~%~%float64 max_linear_velocity=1.5~%float64 min_linear_velocity=-1.5~%float64 max_angular_velocity=0.5235~%float64 min_angular_velocity=-0.5235~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ScoutMotionCmd-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ScoutMotionCmd-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ScoutMotionCmd-request
    (cl:cons ':linear_velocity (linear_velocity msg))
    (cl:cons ':angular_velocity (angular_velocity msg))
))
;//! \htmlinclude ScoutMotionCmd-response.msg.html

(cl:defclass <ScoutMotionCmd-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ScoutMotionCmd-response (<ScoutMotionCmd-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ScoutMotionCmd-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ScoutMotionCmd-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name car_agilex-srv:<ScoutMotionCmd-response> is deprecated: use car_agilex-srv:ScoutMotionCmd-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <ScoutMotionCmd-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-srv:result-val is deprecated.  Use car_agilex-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ScoutMotionCmd-response>) ostream)
  "Serializes a message object of type '<ScoutMotionCmd-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ScoutMotionCmd-response>) istream)
  "Deserializes a message object of type '<ScoutMotionCmd-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ScoutMotionCmd-response>)))
  "Returns string type for a service object of type '<ScoutMotionCmd-response>"
  "car_agilex/ScoutMotionCmdResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ScoutMotionCmd-response)))
  "Returns string type for a service object of type 'ScoutMotionCmd-response"
  "car_agilex/ScoutMotionCmdResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ScoutMotionCmd-response>)))
  "Returns md5sum for a message object of type '<ScoutMotionCmd-response>"
  "cda17c11be66f27fe21573aa44658f84")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ScoutMotionCmd-response)))
  "Returns md5sum for a message object of type 'ScoutMotionCmd-response"
  "cda17c11be66f27fe21573aa44658f84")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ScoutMotionCmd-response>)))
  "Returns full string definition for message of type '<ScoutMotionCmd-response>"
  (cl:format cl:nil "~%bool result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ScoutMotionCmd-response)))
  "Returns full string definition for message of type 'ScoutMotionCmd-response"
  (cl:format cl:nil "~%bool result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ScoutMotionCmd-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ScoutMotionCmd-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ScoutMotionCmd-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ScoutMotionCmd)))
  'ScoutMotionCmd-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ScoutMotionCmd)))
  'ScoutMotionCmd-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ScoutMotionCmd)))
  "Returns string type for a service object of type '<ScoutMotionCmd>"
  "car_agilex/ScoutMotionCmd")