loadI	 8 => r0
loadI	 1 => r1
loadI	 1 => r2
loadI	 2000 => r3
store	 r2 => r3
lshift	 r0, r1 => r3
loadI	 2000 => r2
store	 r3 => r2
output	 2000
rshift	 r0, r1 => r1
loadI	 2000 => r0
store	 r1 => r0
output	 2000
