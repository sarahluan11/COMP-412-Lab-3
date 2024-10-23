loadI	 1 => r0
loadI	 1 => r1
add	 r0, r1 => r0
add	 r0, r1 => r0
add	 r0, r1 => r0
add	 r0, r1 => r0
add	 r0, r1 => r1
loadI	 1000 => r0
store	 r1 => r0
output	 1000
loadI	 2000 => r0
loadI	 2004 => r1
loadI	 2008 => r2
loadI	 1 => r3
loadI	 3 => r4
loadI	 5 => r5
loadI	 2 => r6
loadI	 4 => r7
loadI	 6 => r8
add	 r3, r6 => r6
add	 r4, r7 => r7
add	 r5, r8 => r8
store	 r6 => r0
store	 r7 => r1
store	 r8 => r2
output	 2000
output	 2004
output	 2008
loadI	 3000 => r2
loadI	 3004 => r8
load	 r2 => r1
load	 r8 => r7
add	 r2, r1 => r1
add	 r8, r7 => r7
store	 r1 => r2
store	 r7 => r8
output	 3000
output	 3004
