loadI	 1024 => r0
loadI	 4 => r1
add	 r0, r1 => r0
store	 r1 => r0
loadI	 1028 => r0
load	 r0 => r1
loadI	 1 => r2
add	 r1, r2 => r2
store	 r2 => r0
output	 1028
