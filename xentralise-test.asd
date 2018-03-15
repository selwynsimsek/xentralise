#|
  This file is a part of xentralise project.
  Copyright (c) 2018 Selwyn Simsek (sgs16@ic.ac.uk)
|#

(defsystem "xentralise-test"
  :defsystem-depends-on ("prove-asdf")
  :author "Selwyn Simsek"
  :license "MIT"
  :depends-on ("xentralise"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "xentralise"))))
  :description "Test system for xentralise"

  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
