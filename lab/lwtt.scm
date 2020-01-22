(let ((t1 do_something1)
      (t2 do_something2))
  (bind t1 (lambda x)
        (bind t2 (lambda y code))))
