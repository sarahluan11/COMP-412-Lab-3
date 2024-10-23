loadI	 2048 => r0
loadI	 1 => r1
loadI	 2 => r2
loadI	 3 => r3
lshift	 r1, r2 => r4
lshift	 r1, r3 => r1
load	 r0 => r5
add	 r5, r4 => r6
add	 r5, r1 => r7
load	 r6 => r6
load	 r7 => r8
add	 r7, r1 => r1
add	 r4, r1 => r4
store	 r2 => r1
store	 r3 => r4
output	 2052
output	 2056
output	 2064
output	 2068
loadI	 12 => r4
add	 r5, r4 => r4
load	 r4 => r4
lshift	 r4, r2 => r2
lshift	 r4, r3 => r3
store	 r6 => r2
load	 r2 => r4
store	 r6 => r3
load	 r3 => r6
output	 4096
output	 8192
add	 r4, r6 => r6
store	 r6 => r2
output	 4096
output	 8192
store	 r8 => r3
load	 r2 => r2
load	 r3 => r3
add	 r2, r3 => r3
output	 4096
output	 8192
store	 r3 => r0
output	 2048
