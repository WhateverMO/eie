
(cl:in-package :asdf)

(defsystem "car_agilex-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ActuatorState" :depends-on ("_package_ActuatorState"))
    (:file "_package_ActuatorState" :depends-on ("_package"))
    (:file "LightState" :depends-on ("_package_LightState"))
    (:file "_package_LightState" :depends-on ("_package"))
    (:file "ScoutState" :depends-on ("_package_ScoutState"))
    (:file "_package_ScoutState" :depends-on ("_package"))
  ))