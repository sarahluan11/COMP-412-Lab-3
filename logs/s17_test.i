loadI	 1024 => r0
loadI	 1028 => r1
loadI	 2 => r2
loadI	 4 => r3
store	 r2 => r0
store	 r3 => r1
output	 1024
output	 1028
add	 r2, r3 => r4
mult	 r2, r3 => r3
store	 r4 => r0
output	 1024
output	 1028
store	 r3 => r1
output	 1024
output	 1028
load	 r0 => r3
load	 r1 => r4
add	 r3, r4 => r2
mult	 r3, r4 => r4
output	 1024
output	 1028
store	 r2 => r0
store	 r4 => r1
output	 1024
output	 1028
