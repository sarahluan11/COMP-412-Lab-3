loadI	 1024 => r0
loadI	 1028 => r1
loadI	 3 => r2
loadI	 4 => r3
loadI	 8 => r4
load	 r0 => r5
add	 r5, r2 => r5
add	 r5, r3 => r5
load	 r1 => r6
add	 r6, r2 => r2
add	 r2, r3 => r3
add	 r3, r4 => r4
store	 r5 => r0
store	 r4 => r1
output	 1024
output	 1028
