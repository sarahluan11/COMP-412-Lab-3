loadI	 0 => r0
loadI	 4 => r1
loadI	 12 => r2
loadI	 1 => r3
loadI	 2000 => r4
store	 r2 => r4
add	 r4, r1 => r4
add	 r4, r1 => r1
store	 r1 => r4
output	 2000
output	 2004
