loadI	 344 => r0
loadI	 120 => r1
store	 r0 => r1
store	 r1 => r0
output	 120
output	 344
add	 r0, r1 => r1
add	 r0, r0 => r0
loadI	 8 => r2
store	 r2 => r2
add	 r2, r1 => r3
add	 r2, r0 => r4
sub	 r0, r2 => r0
add	 r2, r2 => r2
add	 r2, r0 => r2
store	 r1 => r3
store	 r3 => r4
store	 r0 => r2
output	 8
output	 472
output	 696
loadI	 1392 => r2
loadI	 3 => r0
mult	 r0, r1 => r4
mult	 r0, r0 => r3
loadI	 4 => r5
mult	 r3, r5 => r5
store	 r3 => r5
add	 r0, r3 => r3
store	 r2 => r3
store	 r3 => r2
store	 r4 => r4
output	 36
output	 12
output	 1392
loadI	 1 => r4
rshift	 r1, r4 => r1
lshift	 r1, r4 => r2
rshift	 r2, r4 => r4
store	 r1 => r1
store	 r2 => r4
store	 r4 => r2
output	 232
output	 464
sub	 r2, r1 => r4
loadI	 32 => r3
sub	 r1, r3 => r1
sub	 r2, r1 => r1
store	 r3 => r4
store	 r4 => r1
output	 232
output	 264
loadI	 1028 => r4
load	 r4 => r3
loadI	 0 => r2
mult	 r2, r3 => r3
add	 r3, r4 => r4
store	 r4 => r1
add	 r2, r2 => r2
add	 r2, r2 => r2
add	 r2, r2 => r2
add	 r2, r2 => r2
store	 r1 => r4
add	 r2, r2 => r2
add	 r2, r2 => r2
add	 r2, r2 => r2
add	 r2, r2 => r2
output	 264
output	 1028
