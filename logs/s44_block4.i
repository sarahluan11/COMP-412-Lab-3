loadI	 1024 => r0
loadI	 1028 => r1
load	 r0 => r0
load	 r1 => r1
sub	 r1, r0 => r2
add	 r2, r0 => r3
mult	 r3, r2 => r4
add	 r4, r0 => r5
mult	 r1, r5 => r5
sub	 r5, r3 => r3
loadI	 1032 => r1
store	 r3 => r1
store	 r5 => r1
loadI	 1036 => r1
store	 r2 => r1
output	 1024
output	 1028
add	 r4, r0 => r0
output	 1036
