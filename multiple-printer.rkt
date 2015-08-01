#lang racket

(provide multiple-printer)

(define (multiple-printer modulos numargs)
  ; (define multlist '(3 5))

  (define modfuncs (map (lambda (x) (curry (modulo x))) modulos))
  ; (map (lambda (thisarg)
  ;        (map modfuncs (lambda (thisfunc)
  ;                        (thisfunc thisarg)
  ;                        )
  ;             (list numargs))
  ;        ))
  ; (define (cinnabon-map fs xs) (for/list ([f (in-list fs)]) (map f xs)))
  (define (cinnabon-map fs xs) (map (λ (f) (map f xs)) fs)) 
  (cinnabon-map modfuncs numargs)
  
  ; (map (lambda (thisfunc)
  ;        (map thisfunc (list numargs))
  ;        ) (list modfuncs))

  ;(for/list ([thisfunc (in-list modfuncs)])
  ;  (displayln thisfunc)
  ;  (map thisfunc (list numargs))
  ;  )

;@ A function that takes a list of two lists and zips the two lists together
; into a longer one.
(define zip-2 (lambda (listoflists) (map list (car listoflists) (cadr listoflists))))

(define (multiple-printer highnum)
  ; produces lists for each modulus with the modulo of each number in a range
  ; from 1 through highnum
  (zip-2 (multiple-modulos '(3 5) (sequence->list (in-range 1 (add1 highnum)))))
  
  
  )


