(define target 200)
(define coins '(1 2 5 10 20 50 100 200))
(define ways (cons 1 (make-list target 0))) ; a 1 and 200 zeroes

(do ((coin coins (cdr coin)))
    ((null? coin))
  (do ((i (car coin) (+ i 1)))
      ((>= i (+ target 1)))
    (set! (list-ref ways i) (+ (list-ref ways i) (list-ref ways (- i (car coin)))))))

(display (list-ref ways (- (length ways) 1)))