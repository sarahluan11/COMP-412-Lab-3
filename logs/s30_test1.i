loadI	 2048 => r0
loadI	 4 => r1
loadI	 2 => r2
load	 r0 => r3
add	 r0, r1 => r0
load	 r0 => r4
rshift	 r3, r2 => r3
rshift	 r4, r2 => r2
sub	 r3, r2 => r2
add	 r0, r1 => r1
store	 r2 => r1
output	 2056
