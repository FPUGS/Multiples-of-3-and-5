#lang racket

(provide multiple-summer)

;@ the plan:
;@ . curry a modulo for every factor in multlist (O(n))
;@ . filter by calling each of the curried funcs on each of the items (O(mn))
;@ . sum the filtered resulting list (O(n))
;@ functional so this will be backwards

(define (multiple-summer highnum [multlist [3 5]])
  (define modfuncs (map (lambda (x) ;@ make some modulos
                          (curry modulo x)) multlist))
  
  (+
   
   )
  )
