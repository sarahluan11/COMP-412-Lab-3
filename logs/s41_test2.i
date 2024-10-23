loadI	 1024 => r0
loadI	 166 => r1
loadI	 5 => r2
mult	 r1, r2 => r3
store	 r3 => r0
loadI	 4 => r3
add	 r0, r3 => r0
mult	 r2, r2 => r2
rshift	 r2, r3 => r2
sub	 r1, r2 => r2
store	 r2 => r0
sub	 r0, r3 => r3
load	 r3 => r0
add	 r0, r1 => r1
store	 r1 => r3
output	 1024
output	 1028
