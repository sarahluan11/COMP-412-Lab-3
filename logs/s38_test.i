loadI	 1024 => r0
loadI	 1028 => r1
loadI	 1032 => r2
loadI	 1036 => r3
loadI	 1 => r4
mult	 r4, r4 => r4
mult	 r4, r4 => r4
mult	 r4, r4 => r4
mult	 r4, r4 => r4
mult	 r4, r4 => r4
load	 r0 => r5
add	 r4, r5 => r5
load	 r1 => r6
add	 r4, r6 => r6
load	 r2 => r7
add	 r4, r7 => r7
load	 r3 => r8
add	 r4, r8 => r8
store	 r5 => r0
store	 r6 => r1
store	 r7 => r2
store	 r8 => r3
output	 1024
output	 1028
output	 1032
output	 1036
