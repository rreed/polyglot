(define (ways coins n)
  (cond
    ((null? coins) (if (= n 0) 1 0))
    (else
     (let ((coin (car coins))
           (otherCoins (cdr coins)))
       (let loop ((i 0)      
                  (sum 0))
         (if (> (* i coin) n)
             sum
             (loop (+ i 1)                        
                   (+ sum (ways otherCoins (- n (* i coin)))))))))))

(display (ways '(1 2 5 10 20 50 100 200) 200))