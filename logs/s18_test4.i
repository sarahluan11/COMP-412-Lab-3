loadI	 2000 => r0
loadI	 4 => r1
loadI	 1024 => r2
loadI	 1028 => r3
load	 r2 => r2
load	 r3 => r3
store	 r2 => r0
add	 r1, r0 => r0
store	 r3 => r0
add	 r2, r3 => r4
mult	 r3, r4 => r4
add	 r1, r0 => r0
store	 r4 => r0
add	 r2, r3 => r5
add	 r5, r4 => r5
mult	 r5, r4 => r5
add	 r1, r0 => r0
store	 r5 => r0
add	 r2, r3 => r6
add	 r4, r6 => r6
add	 r5, r6 => r6
mult	 r5, r6 => r6
add	 r1, r0 => r0
store	 r6 => r0
add	 r2, r3 => r3
add	 r4, r3 => r3
add	 r5, r3 => r3
add	 r6, r3 => r3
mult	 r6, r3 => r3
add	 r1, r0 => r0
store	 r3 => r0
output	 2000
output	 2004
output	 2008
output	 2012
output	 2016
output	 2020
