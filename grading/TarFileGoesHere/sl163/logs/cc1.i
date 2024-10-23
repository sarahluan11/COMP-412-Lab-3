loadI	 1024 => r0
loadI	 128 => r1
loadI	 32 => r2
loadI	 1028 => r3
mult	 r2, r2 => r4
rshift	 r2, r4 => r4
lshift	 r2, r4 => r5
add	 r5, r4 => r4
sub	 r2, r4 => r4
store	 r4 => r3
load	 r3 => r3
add	 r3, r1 => r1
nop
store	 r1 => r0
output	 1024
