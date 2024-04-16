
(cl:in-package :asdf)

(defsystem "OTA-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "msg" :depends-on ("_package_msg"))
    (:file "_package_msg" :depends-on ("_package"))
  ))