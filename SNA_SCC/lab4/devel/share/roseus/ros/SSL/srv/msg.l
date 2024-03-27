;; Auto-generated. Do not edit!


(when (boundp 'SSL::msg)
  (if (not (find-package "SSL"))
    (make-package "SSL"))
  (shadow 'msg (find-package "SSL")))
(unless (find-package "SSL::MSG")
  (make-package "SSL::MSG"))
(unless (find-package "SSL::MSGREQUEST")
  (make-package "SSL::MSGREQUEST"))
(unless (find-package "SSL::MSGRESPONSE")
  (make-package "SSL::MSGRESPONSE"))

(in-package "ROS")





(defclass SSL::msgRequest
  :super ros::object
  :slots (_request ))

(defmethod SSL::msgRequest
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

(defclass SSL::msgResponse
  :super ros::object
  :slots (_response ))

(defmethod SSL::msgResponse
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

(defclass SSL::msg
  :super ros::object
  :slots ())

(setf (get SSL::msg :md5sum-) "c86ebe885efd9f142a198542f73f2d7f")
(setf (get SSL::msg :datatype-) "SSL/msg")
(setf (get SSL::msg :request) SSL::msgRequest)
(setf (get SSL::msg :response) SSL::msgResponse)

(defmethod SSL::msgRequest
  (:response () (instance SSL::msgResponse :init)))

(setf (get SSL::msgRequest :md5sum-) "c86ebe885efd9f142a198542f73f2d7f")
(setf (get SSL::msgRequest :datatype-) "SSL/msgRequest")
(setf (get SSL::msgRequest :definition-)
      "uint8[] request
---
uint8[] response
")

(setf (get SSL::msgResponse :md5sum-) "c86ebe885efd9f142a198542f73f2d7f")
(setf (get SSL::msgResponse :datatype-) "SSL/msgResponse")
(setf (get SSL::msgResponse :definition-)
      "uint8[] request
---
uint8[] response
")



(provide :SSL/msg "c86ebe885efd9f142a198542f73f2d7f")


