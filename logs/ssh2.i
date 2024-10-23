loadI	 2048 => r0
loadI	 4 => r1
load	 r0 => r2
add	 r0, r1 => r0
load	 r0 => r3
add	 r0, r1 => r0
load	 r0 => r4
add	 r2, r3 => r3
mult	 r3, r4 => r4
loadI	 1 => r3
rshift	 r4, r3 => r3
add	 r0, r1 => r0
store	 r3 => r0
loadI	 2 => r2
mult	 r3, r2 => r2
sub	 r4, r2 => r2
add	 r0, r1 => r1
store	 r2 => r1
nop
output	 2060
output	 2064
