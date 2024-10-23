loadI	 1020 => r0
loadI	 4 => r1
store	 r1 => r0
store	 r1 => r0
store	 r1 => r0
load	 r0 => r1
output	 1020
add	 r0, r1 => r2
load	 r2 => r3
mult	 r3, r1 => r3
store	 r3 => r2
output	 1024
add	 r0, r1 => r0
load	 r0 => r2
sub	 r0, r1 => r0
load	 r0 => r3
load	 r0 => r4
add	 r3, r2 => r2
load	 r0 => r3
add	 r0, r1 => r0
load	 r0 => r5
add	 r0, r1 => r0
add	 r1, r4 => r4
load	 r0 => r1
store	 r2 => r0
output	 1028
