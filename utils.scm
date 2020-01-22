
; pipe first macro
(define-syntax |> 
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
