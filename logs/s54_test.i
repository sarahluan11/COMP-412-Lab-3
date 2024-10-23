loadI	 1024 => r0
loadI	 1028 => r1
loadI	 4 => r2
load	 r0 => r3
load	 r1 => r4
mult	 r3, r4 => r4
store	 r4 => r0
add	 r0, r2 => r0
add	 r1, r2 => r1
load	 r0 => r4
load	 r1 => r3
mult	 r4, r3 => r3
store	 r3 => r0
add	 r0, r2 => r0
add	 r1, r2 => r1
load	 r0 => r3
load	 r1 => r4
mult	 r3, r4 => r4
store	 r4 => r0
add	 r0, r2 => r0
add	 r1, r2 => r1
load	 r0 => r4
load	 r1 => r3
mult	 r4, r3 => r3
store	 r3 => r0
add	 r0, r2 => r0
add	 r1, r2 => r1
load	 r0 => r3
load	 r1 => r4
mult	 r3, r4 => r4
store	 r4 => r0
add	 r0, r2 => r0
add	 r1, r2 => r2
output	 1024
output	 1028
output	 1032
output	 1036
output	 1040
