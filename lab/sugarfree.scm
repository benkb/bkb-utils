(open Lwt_io)

(define p
 (Lwt.bind (read_line stdin)
  (lambda s1
   (Lwt.bind (read_line stdin)
    (lambda s2 (Lwt_io.printf "%s\n" (^ s1 s2)))))))

(Lwt_main.run p)
