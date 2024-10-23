loadI	 1024 => r0
loadI	 1028 => r1
loadI	 1032 => r2
loadI	 1036 => r3
loadI	 1040 => r4
loadI	 1044 => r5
load	 r0 => r0
load	 r1 => r1
add	 r0, r1 => r6
store	 r6 => r2
sub	 r0, r1 => r1
store	 r1 => r3
mult	 r6, r1 => r1
store	 r1 => r4
mult	 r1, r1 => r1
store	 r1 => r5
output	 1024
output	 1028
output	 1032
output	 1036
output	 1040
output	 1044
