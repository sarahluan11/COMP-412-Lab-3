loadI	 4 => r0
loadI	 1024 => r1
loadI	 1028 => r2
add	 r0, r1 => r1
store	 r0 => r1
load	 r2 => r2
loadI	 8 => r1
loadI	 1024 => r0
loadI	 1028 => r3
add	 r1, r0 => r0
store	 r1 => r0
load	 r3 => r3
output	 1028
output	 1032
