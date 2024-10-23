loadI	 1024 => r0
loadI	 4 => r1
loadI	 8 => r2
add	 r0, r1 => r1
add	 r0, r2 => r2
load	 r1 => r3
load	 r2 => r4
add	 r3, r4 => r5
loadI	 12 => r6
add	 r0, r6 => r6
store	 r5 => r6
store	 r4 => r1
store	 r3 => r2
output	 1024
output	 1028
output	 1032
