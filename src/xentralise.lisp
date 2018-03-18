(defpackage xentralise
  (:use #:cl)
  (:export '(#:connected-p #:start #:start-server #:stop #:stop-server #:evaluate-on-lisp)))
(in-package :xentralise)

;; blah blah blah.

(defparameter *current-port* nil)
(defparameter *current-server* nil)
 
(defun establish-ssh-tunnel (server-host-name port)
  "Establishes the remote SSH tunnel into the Xentralise server at server-host-name."
  #+windows
  (format t "Windows not yet supported.")
  #+ (or linux darwin)
  (uiop:run-program (format nil "ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -N -f ~A -R~D:localhost:~D" server-host-name port port)))

(defun start (&key (port 4005) (server-host-name "localhost"))
  "Starts a SWANK client that listens for connections on the given port, and establishes a SSH tunnel into the server."
  (swank:create-server :port (setf *current-port* port) :dont-close t)
  (establish-ssh-tunnel server-host-name port))

(defun stop ()
  "Stops the currently running "
  (swank:stop-server *current-port*)
  (setf *current-port* nil))

(defun connected-p ()
  "Whether the Xentralise client is running."
  *current-port*)

(defun start-server (&optional (range '(4000 5000)))
  "Starts a Xentralise server that listens for connections in the specified port range."
  (let ((start (car range))
        (end (cadr range)))
    ))

(defun handle-server-connections ())

(defun server-running-p ()
  "Whether the server is running or not.")

(defun stop-server ()
  "Stops the Xentralise server.")
