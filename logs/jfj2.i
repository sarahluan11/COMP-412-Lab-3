loadI	 1028 => r0
loadI	 7 => r1
store	 r1 => r0
output	 1028
loadI	 6 => r1
loadI	 4 => r2
mult	 r1, r2 => r2
loadI	 1 => r1
loadI	 2 => r3
mult	 r0, r3 => r3
rshift	 r3, r1 => r1
add	 r1, r2 => r1
loadI	 50 => r3
sub	 r1, r2 => r2
store	 r3 => r2
output	 1028
