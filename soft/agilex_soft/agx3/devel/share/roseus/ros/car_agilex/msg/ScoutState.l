;; Auto-generated. Do not edit!


(when (boundp 'car_agilex::ScoutState)
  (if (not (find-package "CAR_AGILEX"))
    (make-package "CAR_AGILEX"))
  (shadow 'ScoutState (find-package "CAR_AGILEX")))
(unless (find-package "CAR_AGILEX::SCOUTSTATE")
  (make-package "CAR_AGILEX::SCOUTSTATE"))

(in-package "ROS")
;;//! \htmlinclude ScoutState.msg.html


(defclass car_agilex::ScoutState
  :super ros::object
  :slots (_base_state _control_mode _fault_code _battery_voltage _actuator_states _light_control_enabled _front_light_state _rear_light_state _linear_velocity _angular_velocity _left_odometry _right_odometry ))

(defmethod car_agilex::ScoutState
  (:init
   (&key
    ((:base_state __base_state) 0)
    ((:control_mode __control_mode) 0)
    ((:fault_code __fault_code) 0)
    ((:battery_voltage __battery_voltage) 0.0)
    ((:actuator_states __actuator_states) (let (r) (dotimes (i 0) (push (instance car_agilex::ActuatorState :init) r)) r))
    ((:light_control_enabled __light_control_enabled) nil)
    ((:front_light_state __front_light_state) (instance car_agilex::LightState :init))
    ((:rear_light_state __rear_light_state) (instance car_agilex::LightState :init))
    ((:linear_velocity __linear_velocity) 0.0)
    ((:angular_velocity __angular_velocity) 0.0)
    ((:left_odometry __left_odometry) 0.0)
    ((:right_odometry __right_odometry) 0.0)
    )
   (send-super :init)
   (setq _base_state (round __base_state))
   (setq _control_mode (round __control_mode))
   (setq _fault_code (round __fault_code))
   (setq _battery_voltage (float __battery_voltage))
   (setq _actuator_states __actuator_states)
   (setq _light_control_enabled __light_control_enabled)
   (setq _front_light_state __front_light_state)
   (setq _rear_light_state __rear_light_state)
   (setq _linear_velocity (float __linear_velocity))
   (setq _angular_velocity (float __angular_velocity))
   (setq _left_odometry (float __left_odometry))
   (setq _right_odometry (float __right_odometry))
   self)
  (:base_state
   (&optional __base_state)
   (if __base_state (setq _base_state __base_state)) _base_state)
  (:control_mode
   (&optional __control_mode)
   (if __control_mode (setq _control_mode __control_mode)) _control_mode)
  (:fault_code
   (&optional __fault_code)
   (if __fault_code (setq _fault_code __fault_code)) _fault_code)
  (:battery_voltage
   (&optional __battery_voltage)
   (if __battery_voltage (setq _battery_voltage __battery_voltage)) _battery_voltage)
  (:actuator_states
   (&rest __actuator_states)
   (if (keywordp (car __actuator_states))
       (send* _actuator_states __actuator_states)
     (progn
       (if __actuator_states (setq _actuator_states (car __actuator_states)))
       _actuator_states)))
  (:light_control_enabled
   (&optional __light_control_enabled)
   (if __light_control_enabled (setq _light_control_enabled __light_control_enabled)) _light_control_enabled)
  (:front_light_state
   (&rest __front_light_state)
   (if (keywordp (car __front_light_state))
       (send* _front_light_state __front_light_state)
     (progn
       (if __front_light_state (setq _front_light_state (car __front_light_state)))
       _front_light_state)))
  (:rear_light_state
   (&rest __rear_light_state)
   (if (keywordp (car __rear_light_state))
       (send* _rear_light_state __rear_light_state)
     (progn
       (if __rear_light_state (setq _rear_light_state (car __rear_light_state)))
       _rear_light_state)))
  (:linear_velocity
   (&optional __linear_velocity)
   (if __linear_velocity (setq _linear_velocity __linear_velocity)) _linear_velocity)
  (:angular_velocity
   (&optional __angular_velocity)
   (if __angular_velocity (setq _angular_velocity __angular_velocity)) _angular_velocity)
  (:left_odometry
   (&optional __left_odometry)
   (if __left_odometry (setq _left_odometry __left_odometry)) _left_odometry)
  (:right_odometry
   (&optional __right_odometry)
   (if __right_odometry (setq _right_odometry __right_odometry)) _right_odometry)
  (:serialization-length
   ()
   (+
    ;; uint8 _base_state
    1
    ;; uint8 _control_mode
    1
    ;; uint8 _fault_code
    1
    ;; float64 _battery_voltage
    8
    ;; car_agilex/ActuatorState[] _actuator_states
    (apply #'+ (send-all _actuator_states :serialization-length)) 4
    ;; bool _light_control_enabled
    1
    ;; car_agilex/LightState _front_light_state
    (send _front_light_state :serialization-length)
    ;; car_agilex/LightState _rear_light_state
    (send _rear_light_state :serialization-length)
    ;; float64 _linear_velocity
    8
    ;; float64 _angular_velocity
    8
    ;; float64 _left_odometry
    8
    ;; float64 _right_odometry
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _base_state
       (write-byte _base_state s)
     ;; uint8 _control_mode
       (write-byte _control_mode s)
     ;; uint8 _fault_code
       (write-byte _fault_code s)
     ;; float64 _battery_voltage
       (sys::poke _battery_voltage (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; car_agilex/ActuatorState[] _actuator_states
     (write-long (length _actuator_states) s)
     (dolist (elem _actuator_states)
       (send elem :serialize s)
       )
     ;; bool _light_control_enabled
       (if _light_control_enabled (write-byte -1 s) (write-byte 0 s))
     ;; car_agilex/LightState _front_light_state
       (send _front_light_state :serialize s)
     ;; car_agilex/LightState _rear_light_state
       (send _rear_light_state :serialize s)
     ;; float64 _linear_velocity
       (sys::poke _linear_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angular_velocity
       (sys::poke _angular_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _left_odometry
       (sys::poke _left_odometry (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _right_odometry
       (sys::poke _right_odometry (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _base_state
     (setq _base_state (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _control_mode
     (setq _control_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _fault_code
     (setq _fault_code (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float64 _battery_voltage
     (setq _battery_voltage (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; car_agilex/ActuatorState[] _actuator_states
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _actuator_states (let (r) (dotimes (i n) (push (instance car_agilex::ActuatorState :init) r)) r))
     (dolist (elem- _actuator_states)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; bool _light_control_enabled
     (setq _light_control_enabled (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; car_agilex/LightState _front_light_state
     (send _front_light_state :deserialize buf ptr-) (incf ptr- (send _front_light_state :serialization-length))
   ;; car_agilex/LightState _rear_light_state
     (send _rear_light_state :deserialize buf ptr-) (incf ptr- (send _rear_light_state :serialization-length))
   ;; float64 _linear_velocity
     (setq _linear_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angular_velocity
     (setq _angular_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _left_odometry
     (setq _left_odometry (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _right_odometry
     (setq _right_odometry (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get car_agilex::ScoutState :md5sum-) "ad42d15ec27ffc879e399e0f8f4d5a2b")
(setf (get car_agilex::ScoutState :datatype-) "car_agilex/ScoutState")
(setf (get car_agilex::ScoutState :definition-)
      "uint8 base_state
uint8 control_mode
uint8 fault_code
float64 battery_voltage

ActuatorState[] actuator_states

bool light_control_enabled
LightState front_light_state
LightState rear_light_state

float64 linear_velocity
float64 angular_velocity

float64 left_odometry
float64 right_odometry
================================================================================
MSG: car_agilex/ActuatorState
float64 motor_current
float64 motor_rpm
uint16 motor_pulses
float64 motor_temperature

float64 driver_voltage
float64 driver_temperature
uint8 driver_state
================================================================================
MSG: car_agilex/LightState
uint8 mode
uint8 custom_value
")



(provide :car_agilex/ScoutState "ad42d15ec27ffc879e399e0f8f4d5a2b")


