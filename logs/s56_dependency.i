loadI	 1024 => r0
load	 r0 => r1
loadI	 4 => r2
loadI	 511 => r3
add	 r1, r3 => r3
add	 r0, r2 => r2
store	 r3 => r2
output	 1028
