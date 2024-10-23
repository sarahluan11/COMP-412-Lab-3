loadI	 1024 => r0
loadI	 1028 => r1
loadI	 4 => r2
loadI	 2 => r3
add	 r0, r2 => r2
load	 r2 => r4
store	 r2 => r1
output	 1028
load	 r0 => r5
load	 r1 => r6
output	 1024
output	 1028
add	 r2, r5 => r5
store	 r5 => r2
store	 r5 => r0
mult	 r5, r5 => r5
store	 r5 => r1
output	 1028
output	 1024
