(defpackage xentralise
  (:use #:cl)
  (:export '(#:connected-p #:start #:start-server #:stop #:stop-server #:evaluate-on-lisp)))
(in-package :xentralise)

;; blah blah blah.

(defparameter *current-port* nil)

(defun start (&key (port 4005) (server-host-name "localhost") ())
  "Starts a SWANK client that listens for connections on the given port, and establishes a SSH tunnel into the server."
  (swank:create-server :port (setf current-port port) :dont-close t)
  (establish-ssh-tunnel server-host-name))

(defun stop ()
  "Stops the currently running "
  (swank:stop-server *current-port*)
  (setf *current-port* nil))

(defun connected-p ()
  "Whether the Xentralise client is running."
  *current-port*)

(defun start-server ()
  "Starts a Xentralise server that listens for connections on the specified port.")
