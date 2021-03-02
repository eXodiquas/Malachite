;;;; malachite.lisp

(in-package #:malachite)

(defparameter *current-scene* (create-scene :marketplace "assets/default.png"))
(defparameter *current-mouse-pos* (gamekit:vec2 0 0))

(gamekit:defgame test-game ()()
  (:viewport-width 1280)
  (:viewport-height 720)
  (:viewport-title "Malachite Test Game"))

(defmethod gamekit:post-initialize ((app test-game))
  (gamekit:bind-cursor (lambda (x y) (setf *current-mouse-pos* (gamekit:vec2 x y)))))

(defmethod gamekit:act ((app test-game)))

(defmethod gamekit:draw ((app test-game))
  (when *current-scene*
    (draw *current-scene*))
   (gamekit:draw-text (format nil "~A" *current-mouse-pos*) *current-mouse-pos*))
