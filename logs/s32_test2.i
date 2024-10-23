loadI	 1028 => r0
loadI	 2 => r1
loadI	 2 => r2
load	 r0 => r3
mult	 r0, r3 => r4
rshift	 r4, r2 => r2
add	 r2, r2 => r2
loadI	 1032 => r5
load	 r5 => r5
sub	 r5, r3 => r3
sub	 r1, r4 => r4
store	 r4 => r0
output	 1028
