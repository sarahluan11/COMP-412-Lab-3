loadI	 1024 => r0
loadI	 1028 => r1
load	 r0 => r2
load	 r1 => r3
add	 r2, r3 => r4
loadI	 4 => r5
mult	 r4, r5 => r5
add	 r0, r5 => r5
store	 r2 => r5
load	 r5 => r0
store	 r3 => r5
store	 r0 => r1
loadI	 2 => r1
loadI	 2 => r0
mult	 r1, r0 => r0
add	 r5, r0 => r0
store	 r2 => r0
loadI	 2 => r5
loadI	 2 => r1
mult	 r5, r1 => r1
add	 r0, r1 => r1
store	 r2 => r1
loadI	 2 => r0
loadI	 2 => r5
mult	 r0, r5 => r5
add	 r1, r5 => r5
store	 r2 => r5
loadI	 2 => r1
loadI	 2 => r0
mult	 r1, r0 => r0
add	 r5, r0 => r0
store	 r2 => r0
loadI	 2 => r5
loadI	 2 => r1
mult	 r5, r1 => r1
add	 r0, r1 => r1
store	 r2 => r1
loadI	 2 => r0
loadI	 2 => r5
mult	 r0, r5 => r5
add	 r1, r5 => r5
store	 r2 => r5
output	 1024
output	 1028
output	 1032
output	 1036
output	 1040
output	 1044
output	 1048
output	 1052
