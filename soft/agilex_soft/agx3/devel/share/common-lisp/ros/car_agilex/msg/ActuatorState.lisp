; Auto-generated. Do not edit!


(cl:in-package car_agilex-msg)


;//! \htmlinclude ActuatorState.msg.html

(cl:defclass <ActuatorState> (roslisp-msg-protocol:ros-message)
  ((motor_current
    :reader motor_current
    :initarg :motor_current
    :type cl:float
    :initform 0.0)
   (motor_rpm
    :reader motor_rpm
    :initarg :motor_rpm
    :type cl:float
    :initform 0.0)
   (motor_pulses
    :reader motor_pulses
    :initarg :motor_pulses
    :type cl:fixnum
    :initform 0)
   (motor_temperature
    :reader motor_temperature
    :initarg :motor_temperature
    :type cl:float
    :initform 0.0)
   (driver_voltage
    :reader driver_voltage
    :initarg :driver_voltage
    :type cl:float
    :initform 0.0)
   (driver_temperature
    :reader driver_temperature
    :initarg :driver_temperature
    :type cl:float
    :initform 0.0)
   (driver_state
    :reader driver_state
    :initarg :driver_state
    :type cl:fixnum
    :initform 0))
)

(cl:defclass ActuatorState (<ActuatorState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ActuatorState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ActuatorState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name car_agilex-msg:<ActuatorState> is deprecated: use car_agilex-msg:ActuatorState instead.")))

(cl:ensure-generic-function 'motor_current-val :lambda-list '(m))
(cl:defmethod motor_current-val ((m <ActuatorState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-msg:motor_current-val is deprecated.  Use car_agilex-msg:motor_current instead.")
  (motor_current m))

(cl:ensure-generic-function 'motor_rpm-val :lambda-list '(m))
(cl:defmethod motor_rpm-val ((m <ActuatorState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-msg:motor_rpm-val is deprecated.  Use car_agilex-msg:motor_rpm instead.")
  (motor_rpm m))

(cl:ensure-generic-function 'motor_pulses-val :lambda-list '(m))
(cl:defmethod motor_pulses-val ((m <ActuatorState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-msg:motor_pulses-val is deprecated.  Use car_agilex-msg:motor_pulses instead.")
  (motor_pulses m))

(cl:ensure-generic-function 'motor_temperature-val :lambda-list '(m))
(cl:defmethod motor_temperature-val ((m <ActuatorState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-msg:motor_temperature-val is deprecated.  Use car_agilex-msg:motor_temperature instead.")
  (motor_temperature m))

(cl:ensure-generic-function 'driver_voltage-val :lambda-list '(m))
(cl:defmethod driver_voltage-val ((m <ActuatorState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-msg:driver_voltage-val is deprecated.  Use car_agilex-msg:driver_voltage instead.")
  (driver_voltage m))

(cl:ensure-generic-function 'driver_temperature-val :lambda-list '(m))
(cl:defmethod driver_temperature-val ((m <ActuatorState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-msg:driver_temperature-val is deprecated.  Use car_agilex-msg:driver_temperature instead.")
  (driver_temperature m))

(cl:ensure-generic-function 'driver_state-val :lambda-list '(m))
(cl:defmethod driver_state-val ((m <ActuatorState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-msg:driver_state-val is deprecated.  Use car_agilex-msg:driver_state instead.")
  (driver_state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ActuatorState>) ostream)
  "Serializes a message object of type '<ActuatorState>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'motor_current))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'motor_rpm))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'motor_pulses)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'motor_pulses)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'motor_temperature))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'driver_voltage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'driver_temperature))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'driver_state)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ActuatorState>) istream)
  "Deserializes a message object of type '<ActuatorState>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'motor_current) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'motor_rpm) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'motor_pulses)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'motor_pulses)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'motor_temperature) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'driver_voltage) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'driver_temperature) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'driver_state)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ActuatorState>)))
  "Returns string type for a message object of type '<ActuatorState>"
  "car_agilex/ActuatorState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ActuatorState)))
  "Returns string type for a message object of type 'ActuatorState"
  "car_agilex/ActuatorState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ActuatorState>)))
  "Returns md5sum for a message object of type '<ActuatorState>"
  "9fbd9d68394311e2609797770a9092c6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ActuatorState)))
  "Returns md5sum for a message object of type 'ActuatorState"
  "9fbd9d68394311e2609797770a9092c6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ActuatorState>)))
  "Returns full string definition for message of type '<ActuatorState>"
  (cl:format cl:nil "float64 motor_current~%float64 motor_rpm~%uint16 motor_pulses~%float64 motor_temperature~%~%float64 driver_voltage~%float64 driver_temperature~%uint8 driver_state~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ActuatorState)))
  "Returns full string definition for message of type 'ActuatorState"
  (cl:format cl:nil "float64 motor_current~%float64 motor_rpm~%uint16 motor_pulses~%float64 motor_temperature~%~%float64 driver_voltage~%float64 driver_temperature~%uint8 driver_state~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ActuatorState>))
  (cl:+ 0
     8
     8
     2
     8
     8
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ActuatorState>))
  "Converts a ROS message object to a list"
  (cl:list 'ActuatorState
    (cl:cons ':motor_current (motor_current msg))
    (cl:cons ':motor_rpm (motor_rpm msg))
    (cl:cons ':motor_pulses (motor_pulses msg))
    (cl:cons ':motor_temperature (motor_temperature msg))
    (cl:cons ':driver_voltage (driver_voltage msg))
    (cl:cons ':driver_temperature (driver_temperature msg))
    (cl:cons ':driver_state (driver_state msg))
))
