loadI	 1 => r0
add	 r0, r0 => r1
add	 r0, r1 => r2
add	 r1, r2 => r3
add	 r2, r3 => r4
add	 r3, r4 => r5
loadI	 1024 => r6
store	 r0 => r6
loadI	 1028 => r6
store	 r1 => r6
loadI	 1032 => r6
store	 r2 => r6
loadI	 1036 => r6
store	 r3 => r6
loadI	 1040 => r6
store	 r4 => r6
loadI	 1044 => r6
store	 r5 => r6
output	 1024
output	 1028
output	 1032
output	 1036
output	 1040
output	 1044
