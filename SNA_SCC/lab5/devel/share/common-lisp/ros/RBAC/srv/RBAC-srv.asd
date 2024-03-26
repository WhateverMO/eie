
(cl:in-package :asdf)

(defsystem "RBAC-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "access" :depends-on ("_package_access"))
    (:file "_package_access" :depends-on ("_package"))
  ))