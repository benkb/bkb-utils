let t1 = do_something1
and t2 = do_something2 in
bind t1 (fun x -> bind t2 (fun y -> code))
