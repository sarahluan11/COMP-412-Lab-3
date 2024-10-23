loadI	 0 => r0
loadI	 4 => r1
loadI	 1024 => r2
load	 r2 => r2
loadI	 1028 => r3
load	 r3 => r3
loadI	 2000 => r4
store	 r2 => r4
add	 r2, r3 => r2
add	 r3, r0 => r3
add	 r2, r0 => r2
add	 r4, r1 => r4
store	 r3 => r4
add	 r3, r2 => r3
add	 r2, r0 => r2
add	 r3, r0 => r3
add	 r4, r1 => r4
store	 r2 => r4
add	 r2, r3 => r2
add	 r3, r0 => r3
add	 r2, r0 => r2
add	 r4, r1 => r4
store	 r3 => r4
add	 r3, r2 => r3
add	 r2, r0 => r2
add	 r3, r0 => r0
add	 r4, r1 => r1
store	 r2 => r1
output	 2000
output	 2004
output	 2008
