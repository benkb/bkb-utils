(parameterize ([current-namespace (make-base-namespace)])
 (expand
  (datum->syntax
   #f
   '(module foo scheme
      (define a 3)
      (+ a 4)))))
