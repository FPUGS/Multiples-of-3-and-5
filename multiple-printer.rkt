#lang racket

(provide multiple-printer)
(provide multiple-modulos)
(require racket/sequence)

;@ A function that maps each of the functions in fs to each of the of the inputs
; in xs.
(define (tensor-map fs xs) (map (λ (f) (map f xs)) fs))

;@ A function that computes modulos of different moduli to different arguments.
(define (multiple-modulos modulos numargs)
  ; (define multlist '(3 5))

  ; Create single-input curried modulos to apply to each of the args
  (define modfuncs (map (lambda (x) (curryr modulo x)) modulos))

  (tensor-map modfuncs numargs)

  )

;@ A function that takes a list of two lists and zips the two lists together
; into a longer one.
(define zip-2 (lambda (listoflists) (map list (car listoflists) (cadr listoflists))))

(define (multiple-printer highnum)
  
  (map (lambda (modpair)
  ; produces lists for each modulus with the modulo of each number in a range
         ; from 1 through highnum
         (cond
           [(= (car modpair) (cadr modpair) 0) (displayln "CracklePop") modpair]
           [(= (car modpair) 0) (displayln "Crackle")]
           [(= (cadr modpair) 0) (displayln "Pop")]
           [else (displayln modpair)])
         ) (zip-2
            (multiple-modulos '(3 5)
                              (sequence->list (in-range 1 (add1 highnum))))))
  
  
  )


