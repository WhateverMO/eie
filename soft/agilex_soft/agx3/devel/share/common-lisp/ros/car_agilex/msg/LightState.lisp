; Auto-generated. Do not edit!


(cl:in-package car_agilex-msg)


;//! \htmlinclude LightState.msg.html

(cl:defclass <LightState> (roslisp-msg-protocol:ros-message)
  ((mode
    :reader mode
    :initarg :mode
    :type cl:fixnum
    :initform 0)
   (custom_value
    :reader custom_value
    :initarg :custom_value
    :type cl:fixnum
    :initform 0))
)

(cl:defclass LightState (<LightState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LightState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LightState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name car_agilex-msg:<LightState> is deprecated: use car_agilex-msg:LightState instead.")))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <LightState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-msg:mode-val is deprecated.  Use car_agilex-msg:mode instead.")
  (mode m))

(cl:ensure-generic-function 'custom_value-val :lambda-list '(m))
(cl:defmethod custom_value-val ((m <LightState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-msg:custom_value-val is deprecated.  Use car_agilex-msg:custom_value instead.")
  (custom_value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LightState>) ostream)
  "Serializes a message object of type '<LightState>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'custom_value)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LightState>) istream)
  "Deserializes a message object of type '<LightState>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'custom_value)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LightState>)))
  "Returns string type for a message object of type '<LightState>"
  "car_agilex/LightState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LightState)))
  "Returns string type for a message object of type 'LightState"
  "car_agilex/LightState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LightState>)))
  "Returns md5sum for a message object of type '<LightState>"
  "51866248399dda20e62f6b250914288e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LightState)))
  "Returns md5sum for a message object of type 'LightState"
  "51866248399dda20e62f6b250914288e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LightState>)))
  "Returns full string definition for message of type '<LightState>"
  (cl:format cl:nil "uint8 mode~%uint8 custom_value~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LightState)))
  "Returns full string definition for message of type 'LightState"
  (cl:format cl:nil "uint8 mode~%uint8 custom_value~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LightState>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LightState>))
  "Converts a ROS message object to a list"
  (cl:list 'LightState
    (cl:cons ':mode (mode msg))
    (cl:cons ':custom_value (custom_value msg))
))
