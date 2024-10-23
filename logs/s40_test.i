loadI	 0 => r0
loadI	 1 => r1
loadI	 4 => r2
loadI	 2000 => r3
add	 r0, r1 => r0
add	 r0, r1 => r1
add	 r1, r0 => r4
store	 r0 => r3
add	 r2, r3 => r3
store	 r1 => r3
add	 r2, r3 => r3
store	 r4 => r3
output	 2000
output	 2004
output	 2008
