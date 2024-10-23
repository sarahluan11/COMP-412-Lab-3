loadI	 0 => r0
loadI	 1 => r1
add	 r1, r1 => r2
add	 r1, r1 => r3
add	 r1, r1 => r4
add	 r0, r1 => r1
loadI	 0 => r5
store	 r4 => r5
output	 0
loadI	 4 => r5
store	 r1 => r5
output	 4
