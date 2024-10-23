loadI	 1024 => r0
loadI	 16 => r1
loadI	 0 => r2
mult	 r1, r1 => r1
add	 r1, r2 => r3
sub	 r3, r0 => r3
rshift	 r3, r2 => r2
lshift	 r1, r2 => r2
mult	 r1, r2 => r2
add	 r2, r1 => r1
sub	 r1, r2 => r2
store	 r2 => r0
output	 1024
