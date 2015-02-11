#lang racket

(require racket/sequence)
(provide multiple-summer)

;@ the plan:
;@ . curry a modulo for every factor in multlist (O(n))
;@ . filter by calling each of the curried funcs on each of the items (O(mn))
;@ . sum the filtered resulting list (O(n))
;@ functional so this will be backwards

(define (multiple-summer highnum) ; [multlist '(3 5)])
  (define multlist '(3 5))
  ;@ make some modulos
  (define modfuncs (map (lambda (x)
                          (curry modulo x)) multlist))

  (+ (sequence-filter
   (lambda (thisnum)
     (equal? (for/sum ([thismod modfuncs])
               (thismod thisnum)) ;@ run each curried func on thisnum, sum
                                  ;result
             0)
   (in-range 1 highnum)) ;@ generated sequence
     ) ;@ sum the numbers we got
  )
)

;@ (for/sum ([thismod modfuncs]) (thismod thisnum))
