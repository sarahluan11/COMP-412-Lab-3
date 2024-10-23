loadI	 1024 => r0
load	 r0 => r0
loadI	 1028 => r1
load	 r1 => r1
loadI	 1032 => r2
load	 r2 => r2
loadI	 1 => r3
loadI	 2 => r4
loadI	 4 => r5
mult	 r0, r3 => r3
mult	 r1, r4 => r4
add	 r3, r4 => r4
loadI	 1036 => r3
store	 r4 => r3
output	 1036
mult	 r2, r5 => r5
add	 r5, r4 => r4
loadI	 1040 => r5
store	 r4 => r5
output	 1040
