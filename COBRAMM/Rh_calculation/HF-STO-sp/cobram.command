!command
60 sp           nb opt cyc 
1 optxg         calculation type mdv for dynamic, or optxg for geometry optimization
51 6            QM program 1 gaussian, 6 molcas
53 3900MB       memory 
196 1		ricd
197 STO-3G	basis set 
?command

!sander
minimization
&cntrl
imin   = 1,
maxcyc = 0,
ntb    = 0,
igb    = 0,
ntr    = 0,
ibelly = 1,
cut    = 9
/
?sander

!molcas
&scf
 charge 
  1
?molcas
