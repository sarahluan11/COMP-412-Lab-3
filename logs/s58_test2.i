loadI	 1024 => r0
loadI	 1028 => r1
load	 r0 => r0
load	 r1 => r1
loadI	 1032 => r2
loadI	 1036 => r3
loadI	 1040 => r4
loadI	 1044 => r5
store	 r0 => r2
add	 r0, r1 => r0
store	 r0 => r3
add	 r0, r1 => r0
store	 r0 => r4
store	 r1 => r5
output	 1032
output	 1036
output	 1040
output	 1044
load	 r2 => r0
lshift	 r0, r1 => r1
load	 r3 => r3
mult	 r1, r3 => r3
load	 r4 => r4
mult	 r3, r4 => r4
load	 r5 => r5
mult	 r4, r5 => r5
store	 r5 => r2
output	 1032