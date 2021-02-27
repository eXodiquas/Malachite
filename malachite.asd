;;;; malachite.asd

(asdf:defsystem #:malachite
  :description "Simple library to build 2d point and click graphic adventure games."
  :author "Timo Netzer <exodiquas@gmail.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on ("trivial-gamekit")
  :components ((:file "package")
               (:file "malachite")))
