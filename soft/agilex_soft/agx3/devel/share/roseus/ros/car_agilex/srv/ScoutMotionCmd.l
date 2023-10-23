;; Auto-generated. Do not edit!


(when (boundp 'car_agilex::ScoutMotionCmd)
  (if (not (find-package "CAR_AGILEX"))
    (make-package "CAR_AGILEX"))
  (shadow 'ScoutMotionCmd (find-package "CAR_AGILEX")))
(unless (find-package "CAR_AGILEX::SCOUTMOTIONCMD")
  (make-package "CAR_AGILEX::SCOUTMOTIONCMD"))
(unless (find-package "CAR_AGILEX::SCOUTMOTIONCMDREQUEST")
  (make-package "CAR_AGILEX::SCOUTMOTIONCMDREQUEST"))
(unless (find-package "CAR_AGILEX::SCOUTMOTIONCMDRESPONSE")
  (make-package "CAR_AGILEX::SCOUTMOTIONCMDRESPONSE"))

(in-package "ROS")





(intern "*MAX_LINEAR_VELOCITY*" (find-package "CAR_AGILEX::SCOUTMOTIONCMDREQUEST"))
(shadow '*MAX_LINEAR_VELOCITY* (find-package "CAR_AGILEX::SCOUTMOTIONCMDREQUEST"))
(defconstant car_agilex::ScoutMotionCmdRequest::*MAX_LINEAR_VELOCITY* 1.5)
(intern "*MIN_LINEAR_VELOCITY*" (find-package "CAR_AGILEX::SCOUTMOTIONCMDREQUEST"))
(shadow '*MIN_LINEAR_VELOCITY* (find-package "CAR_AGILEX::SCOUTMOTIONCMDREQUEST"))
(defconstant car_agilex::ScoutMotionCmdRequest::*MIN_LINEAR_VELOCITY* -1.5)
(intern "*MAX_ANGULAR_VELOCITY*" (find-package "CAR_AGILEX::SCOUTMOTIONCMDREQUEST"))
(shadow '*MAX_ANGULAR_VELOCITY* (find-package "CAR_AGILEX::SCOUTMOTIONCMDREQUEST"))
(defconstant car_agilex::ScoutMotionCmdRequest::*MAX_ANGULAR_VELOCITY* 0.5235)
(intern "*MIN_ANGULAR_VELOCITY*" (find-package "CAR_AGILEX::SCOUTMOTIONCMDREQUEST"))
(shadow '*MIN_ANGULAR_VELOCITY* (find-package "CAR_AGILEX::SCOUTMOTIONCMDREQUEST"))
(defconstant car_agilex::ScoutMotionCmdRequest::*MIN_ANGULAR_VELOCITY* -0.5235)
(defclass car_agilex::ScoutMotionCmdRequest
  :super ros::object
  :slots (_linear_velocity _angular_velocity ))

(defmethod car_agilex::ScoutMotionCmdRequest
  (:init
   (&key
    ((:linear_velocity __linear_velocity) 0.0)
    ((:angular_velocity __angular_velocity) 0.0)
    )
   (send-super :init)
   (setq _linear_velocity (float __linear_velocity))
   (setq _angular_velocity (float __angular_velocity))
   self)
  (:linear_velocity
   (&optional __linear_velocity)
   (if __linear_velocity (setq _linear_velocity __linear_velocity)) _linear_velocity)
  (:angular_velocity
   (&optional __angular_velocity)
   (if __angular_velocity (setq _angular_velocity __angular_velocity)) _angular_velocity)
  (:serialization-length
   ()
   (+
    ;; float64 _linear_velocity
    8
    ;; float64 _angular_velocity
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _linear_velocity
       (sys::poke _linear_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angular_velocity
       (sys::poke _angular_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _linear_velocity
     (setq _linear_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angular_velocity
     (setq _angular_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass car_agilex::ScoutMotionCmdResponse
  :super ros::object
  :slots (_result ))

(defmethod car_agilex::ScoutMotionCmdResponse
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

(defclass car_agilex::ScoutMotionCmd
  :super ros::object
  :slots ())

(setf (get car_agilex::ScoutMotionCmd :md5sum-) "cda17c11be66f27fe21573aa44658f84")
(setf (get car_agilex::ScoutMotionCmd :datatype-) "car_agilex/ScoutMotionCmd")
(setf (get car_agilex::ScoutMotionCmd :request) car_agilex::ScoutMotionCmdRequest)
(setf (get car_agilex::ScoutMotionCmd :response) car_agilex::ScoutMotionCmdResponse)

(defmethod car_agilex::ScoutMotionCmdRequest
  (:response () (instance car_agilex::ScoutMotionCmdResponse :init)))

(setf (get car_agilex::ScoutMotionCmdRequest :md5sum-) "cda17c11be66f27fe21573aa44658f84")
(setf (get car_agilex::ScoutMotionCmdRequest :datatype-) "car_agilex/ScoutMotionCmdRequest")
(setf (get car_agilex::ScoutMotionCmdRequest :definition-)
      "float64 linear_velocity
float64 angular_velocity

float64 max_linear_velocity=1.5
float64 min_linear_velocity=-1.5
float64 max_angular_velocity=0.5235
float64 min_angular_velocity=-0.5235

---

bool result
")

(setf (get car_agilex::ScoutMotionCmdResponse :md5sum-) "cda17c11be66f27fe21573aa44658f84")
(setf (get car_agilex::ScoutMotionCmdResponse :datatype-) "car_agilex/ScoutMotionCmdResponse")
(setf (get car_agilex::ScoutMotionCmdResponse :definition-)
      "float64 linear_velocity
float64 angular_velocity

float64 max_linear_velocity=1.5
float64 min_linear_velocity=-1.5
float64 max_angular_velocity=0.5235
float64 min_angular_velocity=-0.5235

---

bool result
")



(provide :car_agilex/ScoutMotionCmd "cda17c11be66f27fe21573aa44658f84")


