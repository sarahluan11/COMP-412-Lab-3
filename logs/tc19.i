loadI	 1024 => r0
loadI	 1028 => r1
loadI	 1032 => r2
loadI	 1036 => r3
loadI	 4 => r4
store	 r4 => r0
store	 r4 => r1
store	 r4 => r2
store	 r4 => r3
output	 1024
load	 r1 => r3
add	 r3, r3 => r3
store	 r3 => r1
output	 1032
output	 1028
output	 1024
