loadI	 4 => r0
loadI	 2000 => r1
load	 r1 => r2
add	 r1, r0 => r1
load	 r1 => r3
add	 r1, r0 => r1
load	 r1 => r4
add	 r1, r0 => r1
load	 r1 => r5
add	 r1, r0 => r1
load	 r1 => r6
add	 r1, r0 => r1
load	 r1 => r7
add	 r1, r0 => r1
add	 r1, r0 => r0
add	 r2, r3 => r3
add	 r3, r4 => r4
add	 r4, r5 => r5
mult	 r6, r7 => r7
store	 r5 => r1
store	 r7 => r0
output	 2024
output	 2028
