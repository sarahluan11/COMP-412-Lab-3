loadI	 1024 => r0
loadI	 8 => r1
store	 r1 => r0
loadI	 1028 => r2
loadI	 16 => r3
store	 r3 => r2
add	 r0, r1 => r4
store	 r3 => r4
mult	 r3, r1 => r3
loadI	 1032 => r5
loadI	 1036 => r6
loadI	 1040 => r7
store	 r1 => r7
store	 r1 => r4
store	 r3 => r4
load	 r0 => r4
load	 r2 => r7
mult	 r4, r7 => r7
store	 r3 => r2
store	 r3 => r0
store	 r1 => r2
store	 r7 => r5
store	 r7 => r6
store	 r1 => r5
store	 r1 => r6
output	 1024
output	 1028
output	 1036
output	 1040
