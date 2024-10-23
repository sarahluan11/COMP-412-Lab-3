loadI	 1 => r0
loadI	 2 => r1
lshift	 r0, r0 => r2
lshift	 r2, r0 => r3
lshift	 r3, r0 => r3
lshift	 r3, r0 => r3
lshift	 r3, r0 => r4
loadI	 2048 => r5
store	 r4 => r5
add	 r3, r4 => r4
loadI	 2052 => r5
store	 r4 => r5
add	 r0, r2 => r2
mult	 r3, r2 => r2
loadI	 2056 => r3
store	 r2 => r3
sub	 r2, r4 => r4
loadI	 2060 => r2
store	 r4 => r2
output	 2048
output	 2052
output	 2056
output	 2060
