; The fraction 49/98 is a curious fraction, as an inexperienced mathematician in
; attempting to simplify it may incorrectly believe that 49/98 == 4/8, which is
; correct, is obtained by cancelling the 9s.
; We shall consider fractions like, 30/50 == 3/5 to be trivial examples.
; There are exactly four non-trivial examples of this type of fraction, less 
; than one in value, and containing two digits in the numerator and denominator.
; If the product of these four fractions is given in its lowest common terms, 
; find the value of the denominator.

(defun gen ()
  (loop for n from 10 below 100
          append (loop for d from 10 below 100
                         if (< n d)
                       collect (list n d))))

; turns two digit numbers into a list of two items
(defun pairify (num)
  (list (floor (/ num 10)) (mod num 10)))

; returns a shared value in two lists if one exists AND it is nonzero
(defun common-nonzero-digit (a b)
  (cond ((null (intersection a b)) nil)
        ((eq (car (intersection a b)) 0) nil)
        (t (car (intersection a b)))))

(defun helper (n d)
  (let* ((first-pair (pairify n))
         (second-pair (pairify d))
         (digit (common-nonzero-digit first-pair second-pair))
         (first (car (remove digit first-pair :count 1)))
         (second (car (remove digit second-pair :count 1))))
    (and (not (null digit))
         (not (eq second 0))
         (equalp (/ first second) (/ n d)))))

(defun iter ()
  (let* ((pairs (gen))
         (filtered-pairs (remove-if-not (lambda (pair) (helper (car pair) (cadr pair))) pairs))
         (reduced-pairs (reduce (lambda (acc pair) (* acc (/ (car pair) (cadr pair)))) filtered-pairs :initial-value 1)))
    (denominator reduced-pairs)))