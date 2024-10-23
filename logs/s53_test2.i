loadI	 2048 => r0
load	 r0 => r1
loadI	 2 => r2
lshift	 r0, r2 => r3
loadI	 4 => r4
sub	 r0, r4 => r4
load	 r4 => r4
sub	 r4, r2 => r5
loadI	 8 => r6
mult	 r5, r6 => r6
add	 r2, r4 => r4
store	 r4 => r0
output	 2048
