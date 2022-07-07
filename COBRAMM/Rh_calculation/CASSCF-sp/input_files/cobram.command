!command
60 sp
1 optxg
51 6
53 10000MB
196 1
197 STO-3G
?command

!sander
minimization
&cntrl
imin = 1,
maxcyc = 0,
ntb = 0,
igb = 0,
ntr = 0,
ibelly = 1,
cut = 9
/
?sander

!molcas
&rasscf
Lumorb
SYMMETRY
1
SPIN
1
NACTEL
6 0 0
INACTIVE
79
ras2
6
CIROOT
2 2 1
Rlxroot=1
?molcas

