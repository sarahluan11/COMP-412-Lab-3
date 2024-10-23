loadI	 1024 => r0
load	 r0 => r1
loadI	 1028 => r2
load	 r2 => r3
add	 r1, r3 => r3
loadI	 1032 => r1
load	 r1 => r1
sub	 r3, r1 => r1
loadI	 2 => r3
mult	 r1, r3 => r3
loadI	 3 => r1
loadI	 4 => r4
lshift	 r3, r1 => r1
rshift	 r1, r4 => r4
store	 r4 => r0
load	 r0 => r0
store	 r0 => r2
output	 1024
output	 1028
