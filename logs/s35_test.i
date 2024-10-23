loadI	 1 => r0
loadI	 2 => r1
add	 r1, r1 => r1
add	 r1, r1 => r1
loadI	 1024 => r2
store	 r1 => r2
loadI	 2 => r3
add	 r3, r3 => r3
add	 r3, r1 => r1
store	 r1 => r2
output	 1024
