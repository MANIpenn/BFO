;;;; -*- Mode: LISP -*-
;;;;

(in-package :asdf)

;; bfo:**;**;*.* -> bfo/trunk/**/*.*

(setf (logical-pathname-translations "bfo")
      `(
	("**;*.*" ,(make-pathname :directory (append (butlast (pathname-directory *load-pathname*) 2) '(:wild-inferiors))
				    :name :wild
				    :type :wild))
	))

(defsystem :bfo
    :name "tools for maintaining/building bfo"
    :author "Alan Ruttenberg"
    :licence "BSD"
    :components
    ((:module jars 
	      :serial t
	      :pathname ""
	      :components
	      ((:jar-directory "lib")))
     (:module files :pathname ""
	      :depends-on (jars)
	      :components
	      ((:file "extract-reference-annotations")
	       (:file "process-axioms.lisp")
	       )))
    :depends-on (owl2))

;;;; eof