loadI	 1024 => r0
loadI	 1028 => r1
load	 r0 => r2
load	 r1 => r3
add	 r2, r3 => r3
store	 r3 => r1
load	 r0 => r0
add	 r3, r3 => r3
store	 r3 => r1
output	 1024
output	 1028
add	 r3, r3 => r3
store	 r3 => r1
