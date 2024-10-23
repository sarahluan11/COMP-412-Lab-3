loadI	 1024 => r0
loadI	 1028 => r1
load	 r0 => r2
load	 r1 => r3
loadI	 4 => r4
add	 r4, r2 => r2
add	 r4, r3 => r3
add	 r4, r1 => r4
add	 r4, r1 => r5
loadI	 25 => r6
store	 r6 => r4
load	 r4 => r4
store	 r6 => r5
load	 r5 => r5
output	 1024
output	 1028
output	 1032
store	 r4 => r1
store	 r5 => r1
store	 r2 => r1
load	 r1 => r2
load	 r1 => r5
load	 r1 => r4
load	 r1 => r6
store	 r6 => r0
load	 r1 => r6
load	 r0 => r7
output	 1024
output	 1028
store	 r7 => r0
store	 r6 => r1
