loadI	 1024 => r0
load	 r0 => r1
loadI	 4 => r2
add	 r1, r2 => r2
load	 r1 => r1
load	 r1 => r3
load	 r2 => r4
add	 r3, r4 => r4
output	 1024
output	 1028
store	 r4 => r3
store	 r2 => r0
load	 r1 => r2
sub	 r2, r0 => r0
store	 r0 => r1
output	 1024
output	 1028
