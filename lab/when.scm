(use-modules (language tree-il)) 
(use-modules (ice-9 textual-ports))

(define-syntax when
  (syntax-rules ()
    ((_ test body ...) (if test (begin body ...)))))


 ;(let ((fd (open-file (list-ref args 1) "r"))))
(define codelist 
 (list 
  (let ((fd (open-file "mycode.scm" "r")))
      (let loop ((sexp (read fd)))
        (if (not (eof-object? sexp))
          (begin 
            sexp
            (loop (read fd)))
          #F)))))


(display codelist)

;(define mycode (call-with-input-file "mycode.scm" get-string-all))

;(display mycode)


;(define mycode
;   '(begin
;      (display "ffff")
;      (when (> 1 0)
;         (display "ffff"))))

;(display) 
; (tree-il->scheme
;  (macroexpand mycode))

;(display 
;   (expand mycode))))

