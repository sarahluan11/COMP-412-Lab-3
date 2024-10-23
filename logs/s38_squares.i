loadI	 1024 => r0
load	 r0 => r0
loadI	 0 => r1
add	 r0, r0 => r2
add	 r0, r2 => r3
add	 r0, r3 => r4
add	 r0, r4 => r5
mult	 r5, r5 => r5
mult	 r4, r4 => r4
mult	 r3, r3 => r3
mult	 r2, r2 => r2
mult	 r0, r0 => r0
loadI	 1024 => r6
store	 r0 => r6
loadI	 1028 => r6
store	 r2 => r6
loadI	 1032 => r6
store	 r3 => r6
loadI	 1036 => r6
store	 r4 => r6
loadI	 1040 => r6
store	 r5 => r6
output	 1024
output	 1028
output	 1032
output	 1036
output	 1040
