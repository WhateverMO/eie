;; Auto-generated. Do not edit!


(when (boundp 'RBAC::access)
  (if (not (find-package "RBAC"))
    (make-package "RBAC"))
  (shadow 'access (find-package "RBAC")))
(unless (find-package "RBAC::ACCESS")
  (make-package "RBAC::ACCESS"))
(unless (find-package "RBAC::ACCESSREQUEST")
  (make-package "RBAC::ACCESSREQUEST"))
(unless (find-package "RBAC::ACCESSRESPONSE")
  (make-package "RBAC::ACCESSRESPONSE"))

(in-package "ROS")





(defclass RBAC::accessRequest
  :super ros::object
  :slots (_user_id _otp_code _operation _resource _content ))

(defmethod RBAC::accessRequest
  (:init
   (&key
    ((:user_id __user_id) 0)
    ((:otp_code __otp_code) "")
    ((:operation __operation) "")
    ((:resource __resource) "")
    ((:content __content) "")
    )
   (send-super :init)
   (setq _user_id (round __user_id))
   (setq _otp_code (string __otp_code))
   (setq _operation (string __operation))
   (setq _resource (string __resource))
   (setq _content (string __content))
   self)
  (:user_id
   (&optional __user_id)
   (if __user_id (setq _user_id __user_id)) _user_id)
  (:otp_code
   (&optional __otp_code)
   (if __otp_code (setq _otp_code __otp_code)) _otp_code)
  (:operation
   (&optional __operation)
   (if __operation (setq _operation __operation)) _operation)
  (:resource
   (&optional __resource)
   (if __resource (setq _resource __resource)) _resource)
  (:content
   (&optional __content)
   (if __content (setq _content __content)) _content)
  (:serialization-length
   ()
   (+
    ;; uint32 _user_id
    4
    ;; string _otp_code
    4 (length _otp_code)
    ;; string _operation
    4 (length _operation)
    ;; string _resource
    4 (length _resource)
    ;; string _content
    4 (length _content)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _user_id
       (write-long _user_id s)
     ;; string _otp_code
       (write-long (length _otp_code) s) (princ _otp_code s)
     ;; string _operation
       (write-long (length _operation) s) (princ _operation s)
     ;; string _resource
       (write-long (length _resource) s) (princ _resource s)
     ;; string _content
       (write-long (length _content) s) (princ _content s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _user_id
     (setq _user_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _otp_code
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _otp_code (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _operation
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _operation (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _resource
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _resource (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _content
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _content (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass RBAC::accessResponse
  :super ros::object
  :slots (_result _message ))

(defmethod RBAC::accessResponse
  (:init
   (&key
    ((:result __result) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _result __result)
   (setq _message (string __message))
   self)
  (:result
   (&optional (__result :null))
   (if (not (eq __result :null)) (setq _result __result)) _result)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _result
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _result
       (if _result (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _result
     (setq _result (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass RBAC::access
  :super ros::object
  :slots ())

(setf (get RBAC::access :md5sum-) "a35aabb2e81bd422fdd731c4a33a3278")
(setf (get RBAC::access :datatype-) "RBAC/access")
(setf (get RBAC::access :request) RBAC::accessRequest)
(setf (get RBAC::access :response) RBAC::accessResponse)

(defmethod RBAC::accessRequest
  (:response () (instance RBAC::accessResponse :init)))

(setf (get RBAC::accessRequest :md5sum-) "a35aabb2e81bd422fdd731c4a33a3278")
(setf (get RBAC::accessRequest :datatype-) "RBAC/accessRequest")
(setf (get RBAC::accessRequest :definition-)
      "uint32 user_id
string otp_code
string operation
string resource
string content
---
bool result
string message
")

(setf (get RBAC::accessResponse :md5sum-) "a35aabb2e81bd422fdd731c4a33a3278")
(setf (get RBAC::accessResponse :datatype-) "RBAC/accessResponse")
(setf (get RBAC::accessResponse :definition-)
      "uint32 user_id
string otp_code
string operation
string resource
string content
---
bool result
string message
")



(provide :RBAC/access "a35aabb2e81bd422fdd731c4a33a3278")


