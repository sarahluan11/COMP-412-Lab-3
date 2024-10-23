loadI	 1032 => r0
loadI	 1024 => r1
loadI	 1032 => r2
store	 r2 => r1
output	 1024
sub	 r2, r1 => r3
store	 r3 => r1
output	 1024
mult	 r2, r2 => r4
store	 r4 => r2
output	 1032
lshift	 r4, r2 => r5
rshift	 r4, r2 => r4
load	 r1 => r1
add	 r1, r3 => r3
store	 r3 => r2
output	 1032
