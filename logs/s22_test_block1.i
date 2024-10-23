loadI	 2048 => r0
loadI	 4 => r1
load	 r0 => r2
add	 r0, r1 => r0
load	 r0 => r3
add	 r0, r1 => r0
load	 r0 => r4
add	 r0, r1 => r0
load	 r0 => r5
add	 r0, r1 => r0
load	 r0 => r6
mult	 r2, r2 => r2
mult	 r3, r3 => r3
mult	 r4, r4 => r7
mult	 r5, r5 => r5
mult	 r6, r6 => r6
loadI	 0 => r8
store	 r2 => r8
add	 r8, r1 => r8
add	 r2, r3 => r2
store	 r2 => r8
add	 r8, r1 => r8
add	 r7, r2 => r2
store	 r2 => r8
add	 r8, r1 => r8
add	 r5, r2 => r2
store	 r2 => r8
add	 r8, r1 => r1
add	 r6, r2 => r2
store	 r2 => r1
output	 0
output	 4
output	 8
output	 12
output	 16
