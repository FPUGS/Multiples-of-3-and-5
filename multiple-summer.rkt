#lang racket

(require racket/sequence)
(provide multiple-summer)

;@ the plan:
;; . curry a modulo for every factor in multlist (O(n))
;; . filter by calling each of the curried funcs on each of the items (O(mn))
;; . sum the filtered resulting list (O(n))
;; functional so this will be backwards

(define (multiple-summer highnum) ; [multlist '(3 5)])
  (define multlist '(3 5))
  ;@ make some modulos
  (define modfuncs (map (lambda (x)
                          (curryr modulo x)) multlist))

  (sequence-fold + 0
                 (sequence-filter
                  (lambda (thisnum)
                    (equal? (apply-funcs-sum modfuncs thisnum) 0))
                  (in-range 1 highnum)) ;; generated sequence
                 ) ;; sum the numbers we got
  )

(define (apply-funcs-sum funclist onearg) ;@ applies a list of functions to an
                                          ;; argument, instead of the other way
                                          ;; around, then sums results
  (for/sum ([thisfunc funclist])
    (displayln onearg)
    (thisfunc onearg))
  )
