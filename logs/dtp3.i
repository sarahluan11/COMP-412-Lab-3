loadI	 2000 => r0
load	 r0 => r1
loadI	 4 => r2
add	 r1, r2 => r2
loadI	 8 => r3
add	 r1, r3 => r3
loadI	 2004 => r1
load	 r1 => r1
store	 r1 => r2
load	 r2 => r4
store	 r1 => r3
load	 r3 => r1
add	 r4, r1 => r1
store	 r1 => r2
load	 r3 => r3
store	 r3 => r0
output	 2000
