loadI	 1044 => r0
load	 r0 => r1
loadI	 2 => r2
rshift	 r0, r2 => r3
loadI	 1048 => r4
load	 r4 => r4
sub	 r4, r2 => r2
loadI	 5 => r4
mult	 r2, r4 => r4
sub	 r4, r3 => r3
store	 r3 => r0
output	 1044
