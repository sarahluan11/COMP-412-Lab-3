loadI	 0 => r0
loadI	 4 => r1
load	 r1 => r2
loadI	 1 => r3
add	 r1, r3 => r4
add	 r1, r3 => r3
loadI	 1024 => r1
store	 r3 => r1
output	 1024
