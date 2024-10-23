loadI	 2000 => r0
load	 r0 => r1
loadI	 4 => r2
mult	 r1, r2 => r2
loadI	 1 => r1
mult	 r2, r1 => r1
loadI	 2004 => r3
load	 r3 => r3
store	 r3 => r2
load	 r2 => r4
store	 r3 => r1
load	 r1 => r3
mult	 r4, r3 => r3
store	 r3 => r2
load	 r1 => r1
store	 r1 => r0
output	 2000
output	 1004
