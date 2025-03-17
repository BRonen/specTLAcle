---- MODULE spec ----
EXTENDS Naturals
VARIABLE hr

HCini == hr \in (1 .. 12)
HCnxt == /\ hr' = IF hr = 12 THEN 1 ELSE hr + 1
         /\ HCini
HC == HCini /\ [][HCnxt]_hr

----
THEOREM HC => []HCini

====
