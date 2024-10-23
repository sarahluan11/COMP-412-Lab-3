loadI	 1 => r0
loadI	 10 => r1
mult	 r0, r1 => r2
mult	 r2, r1 => r3
mult	 r3, r1 => r4
mult	 r4, r1 => r5
mult	 r5, r1 => r6
mult	 r6, r1 => r1
add	 r0, r1 => r1
loadI	 1024 => r0
store	 r1 => r0
output	 1024
add	 r1, r6 => r6
add	 r6, r2 => r2
store	 r2 => r0
output	 1024
add	 r2, r5 => r5
add	 r5, r3 => r3
store	 r3 => r0
output	 1024
add	 r3, r4 => r4
store	 r4 => r0
output	 1024
store	 r3 => r0
output	 1024
store	 r2 => r0
output	 1024
store	 r1 => r0
output	 1024
