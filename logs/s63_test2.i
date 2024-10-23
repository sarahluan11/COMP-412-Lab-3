loadI	 1024 => r0
loadI	 1028 => r1
loadI	 5 => r2
loadI	 2 => r3
rshift	 r2, r3 => r4
store	 r4 => r0
lshift	 r2, r3 => r3
store	 r3 => r1
output	 1024
output	 1028
