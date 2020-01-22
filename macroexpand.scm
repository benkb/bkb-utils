#!/usr/bin/guile -s
!#
(use-modules (ice-9 pretty-print))
(use-modules (language tree-il)) 
(use-modules (ice-9 textual-ports))

(define args (command-line))

(define cc (list))

(if (< (length args) 2)
    (begin 
      (display "Not enough parameters, need a file name.")
      (newline))
    (let ((fd (open-file (list-ref args 1) "r")))
      (let loop ((sexp (read fd)))
        (if (not (eof-object? sexp))
          (begin 
             (set! cc (append cc (list sexp)))
             (loop (read fd))
           "fff")))))                              




(define-syntax -> 
  (syntax-rules ()
    ([_ value]
     value)
    ([_ value snd rest ...]
     (cond
      [(list? 'snd)
       (let ([f (primitive-eval (car 'snd))]
             [args (cons value (cdr 'snd))])
         (-> (apply f args) rest ...))]
      [(procedure? snd)
       (-> (snd value) rest ...)]))))

(define-syntax when
  (syntax-rules ()
    ((_ test body ...) (if test (begin body ...)))))


(define-syntax |>
  (syntax-rules ()
                ((_) #f)
                ((_ x) x)
                ((_ x (f . (f-rest ...))) (f x f-rest ...))
                ((_ x f) (f x))
                ((_ x (f . (f-rest ...)) rest ...) (|> (f x f-rest ...) rest ...))
                ((_ x f rest ...) (|> (f x) rest ...))))
                



(map 
   (lambda (x)
      (display  x)
      (newline))

   (tree-il->scheme
      (macroexpand cc)))

;(display 
;   (expand mycode))))

