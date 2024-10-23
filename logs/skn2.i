loadI	 8 => r0
loadI	 16 => r1
loadI	 24 => r2
loadI	 32 => r3
loadI	 1 => r4
add	 r0, r1 => r0
mult	 r1, r2 => r1
add	 r2, r3 => r2
mult	 r3, r4 => r4
store	 r4 => r0
store	 r0 => r1
store	 r1 => r2
store	 r2 => r4
load	 r0 => r0
load	 r1 => r1
load	 r2 => r2
load	 r4 => r4
add	 r0, r1 => r3
add	 r1, r2 => r1
add	 r2, r4 => r2
add	 r4, r0 => r0
sub	 r2, r0 => r4
store	 r0 => r4
output	 352
sub	 r1, r3 => r4
store	 r2 => r4
output	 352
add	 r3, r2 => r2
store	 r1 => r2
output	 496
add	 r0, r1 => r1
store	 r3 => r1
output	 496
