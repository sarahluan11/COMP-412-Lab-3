loadI	 4 => r0
loadI	 400 => r1
store	 r1 => r0
output	 4
loadI	 2 => r2
sub	 r1, r0 => r0
mult	 r1, r2 => r1
loadI	 1 => r3
lshift	 r2, r3 => r2
mult	 r1, r2 => r2
store	 r2 => r0
output	 4
output	 396
