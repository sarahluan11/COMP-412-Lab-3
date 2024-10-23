loadI	 2000 => r0
loadI	 4 => r1
load	 r0 => r2
loadI	 1 => r3
loadI	 2 => r4
loadI	 3 => r5
add	 r0, r1 => r0
add	 r0, r1 => r6
add	 r6, r1 => r7
store	 r3 => r0
store	 r4 => r6
store	 r5 => r7
sub	 r0, r2 => r2
load	 r2 => r0
add	 r2, r1 => r2
add	 r2, r1 => r7
add	 r7, r1 => r1
store	 r3 => r2
store	 r4 => r7
store	 r5 => r1
output	 2004
output	 2008
output	 2012
output	 2000
