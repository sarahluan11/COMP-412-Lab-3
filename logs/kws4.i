loadI	 1024 => r0
loadI	 4 => r1
loadI	 1 => r2
loadI	 2 => r3
lshift	 r3, r2 => r4
lshift	 r3, r2 => r5
rshift	 r3, r2 => r6
lshift	 r5, r2 => r5
lshift	 r6, r2 => r6
store	 r3 => r4
store	 r2 => r1
lshift	 r4, r2 => r4
store	 r2 => r4
store	 r3 => r1
store	 r3 => r0
lshift	 r5, r2 => r5
lshift	 r6, r2 => r6
lshift	 r5, r2 => r5
lshift	 r6, r2 => r6
lshift	 r5, r2 => r5
lshift	 r6, r2 => r2
output	 1024