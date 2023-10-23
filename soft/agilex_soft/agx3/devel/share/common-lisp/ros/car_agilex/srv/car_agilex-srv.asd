
(cl:in-package :asdf)

(defsystem "car_agilex-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ScoutLightCmd" :depends-on ("_package_ScoutLightCmd"))
    (:file "_package_ScoutLightCmd" :depends-on ("_package"))
    (:file "ScoutMotionCmd" :depends-on ("_package_ScoutMotionCmd"))
    (:file "_package_ScoutMotionCmd" :depends-on ("_package"))
  ))