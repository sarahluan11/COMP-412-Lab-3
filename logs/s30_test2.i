loadI	 1 => r0
loadI	 2 => r1
loadI	 3 => r2
loadI	 4 => r3
loadI	 5 => r4
add	 r0, r1 => r1
add	 r2, r1 => r1
add	 r3, r1 => r1
add	 r4, r1 => r1
loadI	 1028 => r4
store	 r1 => r4
output	 1028
