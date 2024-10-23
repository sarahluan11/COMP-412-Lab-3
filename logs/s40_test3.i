loadI	 1 => r0
loadI	 2 => r1
lshift	 r0, r0 => r2
lshift	 r2, r0 => r3
lshift	 r3, r0 => r3
lshift	 r3, r0 => r3
lshift	 r3, r0 => r3
loadI	 2048 => r4
store	 r3 => r4
mult	 r2, r0 => r0
mult	 r2, r0 => r0
mult	 r2, r0 => r0
mult	 r2, r0 => r0
mult	 r2, r0 => r0
loadI	 2052 => r2
store	 r0 => r2
sub	 r0, r3 => r3
loadI	 2056 => r0
store	 r3 => r0
output	 2048
output	 2052
output	 2056
