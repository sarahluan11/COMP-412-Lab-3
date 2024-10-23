loadI	 1 => r0
loadI	 4 => r1
loadI	 10 => r2
loadI	 0 => r3
loadI	 3200 => r4
store	 r3 => r4
output	 3200
loadI	 2048 => r5
load	 r5 => r6
mult	 r0, r6 => r6
add	 r3, r6 => r6
store	 r6 => r4
output	 3200
add	 r5, r1 => r5
mult	 r0, r2 => r0
load	 r5 => r3
mult	 r0, r3 => r3
add	 r6, r3 => r3
store	 r3 => r4
output	 3200
add	 r5, r1 => r5
mult	 r0, r2 => r0
load	 r5 => r6
mult	 r0, r6 => r6
add	 r3, r6 => r6
store	 r6 => r4
output	 3200
add	 r5, r1 => r5
mult	 r0, r2 => r0
load	 r5 => r3
mult	 r0, r3 => r3
add	 r6, r3 => r3
store	 r3 => r4
output	 3200
add	 r5, r1 => r1
mult	 r0, r2 => r2
load	 r1 => r1
mult	 r2, r1 => r1
add	 r3, r1 => r1
store	 r1 => r4
output	 3200
