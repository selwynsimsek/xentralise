#|
  This file is a part of xentralise project.
  Copyright (c) 2018 Selwyn Simsek (sgs16@ic.ac.uk)
|#

#|
  Author: Selwyn Simsek (sgs16@ic.ac.uk)
|#

(defsystem "xentralise"
  :version "0.1.0"
  :author "Selwyn Simsek"
  :license "MIT"
  :depends-on ("lime"
               "swank")
  :components ((:module "src"
                :components
                ((:file "xentralise"))))
  :description ""
  :long-description
  #.(read-file-string
     (subpathname *load-pathname* "README.markdown"))
  :in-order-to ((test-op (test-op "xentralise-test"))))
