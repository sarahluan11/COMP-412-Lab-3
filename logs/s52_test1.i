loadI	 1024 => r0
loadI	 1032 => r1
load	 r0 => r2
load	 r1 => r3
add	 r2, r3 => r3
store	 r3 => r0
loadI	 1 => r0
loadI	 5 => r3
store	 r3 => r1
loadI	 12 => r1
output	 1024
output	 1028
output	 1032
