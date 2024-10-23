loadI	 1024 => r0
loadI	 20 => r1
loadI	 5 => r2
add	 r1, r2 => r2
loadI	 4 => r3
mult	 r3, r2 => r2
sub	 r2, r1 => r1
mult	 r1, r3 => r3
store	 r3 => r0
output	 1024
