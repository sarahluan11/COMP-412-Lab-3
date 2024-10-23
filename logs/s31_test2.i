loadI	 7 => r0
loadI	 4 => r1
add	 r0, r1 => r0
loadI	 2000 => r2
store	 r0 => r2
output	 2000
loadI	 2004 => r2
store	 r1 => r2
add	 r0, r1 => r1
output	 2000
output	 2004
