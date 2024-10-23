loadI	 4 => r0
loadI	 9 => r1
loadI	 16 => r2
loadI	 25 => r3
loadI	 1 => r4
loadI	 0 => r5
loadI	 4 => r6
lshift	 r0, r4 => r0
store	 r0 => r5
add	 r5, r6 => r5
rshift	 r0, r4 => r0
rshift	 r0, r4 => r0
store	 r0 => r5
add	 r5, r6 => r5
lshift	 r1, r4 => r1
lshift	 r1, r4 => r1
store	 r1 => r5
add	 r5, r6 => r5
rshift	 r1, r4 => r1
rshift	 r1, r4 => r1
store	 r1 => r5
add	 r5, r6 => r5
lshift	 r2, r4 => r2
store	 r2 => r5
add	 r5, r6 => r5
rshift	 r2, r4 => r2
rshift	 r2, r4 => r2
store	 r2 => r5
add	 r5, r6 => r6
lshift	 r3, r4 => r5
store	 r3 => r6
output	 0
output	 4
output	 8
output	 12
output	 16
output	 20
output	 24
