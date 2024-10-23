loadI	 1024 => r0
loadI	 4 => r1
loadI	 2000 => r2
loadI	 0 => r3
loadI	 1 => r4
mult	 r3, r1 => r5
add	 r3, r4 => r3
mult	 r3, r1 => r6
add	 r3, r4 => r3
mult	 r3, r1 => r7
add	 r3, r4 => r3
mult	 r3, r1 => r8
add	 r3, r4 => r4
mult	 r4, r1 => r4
load	 r0 => r3
mult	 r3, r3 => r3
add	 r2, r5 => r5
store	 r3 => r5
add	 r0, r1 => r0
load	 r0 => r5
mult	 r5, r5 => r5
add	 r2, r6 => r6
store	 r5 => r6
add	 r0, r1 => r0
load	 r0 => r6
mult	 r6, r6 => r6
add	 r2, r7 => r7
store	 r6 => r7
add	 r0, r1 => r0
load	 r0 => r7
mult	 r7, r7 => r7
add	 r2, r8 => r8
store	 r7 => r8
add	 r0, r1 => r1
load	 r1 => r1
mult	 r1, r1 => r1
add	 r2, r4 => r4
store	 r1 => r4
output	 2000
output	 2004
output	 2008
output	 2012
output	 2016
