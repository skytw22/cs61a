(define (filter-lst fn lst)
  (cond ((equal? lst nil) nil)
        ((equal? #f (fn (car lst))) (filter-lst fn (cdr lst)))
        (else (cons (car lst) (filter-lst fn (cdr lst))))
  )
)

;;; Tests
(define (even? x)
  (= (modulo x 2) 0))
(filter-lst even? '(0 1 1 2 3 5 8))
; expect (0 2 8)


(define (interleave first second)
  (cond ((equal? first nil) second)
        ((equal? second nil) first)
        (else (cons (car first) (interleave second (cdr first))))
  )
)

(interleave (list 1 3 5) (list 2 4 6))
; expect (1 2 3 4 5 6)

(interleave (list 1 3 5) nil)
; expect (1 3 5)

(interleave (list 1 3 5) (list 2 4))
; expect (1 2 3 4 5)


(define (accumulate combiner start n term)
  (define (helper combiner n term)
          (cond ((and (equal? + combiner) (= n 0)) 0)
                ((and (equal? * combiner) (= n 0)) 1)
                (else (combiner (term n) (helper combiner (- n 1) term)))))
  (combiner start (helper combiner n term))
)


(define (no-repeats lst)
  (if (equal? lst nil) nil
      (cons (car lst) (no-repeats (filter-lst (lambda (x) (not (= (car lst) x))) (cdr lst))))
  )
)

