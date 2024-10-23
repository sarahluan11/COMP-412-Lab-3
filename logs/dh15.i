loadI	 1024 => r0
loadI	 1028 => r1
loadI	 5 => r2
loadI	 10 => r3
store	 r2 => r0
store	 r3 => r1
load	 r0 => r3
load	 r1 => r2
mult	 r3, r2 => r4
add	 r3, r2 => r2
output	 1024
output	 1028
store	 r4 => r0
store	 r2 => r1
output	 1028
output	 1024
