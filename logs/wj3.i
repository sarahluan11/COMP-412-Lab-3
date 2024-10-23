loadI	 1024 => r0
loadI	 1028 => r1
add	 r0, r1 => r2
add	 r0, r2 => r3
store	 r2 => r1
load	 r0 => r1
add	 r3, r1 => r1
store	 r1 => r0
output	 1024
