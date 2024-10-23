loadI	 4 => r0
loadI	 1024 => r1
load	 r1 => r2
store	 r2 => r1
add	 r0, r1 => r1
load	 r1 => r3
add	 r0, r1 => r1
load	 r1 => r4
add	 r0, r1 => r1
load	 r1 => r5
loadI	 0 => r6
add	 r6, r6 => r7
add	 r6, r0 => r6
add	 r2, r4 => r4
store	 r4 => r7
add	 r3, r5 => r5
store	 r5 => r6
output	 0
output	 4
