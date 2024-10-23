loadI	 1024 => r0
loadI	 4 => r1
loadI	 2048 => r2
loadI	 8 => r3
load	 r0 => r4
store	 r3 => r2
add	 r1, r0 => r0
add	 r1, r3 => r3
sub	 r2, r1 => r2
store	 r3 => r2
store	 r4 => r0
loadI	 5 => r4
add	 r1, r0 => r5
add	 r1, r3 => r3
sub	 r2, r1 => r1
store	 r3 => r1
store	 r4 => r5
load	 r0 => r0
output	 1024
output	 1028
output	 1032
output	 2048
output	 2044
output	 2040
