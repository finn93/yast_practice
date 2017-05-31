;ax^2 + bx + c = 0
;b^2 - 4ac >= 0
;(-b + sqrt(b^2 - 4ac)) / 2a
;(-b - sqrt(b^2 - 4ac)) / 2a

(define (quadric-equation a b c)
  	(if (zero? a)
  		'error
      	(let ((d (- (* b b) (* 4 a c))))
      		(if (negative? d)
      	        '()
      	    	(let ((e (/ b a -2)))
      	    		(if (zero? d)
      	    	    	(list e)
      	    	    	(let ((f (/ (sqrt d) a 2)))
      	    	    		(list (+ e f) (- e f)))))))))