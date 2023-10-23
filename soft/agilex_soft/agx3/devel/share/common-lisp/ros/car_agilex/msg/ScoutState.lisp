; Auto-generated. Do not edit!


(cl:in-package car_agilex-msg)


;//! \htmlinclude ScoutState.msg.html

(cl:defclass <ScoutState> (roslisp-msg-protocol:ros-message)
  ((base_state
    :reader base_state
    :initarg :base_state
    :type cl:fixnum
    :initform 0)
   (control_mode
    :reader control_mode
    :initarg :control_mode
    :type cl:fixnum
    :initform 0)
   (fault_code
    :reader fault_code
    :initarg :fault_code
    :type cl:fixnum
    :initform 0)
   (battery_voltage
    :reader battery_voltage
    :initarg :battery_voltage
    :type cl:float
    :initform 0.0)
   (actuator_states
    :reader actuator_states
    :initarg :actuator_states
    :type (cl:vector car_agilex-msg:ActuatorState)
   :initform (cl:make-array 0 :element-type 'car_agilex-msg:ActuatorState :initial-element (cl:make-instance 'car_agilex-msg:ActuatorState)))
   (light_control_enabled
    :reader light_control_enabled
    :initarg :light_control_enabled
    :type cl:boolean
    :initform cl:nil)
   (front_light_state
    :reader front_light_state
    :initarg :front_light_state
    :type car_agilex-msg:LightState
    :initform (cl:make-instance 'car_agilex-msg:LightState))
   (rear_light_state
    :reader rear_light_state
    :initarg :rear_light_state
    :type car_agilex-msg:LightState
    :initform (cl:make-instance 'car_agilex-msg:LightState))
   (linear_velocity
    :reader linear_velocity
    :initarg :linear_velocity
    :type cl:float
    :initform 0.0)
   (angular_velocity
    :reader angular_velocity
    :initarg :angular_velocity
    :type cl:float
    :initform 0.0)
   (left_odometry
    :reader left_odometry
    :initarg :left_odometry
    :type cl:float
    :initform 0.0)
   (right_odometry
    :reader right_odometry
    :initarg :right_odometry
    :type cl:float
    :initform 0.0))
)

(cl:defclass ScoutState (<ScoutState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ScoutState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ScoutState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name car_agilex-msg:<ScoutState> is deprecated: use car_agilex-msg:ScoutState instead.")))

(cl:ensure-generic-function 'base_state-val :lambda-list '(m))
(cl:defmethod base_state-val ((m <ScoutState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-msg:base_state-val is deprecated.  Use car_agilex-msg:base_state instead.")
  (base_state m))

(cl:ensure-generic-function 'control_mode-val :lambda-list '(m))
(cl:defmethod control_mode-val ((m <ScoutState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-msg:control_mode-val is deprecated.  Use car_agilex-msg:control_mode instead.")
  (control_mode m))

(cl:ensure-generic-function 'fault_code-val :lambda-list '(m))
(cl:defmethod fault_code-val ((m <ScoutState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-msg:fault_code-val is deprecated.  Use car_agilex-msg:fault_code instead.")
  (fault_code m))

(cl:ensure-generic-function 'battery_voltage-val :lambda-list '(m))
(cl:defmethod battery_voltage-val ((m <ScoutState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-msg:battery_voltage-val is deprecated.  Use car_agilex-msg:battery_voltage instead.")
  (battery_voltage m))

(cl:ensure-generic-function 'actuator_states-val :lambda-list '(m))
(cl:defmethod actuator_states-val ((m <ScoutState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-msg:actuator_states-val is deprecated.  Use car_agilex-msg:actuator_states instead.")
  (actuator_states m))

(cl:ensure-generic-function 'light_control_enabled-val :lambda-list '(m))
(cl:defmethod light_control_enabled-val ((m <ScoutState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-msg:light_control_enabled-val is deprecated.  Use car_agilex-msg:light_control_enabled instead.")
  (light_control_enabled m))

(cl:ensure-generic-function 'front_light_state-val :lambda-list '(m))
(cl:defmethod front_light_state-val ((m <ScoutState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-msg:front_light_state-val is deprecated.  Use car_agilex-msg:front_light_state instead.")
  (front_light_state m))

(cl:ensure-generic-function 'rear_light_state-val :lambda-list '(m))
(cl:defmethod rear_light_state-val ((m <ScoutState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-msg:rear_light_state-val is deprecated.  Use car_agilex-msg:rear_light_state instead.")
  (rear_light_state m))

(cl:ensure-generic-function 'linear_velocity-val :lambda-list '(m))
(cl:defmethod linear_velocity-val ((m <ScoutState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-msg:linear_velocity-val is deprecated.  Use car_agilex-msg:linear_velocity instead.")
  (linear_velocity m))

(cl:ensure-generic-function 'angular_velocity-val :lambda-list '(m))
(cl:defmethod angular_velocity-val ((m <ScoutState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-msg:angular_velocity-val is deprecated.  Use car_agilex-msg:angular_velocity instead.")
  (angular_velocity m))

(cl:ensure-generic-function 'left_odometry-val :lambda-list '(m))
(cl:defmethod left_odometry-val ((m <ScoutState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-msg:left_odometry-val is deprecated.  Use car_agilex-msg:left_odometry instead.")
  (left_odometry m))

(cl:ensure-generic-function 'right_odometry-val :lambda-list '(m))
(cl:defmethod right_odometry-val ((m <ScoutState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader car_agilex-msg:right_odometry-val is deprecated.  Use car_agilex-msg:right_odometry instead.")
  (right_odometry m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ScoutState>) ostream)
  "Serializes a message object of type '<ScoutState>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'base_state)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'control_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fault_code)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'battery_voltage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'actuator_states))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'actuator_states))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'light_control_enabled) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'front_light_state) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'rear_light_state) ostream)
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
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'left_odometry))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'right_odometry))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ScoutState>) istream)
  "Deserializes a message object of type '<ScoutState>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'base_state)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'control_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fault_code)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'battery_voltage) (roslisp-utils:decode-double-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'actuator_states) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'actuator_states)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'car_agilex-msg:ActuatorState))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:setf (cl:slot-value msg 'light_control_enabled) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'front_light_state) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'rear_light_state) istream)
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
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'left_odometry) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'right_odometry) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ScoutState>)))
  "Returns string type for a message object of type '<ScoutState>"
  "car_agilex/ScoutState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ScoutState)))
  "Returns string type for a message object of type 'ScoutState"
  "car_agilex/ScoutState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ScoutState>)))
  "Returns md5sum for a message object of type '<ScoutState>"
  "ad42d15ec27ffc879e399e0f8f4d5a2b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ScoutState)))
  "Returns md5sum for a message object of type 'ScoutState"
  "ad42d15ec27ffc879e399e0f8f4d5a2b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ScoutState>)))
  "Returns full string definition for message of type '<ScoutState>"
  (cl:format cl:nil "uint8 base_state~%uint8 control_mode~%uint8 fault_code~%float64 battery_voltage~%~%ActuatorState[] actuator_states~%~%bool light_control_enabled~%LightState front_light_state~%LightState rear_light_state~%~%float64 linear_velocity~%float64 angular_velocity~%~%float64 left_odometry~%float64 right_odometry~%================================================================================~%MSG: car_agilex/ActuatorState~%float64 motor_current~%float64 motor_rpm~%uint16 motor_pulses~%float64 motor_temperature~%~%float64 driver_voltage~%float64 driver_temperature~%uint8 driver_state~%================================================================================~%MSG: car_agilex/LightState~%uint8 mode~%uint8 custom_value~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ScoutState)))
  "Returns full string definition for message of type 'ScoutState"
  (cl:format cl:nil "uint8 base_state~%uint8 control_mode~%uint8 fault_code~%float64 battery_voltage~%~%ActuatorState[] actuator_states~%~%bool light_control_enabled~%LightState front_light_state~%LightState rear_light_state~%~%float64 linear_velocity~%float64 angular_velocity~%~%float64 left_odometry~%float64 right_odometry~%================================================================================~%MSG: car_agilex/ActuatorState~%float64 motor_current~%float64 motor_rpm~%uint16 motor_pulses~%float64 motor_temperature~%~%float64 driver_voltage~%float64 driver_temperature~%uint8 driver_state~%================================================================================~%MSG: car_agilex/LightState~%uint8 mode~%uint8 custom_value~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ScoutState>))
  (cl:+ 0
     1
     1
     1
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'actuator_states) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'front_light_state))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'rear_light_state))
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ScoutState>))
  "Converts a ROS message object to a list"
  (cl:list 'ScoutState
    (cl:cons ':base_state (base_state msg))
    (cl:cons ':control_mode (control_mode msg))
    (cl:cons ':fault_code (fault_code msg))
    (cl:cons ':battery_voltage (battery_voltage msg))
    (cl:cons ':actuator_states (actuator_states msg))
    (cl:cons ':light_control_enabled (light_control_enabled msg))
    (cl:cons ':front_light_state (front_light_state msg))
    (cl:cons ':rear_light_state (rear_light_state msg))
    (cl:cons ':linear_velocity (linear_velocity msg))
    (cl:cons ':angular_velocity (angular_velocity msg))
    (cl:cons ':left_odometry (left_odometry msg))
    (cl:cons ':right_odometry (right_odometry msg))
))
