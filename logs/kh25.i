loadI	 1 => r0
add	 r0, r0 => r1
loadI	 1024 => r2
store	 r1 => r2
output	 1024
add	 r0, r1 => r3
add	 r1, r0 => r1
add	 r0, r3 => r4
add	 r3, r1 => r3
add	 r1, r0 => r1
store	 r3 => r2
output	 1024
add	 r0, r4 => r5
add	 r4, r3 => r4
add	 r3, r1 => r3
add	 r1, r0 => r1
add	 r0, r5 => r6
add	 r5, r4 => r5
add	 r4, r3 => r4
add	 r3, r1 => r3
add	 r1, r0 => r0
store	 r4 => r2
output	 1024
add	 r6, r5 => r6
add	 r5, r4 => r5
add	 r4, r3 => r4
add	 r3, r0 => r0
add	 r6, r5 => r6
add	 r5, r4 => r5
add	 r4, r0 => r0
store	 r5 => r2
output	 1024
add	 r6, r5 => r6
add	 r5, r0 => r0
add	 r6, r0 => r0
store	 r0 => r2
output	 1024
