loadI	 1024 => r0
loadI	 1028 => r1
loadI	 1032 => r2
load	 r0 => r3
load	 r1 => r1
load	 r2 => r2
store	 r1 => r0
output	 1024
add	 r3, r1 => r3
add	 r1, r2 => r1
store	 r1 => r0
output	 1024
add	 r3, r1 => r3
add	 r1, r2 => r1
store	 r1 => r0
output	 1024
add	 r3, r1 => r3
sub	 r1, r2 => r1
store	 r1 => r0
output	 1024
add	 r3, r1 => r3
sub	 r1, r2 => r2
store	 r2 => r0
output	 1024
add	 r3, r2 => r2
store	 r2 => r0
output	 1024
