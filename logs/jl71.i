loadI	 1 => r0
loadI	 128 => r1
load	 r1 => r1
loadI	 132 => r2
load	 r2 => r2
add	 r1, r2 => r2
rshift	 r2, r0 => r2
loadI	 136 => r1
load	 r1 => r1
loadI	 140 => r3
load	 r3 => r3
add	 r1, r3 => r3
rshift	 r3, r0 => r0
loadI	 128 => r3
store	 r2 => r3
loadI	 132 => r3
store	 r0 => r3
output	 128
output	 132
