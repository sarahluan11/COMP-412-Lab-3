loadI	 3000 => r0
loadI	 6 => r1
loadI	 1 => r2
loadI	 6 => r3
sub	 r1, r2 => r1
mult	 r3, r1 => r3
sub	 r1, r2 => r1
mult	 r3, r1 => r3
sub	 r1, r2 => r1
mult	 r3, r1 => r3
sub	 r1, r2 => r1
mult	 r3, r1 => r3
sub	 r1, r2 => r2
mult	 r3, r2 => r2
store	 r2 => r0
output	 3000
