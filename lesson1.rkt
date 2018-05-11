#lang sicp
;;;; Exercise 1.1

10; 10

(+ 5 3 4); 12

(- 9 1); 8

(/ 6 2); 3

(+ (* 2 4) (- 4 6)); 6

(define a 3); a = 3

(define b (+ a 1)); b = 4

(+ a b (* a b)); 19

(= a b); #f

(if (and (> b a) (< b (* a b)))
    b
    a); 4 

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25)); 16

(+ 2 (if (> b a) b a)); 6

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1)); 16

;;;; Exercise 1.2

(/
 (+ 5 4 (- 2 (- 3 (+ 6 4/5))))
 (* 3 (- 6 2) (- 2 7))); should be -37/150

;;;; Exercise 1.3 
(define (square a) (* a a))
(define (sum-square a b) (+ (square a) (square b)))

(define (sum-square-big x y z)
  (cond ((or (< x y z) (< x z y)) (sum-square y z))
        ((or (< y x z) (< y z x)) (sum-square x z))
        (else (sum-square x y))
       ))
(=
   41
   (sum-square-big 3 4 5)
   (sum-square-big 3 5 4)
   (sum-square-big 4 3 5)
   (sum-square-big 4 5 3)
   (sum-square-big 5 4 3)
   (sum-square-big 5 3 4)
); should be #t

;;;; Exercise 1.4

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; This expands from the inside out, the if returns an operator/function and adds when
; b is non-negative and subtracts b if b is negative

;;;; Exercise 1.5

(define (p) (p))

(define (test x y) 
  (if (= x 0) 
      0 
      y))

; Q: What would happen if you evaluaed (test 0 (p))
; A:
; The interpreter would hang if we are using applicative-order, the value of (p) will be
; evaluated immediately and p is an infinte loop. If using normal order, p would never be evaluated
; and the expression would result in 0







