loadI	 1024 => r0
loadI	 15 => r1
loadI	 20 => r2
add	 r1, r2 => r1
loadI	 18 => r3
sub	 r3, r2 => r2
mult	 r2, r1 => r1
store	 r1 => r0
output	 1024
