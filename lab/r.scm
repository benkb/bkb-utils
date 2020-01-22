(define result)
(define ll
   (with-input-from-file "mycode.scm"
      (lambda ()
         (reverse-list->string
            (let loop ((char (read-char)))
                (result '()))
            (if (eof-object? char)
               result
               (loop (read-char) (cons char result)))))))

(display ll)
