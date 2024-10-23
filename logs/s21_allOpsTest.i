loadI	 1024 => r0
loadI	 4 => r1
loadI	 3 => r2
loadI	 1 => r3
load	 r0 => r4
add	 r4, r1 => r4
sub	 r4, r2 => r2
mult	 r2, r1 => r1
lshift	 r1, r3 => r1
lshift	 r1, r3 => r1
rshift	 r1, r3 => r3
store	 r3 => r0
output	 1024
