loadI	 5 => r0
loadI	 15 => r1
loadI	 25 => r2
loadI	 35 => r3
add	 r0, r1 => r1
add	 r2, r3 => r3
mult	 r1, r3 => r3
loadI	 1024 => r1
store	 r3 => r1
output	 1024
