
(cl:in-package :asdf)

(defsystem "a3_p2-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "ExtractedLine" :depends-on ("_package_ExtractedLine"))
    (:file "_package_ExtractedLine" :depends-on ("_package"))
    (:file "ExtractedLines" :depends-on ("_package_ExtractedLines"))
    (:file "_package_ExtractedLines" :depends-on ("_package"))
  ))