(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement

(define (zip pairs)
  'replace-this-line)


;; Problem 15

;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 15
  (define (func s i)
    (cond ((equal? s nil) nil)
        (else (cons (cons i (cons (car s) nil)) (func (cdr s) (+ i 1)))))
    )
    (func s 0)
  )
  ; END PROBLEM 15

;; Problem 16

;; Merge two lists LIST1 and LIST2 according to COMP and return
;; the merged lists.
(define (merge comp list1 list2)
  ; BEGIN PROBLEM 16
  (cond ((equal? list1 nil) list2)
        ((equal? list2 nil) list1)
        ((comp (car list1) (car list2)) (cons (car list1) (merge comp (cdr list1) list2)))
        (else (cons (car list2) (merge comp list1 (cdr list2))))
  )
  )
  ; END PROBLEM 16


(merge < '(1 5 7 9) '(4 8 10))
; expect (1 4 5 7 8 9 10)
(merge > '(9 7 5 1) '(10 8 4 3))
; expect (10 9 8 7 5 4 3 1)

;; Problem 17

(define (nondecreaselist s)
    ; BEGIN PROBLEM 17
    (if (null? s)
        '()
        (let ((rest (nondecreaselist (cdr s))))
            (if (null? rest) (list s)
            (if (> (car s) (car (car rest)))
                (cons (list (car s)) rest)
                (cons (cons (car s) (car rest)) (cdr rest))
            )
            )
        )
    )
    )
    ; END PROBLEM 17

;; Problem EC
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
        (cond ((atom? expr) expr)

              ((quoted? expr) expr)

              ((or (lambda? expr) (define? expr))
               (let ((form   (car expr))
                     (params (cadr expr))
                     (body   (cddr expr))
                    )
                    (append (list form params) (let-to-lambda body))
               )
              )
              ((let? expr)
               (let ((values (cadr expr))
                     (body   (cddr expr))
                    )
                 ; BEGIN PROBLEM 19
                    (cons (cons 'lambda (cons (map let-to-lambda (car (zip values)))(let-to-lambda body))) (map let-to-lambda (cadr (zip values))))
                 ; END PROBLEM 19
               )
              )
              (else
               ; BEGIN PROBLEM 19
               (map let-to-lambda expr)
               ; END PROBLEM 19
              )
        )
)

