loadI	 2048 => r0
loadI	 10 => r1
loadI	 8 => r2
loadI	 20 => r3
load	 r0 => r4
add	 r2, r1 => r1
add	 r1, r3 => r3
add	 r4, r3 => r3
store	 r3 => r0
output	 2048
