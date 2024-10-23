loadI	 2048 => r0
loadI	 2052 => r1
loadI	 2 => r2
loadI	 4 => r3
add	 r2, r2 => r4
sub	 r4, r2 => r4
mult	 r4, r2 => r4
lshift	 r4, r2 => r4
rshift	 r4, r2 => r4
loadI	 9 => r5
lshift	 r4, r5 => r5
store	 r5 => r0
output	 2048
add	 r3, r3 => r0
sub	 r0, r3 => r0
mult	 r0, r3 => r0
lshift	 r0, r3 => r0
rshift	 r0, r3 => r0
loadI	 7 => r4
lshift	 r0, r4 => r4
loadI	 4 => r0
add	 r4, r0 => r0
store	 r0 => r1
output	 2052
store	 r2 => r5
load	 r0 => r0
store	 r3 => r0
output	 2048
output	 2052
