output	 1024
output	 1028
loadI	 1024 => r0
loadI	 1028 => r1
load	 r0 => r2
load	 r1 => r1
add	 r0, r2 => r3
store	 r3 => r0
sub	 r3, r2 => r2
store	 r2 => r0
output	 1024
output	 1028