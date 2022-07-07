!command
60 300 
1 mdv
51 6
53 10000MB
196 1
197 STO-3G
83 1.0 
85 0 
100 10
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

