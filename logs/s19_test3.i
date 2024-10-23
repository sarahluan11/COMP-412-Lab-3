loadI	 0 => r0
load	 r0 => r0
loadI	 4 => r1
load	 r1 => r1
loadI	 8 => r2
load	 r2 => r2
loadI	 12 => r3
load	 r3 => r3
loadI	 16 => r4
load	 r4 => r4
add	 r0, r1 => r1
add	 r1, r2 => r2
add	 r2, r3 => r3
add	 r3, r4 => r4
loadI	 1024 => r3
store	 r4 => r3
output	 1024
