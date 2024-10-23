loadI	 1024 => r0
store	 r0 => r0
load	 r0 => r1
add	 r1, r0 => r0
store	 r0 => r0
output	 1024
output	 1028
loadI	 4 => r0
loadI	 1024 => r1
loadI	 1028 => r2
load	 r1 => r1
load	 r2 => r2
store	 r0 => r1
store	 r0 => r2
output	 1024
output	 1028
loadI	 1024 => r2
loadI	 1028 => r1
add	 r0, r2 => r2
add	 r0, r1 => r1
store	 r0 => r2
store	 r0 => r1
output	 1024
output	 1028
output	 1032
