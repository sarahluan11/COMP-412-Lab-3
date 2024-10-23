loadI	 1024 => r0
loadI	 1028 => r1
loadI	 1032 => r2
loadI	 4 => r3
store	 r3 => r0
load	 r0 => r0
add	 r3, r3 => r3
store	 r3 => r1
store	 r3 => r2
output	 1028
output	 1032
