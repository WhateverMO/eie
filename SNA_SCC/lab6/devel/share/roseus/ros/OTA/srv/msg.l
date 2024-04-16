;; Auto-generated. Do not edit!


(when (boundp 'OTA::msg)
  (if (not (find-package "OTA"))
    (make-package "OTA"))
  (shadow 'msg (find-package "OTA")))
(unless (find-package "OTA::MSG")
  (make-package "OTA::MSG"))
(unless (find-package "OTA::MSGREQUEST")
  (make-package "OTA::MSGREQUEST"))
(unless (find-package "OTA::MSGRESPONSE")
  (make-package "OTA::MSGRESPONSE"))

(in-package "ROS")





(defclass OTA::msgRequest
  :super ros::object
  :slots (_request ))

(defmethod OTA::msgRequest
  (:init
   (&key
    ((:request __request) (make-array 0 :initial-element 0 :element-type :char))
    )
   (send-super :init)
   (setq _request __request)
   self)
  (:request
   (&optional __request)
   (if __request (setq _request __request)) _request)
  (:serialization-length
   ()
   (+
    ;; uint8[] _request
    (* 1    (length _request)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8[] _request
     (write-long (length _request) s)
     (princ _request s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8[] _request
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _request (make-array n :element-type :char))
     (replace _request buf :start2 ptr-) (incf ptr- n))
   ;;
   self)
  )

(defclass OTA::msgResponse
  :super ros::object
  :slots (_response ))

(defmethod OTA::msgResponse
  (:init
   (&key
    ((:response __response) (make-array 0 :initial-element 0 :element-type :char))
    )
   (send-super :init)
   (setq _response __response)
   self)
  (:response
   (&optional __response)
   (if __response (setq _response __response)) _response)
  (:serialization-length
   ()
   (+
    ;; uint8[] _response
    (* 1    (length _response)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8[] _response
     (write-long (length _response) s)
     (princ _response s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8[] _response
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _response (make-array n :element-type :char))
     (replace _response buf :start2 ptr-) (incf ptr- n))
   ;;
   self)
  )

(defclass OTA::msg
  :super ros::object
  :slots ())

(setf (get OTA::msg :md5sum-) "c86ebe885efd9f142a198542f73f2d7f")
(setf (get OTA::msg :datatype-) "OTA/msg")
(setf (get OTA::msg :request) OTA::msgRequest)
(setf (get OTA::msg :response) OTA::msgResponse)

(defmethod OTA::msgRequest
  (:response () (instance OTA::msgResponse :init)))

(setf (get OTA::msgRequest :md5sum-) "c86ebe885efd9f142a198542f73f2d7f")
(setf (get OTA::msgRequest :datatype-) "OTA/msgRequest")
(setf (get OTA::msgRequest :definition-)
      "uint8[] request
---
uint8[] response
")

(setf (get OTA::msgResponse :md5sum-) "c86ebe885efd9f142a198542f73f2d7f")
(setf (get OTA::msgResponse :datatype-) "OTA/msgResponse")
(setf (get OTA::msgResponse :definition-)
      "uint8[] request
---
uint8[] response
")



(provide :OTA/msg "c86ebe885efd9f142a198542f73f2d7f")


