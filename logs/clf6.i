loadI	 4 => r0
loadI	 1 => r1
nop
add	 r0, r0 => r2
sub	 r0, r1 => r3
mult	 r2, r3 => r3
lshift	 r3, r1 => r3
rshift	 r3, r1 => r1
loadI	 132 => r3
store	 r1 => r3
output	 132
load	 r3 => r1
add	 r1, r0 => r0
store	 r0 => r3
output	 132
