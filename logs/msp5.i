loadI	 1024 => r0
load	 r0 => r1
sub	 r1, r1 => r2
add	 r2, r0 => r3
loadI	 1028 => r4
store	 r1 => r4
output	 1028
store	 r2 => r3
output	 1024
loadI	 0 => r3
mult	 r3, r1 => r1
add	 r1, r0 => r0
add	 r0, r0 => r0
store	 r1 => r0
output	 2048
