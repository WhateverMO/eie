; Auto-generated. Do not edit!


(cl:in-package car_agilex-srv)


;//! \htmlinclude ScoutLightCmd-request.msg.html

(cl:defclass <ScoutLightCmd-request> (roslisp-msg-protocol:ros-message)
  ((enable_ctrl
    :reader enable_ctrl
    :initarg :enable_ctrl
    :type cl:boolean
    :initform cl:nil)
   (front_mode
    :reader front_mode
    :initarg :front_mode
    :type cl:fixnum
    :initform 0)
   (front_custom_value
    :reader front_custom_value
    :initarg :front_custom_value
    :type cl:fixnum
    :initform 0)
   (rear_mode
    :reader rear_mode
    :initarg :rear_mode
    :type cl:fixnum
    :initform 0)
   (rear_custom_value
    :reader rear_custom_value
    :initarg :rear_custom_value
    :type cl:fixnum
    :initform 0))
)

(cl:defclass ScoutLightCmd-request (<ScoutLightCmd-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ScoutLightCmd-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ScoutLightCmd-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name car_agilex-srv:<ScoutLightCmd-request> is deprecated: use car_agilex-srv:ScoutLightCmd-request instead.")))

(cl:ensure-generic-function 'enable_ctrl-val :lambda-list '(m))
(cl:defmethod enable_ctrl-val ((m <ScoutLightCmd-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-srv:enable_ctrl-val is deprecated.  Use car_agilex-srv:enable_ctrl instead.")
  (enable_ctrl m))

(cl:ensure-generic-function 'front_mode-val :lambda-list '(m))
(cl:defmethod front_mode-val ((m <ScoutLightCmd-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-srv:front_mode-val is deprecated.  Use car_agilex-srv:front_mode instead.")
  (front_mode m))

(cl:ensure-generic-function 'front_custom_value-val :lambda-list '(m))
(cl:defmethod front_custom_value-val ((m <ScoutLightCmd-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-srv:front_custom_value-val is deprecated.  Use car_agilex-srv:front_custom_value instead.")
  (front_custom_value m))

(cl:ensure-generic-function 'rear_mode-val :lambda-list '(m))
(cl:defmethod rear_mode-val ((m <ScoutLightCmd-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-srv:rear_mode-val is deprecated.  Use car_agilex-srv:rear_mode instead.")
  (rear_mode m))

(cl:ensure-generic-function 'rear_custom_value-val :lambda-list '(m))
(cl:defmethod rear_custom_value-val ((m <ScoutLightCmd-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-srv:rear_custom_value-val is deprecated.  Use car_agilex-srv:rear_custom_value instead.")
  (rear_custom_value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ScoutLightCmd-request>) ostream)
  "Serializes a message object of type '<ScoutLightCmd-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'enable_ctrl) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'front_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'front_custom_value)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rear_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rear_custom_value)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ScoutLightCmd-request>) istream)
  "Deserializes a message object of type '<ScoutLightCmd-request>"
    (cl:setf (cl:slot-value msg 'enable_ctrl) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'front_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'front_custom_value)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rear_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rear_custom_value)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ScoutLightCmd-request>)))
  "Returns string type for a service object of type '<ScoutLightCmd-request>"
  "car_agilex/ScoutLightCmdRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ScoutLightCmd-request)))
  "Returns string type for a service object of type 'ScoutLightCmd-request"
  "car_agilex/ScoutLightCmdRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ScoutLightCmd-request>)))
  "Returns md5sum for a message object of type '<ScoutLightCmd-request>"
  "2047fb36251c93f820b26cd1be3ecace")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ScoutLightCmd-request)))
  "Returns md5sum for a message object of type 'ScoutLightCmd-request"
  "2047fb36251c93f820b26cd1be3ecace")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ScoutLightCmd-request>)))
  "Returns full string definition for message of type '<ScoutLightCmd-request>"
  (cl:format cl:nil "bool enable_ctrl~%~%uint8 front_mode~%uint8 front_custom_value~%uint8 rear_mode~%uint8 rear_custom_value~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ScoutLightCmd-request)))
  "Returns full string definition for message of type 'ScoutLightCmd-request"
  (cl:format cl:nil "bool enable_ctrl~%~%uint8 front_mode~%uint8 front_custom_value~%uint8 rear_mode~%uint8 rear_custom_value~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ScoutLightCmd-request>))
  (cl:+ 0
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ScoutLightCmd-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ScoutLightCmd-request
    (cl:cons ':enable_ctrl (enable_ctrl msg))
    (cl:cons ':front_mode (front_mode msg))
    (cl:cons ':front_custom_value (front_custom_value msg))
    (cl:cons ':rear_mode (rear_mode msg))
    (cl:cons ':rear_custom_value (rear_custom_value msg))
))
;//! \htmlinclude ScoutLightCmd-response.msg.html

(cl:defclass <ScoutLightCmd-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ScoutLightCmd-response (<ScoutLightCmd-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ScoutLightCmd-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ScoutLightCmd-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name car_agilex-srv:<ScoutLightCmd-response> is deprecated: use car_agilex-srv:ScoutLightCmd-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <ScoutLightCmd-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-srv:result-val is deprecated.  Use car_agilex-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ScoutLightCmd-response>) ostream)
  "Serializes a message object of type '<ScoutLightCmd-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ScoutLightCmd-response>) istream)
  "Deserializes a message object of type '<ScoutLightCmd-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ScoutLightCmd-response>)))
  "Returns string type for a service object of type '<ScoutLightCmd-response>"
  "car_agilex/ScoutLightCmdResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ScoutLightCmd-response)))
  "Returns string type for a service object of type 'ScoutLightCmd-response"
  "car_agilex/ScoutLightCmdResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ScoutLightCmd-response>)))
  "Returns md5sum for a message object of type '<ScoutLightCmd-response>"
  "2047fb36251c93f820b26cd1be3ecace")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ScoutLightCmd-response)))
  "Returns md5sum for a message object of type 'ScoutLightCmd-response"
  "2047fb36251c93f820b26cd1be3ecace")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ScoutLightCmd-response>)))
  "Returns full string definition for message of type '<ScoutLightCmd-response>"
  (cl:format cl:nil "~%bool result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ScoutLightCmd-response)))
  "Returns full string definition for message of type 'ScoutLightCmd-response"
  (cl:format cl:nil "~%bool result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ScoutLightCmd-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ScoutLightCmd-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ScoutLightCmd-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ScoutLightCmd)))
  'ScoutLightCmd-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ScoutLightCmd)))
  'ScoutLightCmd-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ScoutLightCmd)))
  "Returns string type for a service object of type '<ScoutLightCmd>"
  "car_agilex/ScoutLightCmd")