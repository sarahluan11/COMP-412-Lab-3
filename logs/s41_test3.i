loadI	 1024 => r0
load	 r0 => r1
loadI	 4 => r2
add	 r2, r0 => r0
load	 r0 => r3
lshift	 r3, r1 => r3
lshift	 r1, r3 => r1
add	 r1, r3 => r3
mult	 r2, r3 => r3
mult	 r2, r1 => r1
store	 r3 => r0
sub	 r0, r2 => r2
store	 r1 => r2
output	 1024
output	 1028
