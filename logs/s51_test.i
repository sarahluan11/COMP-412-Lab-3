loadI	 3 => r0
loadI	 1024 => r1
loadI	 4 => r2
loadI	 1028 => r3
store	 r2 => r1
store	 r0 => r1
add	 r0, r2 => r2
store	 r2 => r3
output	 1028
output	 1024
