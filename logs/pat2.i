loadI	 2000 => r0
loadI	 2004 => r1
loadI	 4 => r2
store	 r2 => r0
sub	 r1, r2 => r2
load	 r2 => r2
load	 r0 => r3
load	 r1 => r1
sub	 r2, r1 => r2
add	 r3, r1 => r4
mult	 r2, r4 => r4
mult	 r3, r3 => r3
mult	 r1, r1 => r1
sub	 r1, r3 => r3
add	 r3, r4 => r4
store	 r4 => r4
output	 2000
store	 r0 => r0
add	 r4, r4 => r4
output	 2000
store	 r4 => r4
output	 2000
