loadI	 5 => r0
loadI	 6 => r1
loadI	 7 => r2
mult	 r0, r1 => r3
mult	 r1, r2 => r2
add	 r0, r3 => r3
add	 r0, r2 => r2
add	 r3, r2 => r2
loadI	 0 => r3
store	 r2 => r3
output	 0
