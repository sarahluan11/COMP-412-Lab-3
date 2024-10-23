loadI	 2016 => r0
loadI	 8 => r1
loadI	 2000 => r2
loadI	 2004 => r3
load	 r0 => r4
sub	 r3, r4 => r4
sub	 r0, r1 => r5
sub	 r5, r1 => r5
store	 r0 => r4
store	 r1 => r5
load	 r4 => r4
add	 r0, r4 => r4
store	 r4 => r3
output	 2000
output	 2004
