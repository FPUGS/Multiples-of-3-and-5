#lang racket
(require racket/sequence)
(provide multiple-summer)

;@ A function that maps each of the functions in fs to each of the of the inputs
; in xs.
(define (tensor-map fs xs) (map (λ (f) (map f xs)) fs))

;@ A function that computes modulos of different moduli to different arguments.
(define (multiple-modulos modulos numargs)
  ; Create single-input curried modulos to apply to each of the args
  (define modfuncs (map (lambda (x) (curryr modulo x)) modulos))
  (tensor-map modfuncs numargs))

;@ finally the main function. Takes as input the higher number N in the range
; from 1 to N.
(define (multiple-summer highnum)
  (apply + (filter (lambda (seqnum) ; since we need the sequence, map over it
         ; local binding for the modulos of that sequence val
         (let ([modpair (map car (multiple-modulos '(3 5) (list seqnum)))])
           (cond ; three conditions testing the modulo result
             [(= (car modpair) 0) #t]
             [(= (cadr modpair) 0) #t]
             [else #f])))
             ; convert sequence to list so map can be called. Sequences have
             ; lots of nice properties but here I just want to make an
             ; increasing list of numbers without typing too much.
             (sequence->list (in-range 1 (add1 highnum))))))

(multiple-summer 1000)
