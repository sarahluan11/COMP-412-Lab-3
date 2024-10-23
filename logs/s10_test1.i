loadI	 1 => r0
loadI	 2 => r1
loadI	 3 => r2
loadI	 4 => r3
add	 r0, r1 => r1
add	 r2, r3 => r3
add	 r1, r3 => r3
loadI	 2000 => r1
store	 r3 => r1
output	 2000
