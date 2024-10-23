loadI	 1024 => r0
loadI	 1028 => r1
loadI	 3 => r2
loadI	 6 => r3
mult	 r2, r3 => r2
sub	 r2, r3 => r3
store	 r3 => r0
store	 r2 => r1
output	 1024
output	 1028
