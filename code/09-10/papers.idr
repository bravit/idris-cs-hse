data PaperState =  Nil | Written | Reviewing
                | Accepted | Rejected

data PaperEvent : Type -> PaperState -> 
                       PaperState -> Type where
  Write  : PaperEvent () Nil Written
  Submit : PaperEvent () Written Reviewing 
  Accept : PaperEvent () Reviewing Accepted
  Reject : PaperEvent () Reviewing Rejected
  Revise : PaperEvent () Rejected Reviewing
  
  Pure : ty -> PaperEvent ty state state
  (>>=) : PaperEvent a state1 state2 -> 
          (a -> PaperEvent b state2 state3) ->
          PaperEvent b state1 state3
          

prog1 : PaperEvent () Nil Accepted
prog1 = do
   Write
   Submit
   Accept

prog2 : PaperEvent () Nil Accepted
prog2 = do
   Write
   Submit
   Reject
   Revise
   Accept

prog3 : PaperEvent () Nil Accepted
prog3 = do
   Write
   Submit
   Reject
   Revise
   Reject
   Revise
   Reject
   Revise
   Reject
   Revise
   Accept

