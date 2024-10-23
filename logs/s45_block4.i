loadI	 1024 => r0
loadI	 1 => r1
loadI	 4 => r2
loadI	 6 => r3
store	 r3 => r0
output	 1024
rshift	 r3, r1 => r3
store	 r3 => r0
output	 1024
add	 r3, r3 => r4
add	 r3, r4 => r4
add	 r4, r1 => r4
store	 r4 => r0
output	 1024
rshift	 r4, r1 => r4
store	 r4 => r0
output	 1024
add	 r4, r4 => r3
add	 r4, r3 => r3
add	 r3, r1 => r3
store	 r3 => r0
output	 1024
rshift	 r3, r1 => r3
store	 r3 => r0
output	 1024
rshift	 r3, r1 => r3
store	 r3 => r0
output	 1024
rshift	 r3, r1 => r3
store	 r3 => r0
output	 1024
rshift	 r3, r1 => r3
store	 r3 => r0
output	 1024
rshift	 r3, r1 => r1
store	 r1 => r0
output	 1024
