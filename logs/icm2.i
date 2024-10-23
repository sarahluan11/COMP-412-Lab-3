loadI	 2004 => r0
load	 r0 => r1
loadI	 4 => r2
sub	 r0, r2 => r0
load	 r0 => r0
loadI	 1024 => r3
lshift	 r1, r0 => r4
add	 r1, r4 => r4
store	 r4 => r3
lshift	 r4, r0 => r1
add	 r4, r1 => r1
add	 r3, r2 => r3
store	 r1 => r3
lshift	 r1, r0 => r4
add	 r1, r4 => r4
add	 r3, r2 => r3
store	 r4 => r3
lshift	 r4, r0 => r0
add	 r4, r0 => r0
add	 r3, r2 => r2
store	 r0 => r2
output	 1024
output	 1028
output	 1032
output	 1036
