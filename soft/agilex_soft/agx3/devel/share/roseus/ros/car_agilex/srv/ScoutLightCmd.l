;; Auto-generated. Do not edit!


(when (boundp 'car_agilex::ScoutLightCmd)
  (if (not (find-package "CAR_AGILEX"))
    (make-package "CAR_AGILEX"))
  (shadow 'ScoutLightCmd (find-package "CAR_AGILEX")))
(unless (find-package "CAR_AGILEX::SCOUTLIGHTCMD")
  (make-package "CAR_AGILEX::SCOUTLIGHTCMD"))
(unless (find-package "CAR_AGILEX::SCOUTLIGHTCMDREQUEST")
  (make-package "CAR_AGILEX::SCOUTLIGHTCMDREQUEST"))
(unless (find-package "CAR_AGILEX::SCOUTLIGHTCMDRESPONSE")
  (make-package "CAR_AGILEX::SCOUTLIGHTCMDRESPONSE"))

(in-package "ROS")





(defclass car_agilex::ScoutLightCmdRequest
  :super ros::object
  :slots (_enable_ctrl _front_mode _front_custom_value _rear_mode _rear_custom_value ))

(defmethod car_agilex::ScoutLightCmdRequest
  (:init
   (&key
    ((:enable_ctrl __enable_ctrl) nil)
    ((:front_mode __front_mode) 0)
    ((:front_custom_value __front_custom_value) 0)
    ((:rear_mode __rear_mode) 0)
    ((:rear_custom_value __rear_custom_value) 0)
    )
   (send-super :init)
   (setq _enable_ctrl __enable_ctrl)
   (setq _front_mode (round __front_mode))
   (setq _front_custom_value (round __front_custom_value))
   (setq _rear_mode (round __rear_mode))
   (setq _rear_custom_value (round __rear_custom_value))
   self)
  (:enable_ctrl
   (&optional __enable_ctrl)
   (if __enable_ctrl (setq _enable_ctrl __enable_ctrl)) _enable_ctrl)
  (:front_mode
   (&optional __front_mode)
   (if __front_mode (setq _front_mode __front_mode)) _front_mode)
  (:front_custom_value
   (&optional __front_custom_value)
   (if __front_custom_value (setq _front_custom_value __front_custom_value)) _front_custom_value)
  (:rear_mode
   (&optional __rear_mode)
   (if __rear_mode (setq _rear_mode __rear_mode)) _rear_mode)
  (:rear_custom_value
   (&optional __rear_custom_value)
   (if __rear_custom_value (setq _rear_custom_value __rear_custom_value)) _rear_custom_value)
  (:serialization-length
   ()
   (+
    ;; bool _enable_ctrl
    1
    ;; uint8 _front_mode
    1
    ;; uint8 _front_custom_value
    1
    ;; uint8 _rear_mode
    1
    ;; uint8 _rear_custom_value
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _enable_ctrl
       (if _enable_ctrl (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _front_mode
       (write-byte _front_mode s)
     ;; uint8 _front_custom_value
       (write-byte _front_custom_value s)
     ;; uint8 _rear_mode
       (write-byte _rear_mode s)
     ;; uint8 _rear_custom_value
       (write-byte _rear_custom_value s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _enable_ctrl
     (setq _enable_ctrl (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _front_mode
     (setq _front_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _front_custom_value
     (setq _front_custom_value (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _rear_mode
     (setq _rear_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _rear_custom_value
     (setq _rear_custom_value (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass car_agilex::ScoutLightCmdResponse
  :super ros::object
  :slots (_result ))

(defmethod car_agilex::ScoutLightCmdResponse
  (:init
   (&key
    ((:result __result) nil)
    )
   (send-super :init)
   (setq _result __result)
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; bool _result
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _result
       (if _result (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _result
     (setq _result (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass car_agilex::ScoutLightCmd
  :super ros::object
  :slots ())

(setf (get car_agilex::ScoutLightCmd :md5sum-) "2047fb36251c93f820b26cd1be3ecace")
(setf (get car_agilex::ScoutLightCmd :datatype-) "car_agilex/ScoutLightCmd")
(setf (get car_agilex::ScoutLightCmd :request) car_agilex::ScoutLightCmdRequest)
(setf (get car_agilex::ScoutLightCmd :response) car_agilex::ScoutLightCmdResponse)

(defmethod car_agilex::ScoutLightCmdRequest
  (:response () (instance car_agilex::ScoutLightCmdResponse :init)))

(setf (get car_agilex::ScoutLightCmdRequest :md5sum-) "2047fb36251c93f820b26cd1be3ecace")
(setf (get car_agilex::ScoutLightCmdRequest :datatype-) "car_agilex/ScoutLightCmdRequest")
(setf (get car_agilex::ScoutLightCmdRequest :definition-)
      "bool enable_ctrl

uint8 front_mode
uint8 front_custom_value
uint8 rear_mode
uint8 rear_custom_value

---

bool result
")

(setf (get car_agilex::ScoutLightCmdResponse :md5sum-) "2047fb36251c93f820b26cd1be3ecace")
(setf (get car_agilex::ScoutLightCmdResponse :datatype-) "car_agilex/ScoutLightCmdResponse")
(setf (get car_agilex::ScoutLightCmdResponse :definition-)
      "bool enable_ctrl

uint8 front_mode
uint8 front_custom_value
uint8 rear_mode
uint8 rear_custom_value

---

bool result
")



(provide :car_agilex/ScoutLightCmd "2047fb36251c93f820b26cd1be3ecace")


