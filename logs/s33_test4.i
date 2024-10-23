loadI	 2000 => r0
loadI	 3000 => r1
store	 r1 => r0
output	 2000
loadI	 2 => r2
sub	 r1, r0 => r1
mult	 r1, r2 => r1
loadI	 1 => r3
lshift	 r2, r3 => r3
mult	 r1, r3 => r3
store	 r3 => r0
output	 2000
