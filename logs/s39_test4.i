loadI	 3 => r0
loadI	 5 => r1
add	 r0, r1 => r2
add	 r2, r1 => r2
add	 r0, r1 => r3
add	 r3, r1 => r1
add	 r1, r2 => r1
add	 r2, r0 => r0
loadI	 1076 => r2
store	 r0 => r2
output	 1076
