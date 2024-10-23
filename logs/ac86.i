loadI	 1000 => r0
load	 r0 => r0
loadI	 1004 => r1
load	 r1 => r1
loadI	 1008 => r2
loadI	 1012 => r3
loadI	 1016 => r4
load	 r4 => r4
loadI	 1020 => r5
add	 r0, r0 => r6
add	 r0, r1 => r1
add	 r1, r4 => r4
store	 r4 => r5
output	 1004
output	 1008
output	 1012
output	 1016
output	 1020
