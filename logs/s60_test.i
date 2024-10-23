loadI	 1024 => r0
loadI	 1028 => r1
load	 r0 => r2
load	 r1 => r3
add	 r2, r3 => r4
loadI	 4 => r5
mult	 r4, r5 => r5
add	 r0, r5 => r5
store	 r2 => r5
load	 r5 => r2
store	 r3 => r5
store	 r2 => r1
output	 1024
output	 1028
output	 1032
output	 1036
output	 1040
output	 1044
output	 1048
output	 1052
