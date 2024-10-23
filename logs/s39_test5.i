loadI	 3 => r0
loadI	 5 => r1
add	 r0, r1 => r2
add	 r0, r2 => r2
add	 r0, r1 => r3
add	 r0, r1 => r4
add	 r0, r1 => r5
add	 r0, r1 => r6
add	 r0, r1 => r7
add	 r7, r1 => r1
add	 r2, r0 => r0
loadI	 1076 => r2
store	 r0 => r2
output	 1076
