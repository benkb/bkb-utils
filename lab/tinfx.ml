open Lwt.Infix

let () =
  Lwt_main.run
    (Lwt_io.(read_line stdin) >>= Lwt_io.printl)

