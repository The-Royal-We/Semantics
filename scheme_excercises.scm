#lang racket
;;2014 Autumn
(define add-numbers (λ (xs) (sum-numbers (flatten xs))))

(define sum-numbers 
  (λ (xs)
    (cond [(number? xs) xs]
          [(null? xs) 0]
          [(symbol? (car xs)) (sum-numbers (cdr xs))]
          (else
           (+ (car xs) (sum-numbers (cdr xs)))))))

; (add-numbers 17)
; (add-numbers '(17 1))
; (add-numbers '(a (1 (2) 3) 4))

;; 2014 January
(define deep-fetch (λ (pred xs)
                     (cond [(null? xs) '()]
                           [(pair? (car xs))
                            
                            (append (deep-fetch pred (car xs))
                                    (deep-fetch pred (cddr xs)))]
                           [else
                            (cond [(pred (car xs))
                                   (cons (car xs) (deep-fetch pred (cdr xs)))]
                                  [else
                                   (deep-fetch pred (cdr xs))])])))

; (deep-fetch number? '(the (quick 6 fox 8 9) slick 2))

; 2015 January

(define after-filter
  (λ (pred xs)
    (cond [(or (null? xs) (null? (cdr xs))) '()]
          [else
           (cond [(pred (car xs))
                  (cons (cadr xs) (after-filter pred (cdr xs)))]
                 [else (after-filter pred (cdr xs))])])))
; (after-filter number? '(a b 2 3 c 4 d))

; 2015 Autumn
(define reverse-with-count
  (λ (xs nums)
    (cond [(null? xs) '()]
          [else
           (append (reverse-with-count (cdr xs) (cdr nums)) (repeat (car xs) (car nums)))])))

(define repeat (λ (letter times)
                 (cond [(zero? times) '()]
                       [else
                        (cons letter (repeat letter (- times 1)))])))

; (reverse-with-count '(a b c) '(1 2 3))