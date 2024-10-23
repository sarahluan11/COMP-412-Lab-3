loadI	 5 => r0
loadI	 5 => r1
loadI	 5 => r2
loadI	 5 => r3
add	 r0, r1 => r1
add	 r1, r2 => r2
add	 r2, r3 => r3
loadI	 1024 => r4
store	 r0 => r4
loadI	 1028 => r4
store	 r1 => r4
loadI	 1032 => r4
store	 r2 => r4
loadI	 1036 => r4
store	 r3 => r4
output	 1024
output	 1028
output	 1032
output	 1036
