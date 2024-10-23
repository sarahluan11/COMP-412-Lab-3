loadI	 4 => r0
loadI	 1024 => r1
mult	 r1, r1 => r2
mult	 r2, r2 => r2
add	 r2, r0 => r2
add	 r0, r1 => r3
add	 r0, r3 => r4
add	 r0, r4 => r5
add	 r0, r5 => r6
add	 r0, r6 => r0
add	 r2, r0 => r7
add	 r2, r7 => r8
add	 r2, r8 => r2
loadI	 32768 => r9
store	 r8 => r9
load	 r1 => r8
store	 r8 => r1
load	 r3 => r1
load	 r5 => r8
store	 r1 => r5
store	 r8 => r3
load	 r6 => r3
store	 r3 => r6
load	 r4 => r6
load	 r7 => r3
store	 r6 => r7
store	 r3 => r4
load	 r2 => r4
store	 r4 => r2
load	 r0 => r2
loadI	 32768 => r9
load	 r9 => r4
load	 r4 => r3
store	 r2 => r4
store	 r3 => r0
output	 1024
output	 1028
output	 1032
output	 1036
output	 1040
output	 1044
output	 1048
output	 1052
output	 1056
