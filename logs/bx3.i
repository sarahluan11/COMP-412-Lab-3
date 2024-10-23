loadI	 1024 => r0
load	 r0 => r1
loadI	 1028 => r2
load	 r2 => r3
loadI	 4 => r4
loadI	 4 => r5
add	 r0, r3 => r0
store	 r1 => r0
add	 r2, r3 => r2
store	 r3 => r2
output	 1032
output	 1036
loadI	 1048 => r2
loadI	 1056 => r3
loadI	 1064 => r0
load	 r0 => r1
load	 r3 => r6
load	 r2 => r7
store	 r7 => r2
store	 r6 => r3
store	 r1 => r0
output	 1024
output	 1028
output	 1032
