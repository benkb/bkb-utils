open Lwt.Infix

let res = Lwt_io.print "a" >>= fun () -> Lwt_io.print "b";;
