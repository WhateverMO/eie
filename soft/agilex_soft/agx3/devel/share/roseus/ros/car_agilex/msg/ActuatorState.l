;; Auto-generated. Do not edit!


(when (boundp 'car_agilex::ActuatorState)
  (if (not (find-package "CAR_AGILEX"))
    (make-package "CAR_AGILEX"))
  (shadow 'ActuatorState (find-package "CAR_AGILEX")))
(unless (find-package "CAR_AGILEX::ACTUATORSTATE")
  (make-package "CAR_AGILEX::ACTUATORSTATE"))

(in-package "ROS")
;;//! \htmlinclude ActuatorState.msg.html


(defclass car_agilex::ActuatorState
  :super ros::object
  :slots (_motor_current _motor_rpm _motor_pulses _motor_temperature _driver_voltage _driver_temperature _driver_state ))

(defmethod car_agilex::ActuatorState
  (:init
   (&key
    ((:motor_current __motor_current) 0.0)
    ((:motor_rpm __motor_rpm) 0.0)
    ((:motor_pulses __motor_pulses) 0)
    ((:motor_temperature __motor_temperature) 0.0)
    ((:driver_voltage __driver_voltage) 0.0)
    ((:driver_temperature __driver_temperature) 0.0)
    ((:driver_state __driver_state) 0)
    )
   (send-super :init)
   (setq _motor_current (float __motor_current))
   (setq _motor_rpm (float __motor_rpm))
   (setq _motor_pulses (round __motor_pulses))
   (setq _motor_temperature (float __motor_temperature))
   (setq _driver_voltage (float __driver_voltage))
   (setq _driver_temperature (float __driver_temperature))
   (setq _driver_state (round __driver_state))
   self)
  (:motor_current
   (&optional __motor_current)
   (if __motor_current (setq _motor_current __motor_current)) _motor_current)
  (:motor_rpm
   (&optional __motor_rpm)
   (if __motor_rpm (setq _motor_rpm __motor_rpm)) _motor_rpm)
  (:motor_pulses
   (&optional __motor_pulses)
   (if __motor_pulses (setq _motor_pulses __motor_pulses)) _motor_pulses)
  (:motor_temperature
   (&optional __motor_temperature)
   (if __motor_temperature (setq _motor_temperature __motor_temperature)) _motor_temperature)
  (:driver_voltage
   (&optional __driver_voltage)
   (if __driver_voltage (setq _driver_voltage __driver_voltage)) _driver_voltage)
  (:driver_temperature
   (&optional __driver_temperature)
   (if __driver_temperature (setq _driver_temperature __driver_temperature)) _driver_temperature)
  (:driver_state
   (&optional __driver_state)
   (if __driver_state (setq _driver_state __driver_state)) _driver_state)
  (:serialization-length
   ()
   (+
    ;; float64 _motor_current
    8
    ;; float64 _motor_rpm
    8
    ;; uint16 _motor_pulses
    2
    ;; float64 _motor_temperature
    8
    ;; float64 _driver_voltage
    8
    ;; float64 _driver_temperature
    8
    ;; uint8 _driver_state
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _motor_current
       (sys::poke _motor_current (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _motor_rpm
       (sys::poke _motor_rpm (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint16 _motor_pulses
       (write-word _motor_pulses s)
     ;; float64 _motor_temperature
       (sys::poke _motor_temperature (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _driver_voltage
       (sys::poke _driver_voltage (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _driver_temperature
       (sys::poke _driver_temperature (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint8 _driver_state
       (write-byte _driver_state s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _motor_current
     (setq _motor_current (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _motor_rpm
     (setq _motor_rpm (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint16 _motor_pulses
     (setq _motor_pulses (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float64 _motor_temperature
     (setq _motor_temperature (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _driver_voltage
     (setq _driver_voltage (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _driver_temperature
     (setq _driver_temperature (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint8 _driver_state
     (setq _driver_state (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get car_agilex::ActuatorState :md5sum-) "9fbd9d68394311e2609797770a9092c6")
(setf (get car_agilex::ActuatorState :datatype-) "car_agilex/ActuatorState")
(setf (get car_agilex::ActuatorState :definition-)
      "float64 motor_current
float64 motor_rpm
uint16 motor_pulses
float64 motor_temperature

float64 driver_voltage
float64 driver_temperature
uint8 driver_state
")



(provide :car_agilex/ActuatorState "9fbd9d68394311e2609797770a9092c6")


