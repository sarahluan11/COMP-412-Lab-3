loadI	 2000 => r0
load	 r0 => r1
loadI	 1 => r2
add	 r0, r2 => r3
add	 r3, r2 => r3
add	 r3, r2 => r3
add	 r3, r2 => r2
store	 r1 => r0
load	 r2 => r1
add	 r2, r1 => r3
add	 r3, r1 => r3
load	 r3 => r3
loadI	 12 => r4
add	 r0, r4 => r4
load	 r4 => r4
store	 r1 => r2
output	 2000
output	 2004
output	 2008
output	 2012
