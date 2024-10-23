loadI	 88 => r0
loadI	 1000 => r1
mult	 r1, r1 => r1
loadI	 0 => r2
add	 r1, r2 => r2
loadI	 1 => r3
rshift	 r1, r3 => r3
add	 r3, r2 => r2
store	 r2 => r0
output	 88
loadI	 3 => r3
rshift	 r1, r3 => r3
sub	 r2, r3 => r3
store	 r3 => r0
output	 88
loadI	 4 => r2
rshift	 r1, r2 => r2
add	 r3, r2 => r2
store	 r2 => r0
output	 88
loadI	 5 => r3
mult	 r3, r1 => r3
loadI	 7 => r4
rshift	 r3, r4 => r4
sub	 r2, r4 => r4
store	 r4 => r0
output	 88
loadI	 7 => r2
mult	 r2, r1 => r2
loadI	 8 => r3
rshift	 r2, r3 => r3
add	 r4, r3 => r3
store	 r3 => r0
output	 88
loadI	 21 => r4
mult	 r4, r1 => r4
loadI	 10 => r2
rshift	 r4, r2 => r2
sub	 r3, r2 => r2
store	 r2 => r0
output	 88
loadI	 33 => r3
mult	 r3, r1 => r3
loadI	 11 => r4
rshift	 r3, r4 => r4
add	 r2, r4 => r4
store	 r4 => r0
output	 88
loadI	 429 => r2
mult	 r2, r1 => r2
loadI	 15 => r3
rshift	 r2, r3 => r3
sub	 r4, r3 => r3
store	 r3 => r0
output	 88
loadI	 715 => r4
mult	 r4, r1 => r1
loadI	 16 => r4
rshift	 r1, r4 => r4
add	 r3, r4 => r4
store	 r4 => r0
output	 88
