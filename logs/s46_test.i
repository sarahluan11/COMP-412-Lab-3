loadI	 1024 => r0
loadI	 1028 => r1
load	 r0 => r0
load	 r1 => r1
loadI	 1032 => r2
loadI	 1036 => r3
loadI	 1040 => r4
add	 r0, r1 => r5
store	 r5 => r2
output	 1032
sub	 r0, r1 => r2
store	 r2 => r3
output	 1036
mult	 r0, r1 => r1
store	 r1 => r4
output	 1040
