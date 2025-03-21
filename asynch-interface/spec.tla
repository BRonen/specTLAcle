---- MODULE spec ----
EXTENDS Naturals

CONSTANT Data
VARIABLES val, rdy, ack

TypeInvariant == /\ val \in Data
                 /\ rdy \in {0, 1}
                 /\ ack \in {0, 1}

----
Init == /\ val \in Data
        /\ rdy \in {0, 1}
        /\ ack = rdy

Send == /\ rdy = ack
        /\ val' \in Data
        /\ rdy' = 1 - rdy
        /\ UNCHANGED ack

Recv == /\ rdy # ack
        /\ ack' = rdy
        /\ UNCHANGED <<val, rdy>>

Next == Send \/ Recv

Spec == Init /\ [][Next]_<<val, rdy, ack>>

----
THEOREM Spec => []TypeInvariant
====
