loadI	 4000 => r0
load	 r0 => r1
loadI	 1000 => r2
add	 r0, r2 => r2
loadI	 2 => r3
loadI	 4 => r4
add	 r0, r2 => r5
mult	 r3, r0 => r6
mult	 r4, r2 => r4
add	 r4, r5 => r7
store	 r7 => r0
store	 r1 => r2
store	 r1 => r5
store	 r1 => r6
store	 r1 => r4
store	 r1 => r7
add	 r1, r0 => r0
mult	 r3, r1 => r1
store	 r0 => r7
output	 29000
store	 r1 => r4
output	 20000
output	 8000
output	 9000
output	 4000
output	 5000
