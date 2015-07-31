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

  )


