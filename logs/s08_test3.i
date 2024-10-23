loadI	 0 => r0
loadI	 1 => r1
loadI	 1024 => r2
store	 r1 => r2
output	 1024
store	 r1 => r2
output	 1024
loadI	 17 => r3
store	 r1 => r2
output	 1024
lshift	 r1, r3 => r3
sub	 r3, r1 => r1
loadI	 4 => r3
add	 r2, r3 => r3
store	 r1 => r3
output	 1024
output	 1028
