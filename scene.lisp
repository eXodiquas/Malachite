;;; scene.lisp

(in-package #:malachite)

(defclass scene ()
  ((scene-id
    :initarg :scene-id
    :reader scene-id)
   (scene-actors
    :initarg :scene-actors
    :accessor scene-actors
    :initform '())
   (background-image
    :initarg :background-image
    :reader background-image)))

(defun create-scene (id path)
  "creates a new scene, takes a path to the background image"
  (gamekit:define-image :background path)
  (make-instance 'scene
		 :scene-id id
		 :background-image :background))

(defmethod draw ((s scene))
  "draws a scene to the screen. Scale the canvas to fit the background image in size"
  (let ((x-ratio (/
		  (gamekit:viewport-width)
		  (gamekit:image-width (background-image s))))
	(y-ratio (/
		  (gamekit:viewport-height)
		  (gamekit:image-height (background-image s)))))
    (gamekit:scale-canvas x-ratio y-ratio)
    (gamekit:draw-image (gamekit:vec2 0 0) (background-image s))
    (loop for a in (scene-actors s) do
	  (draw a))))
