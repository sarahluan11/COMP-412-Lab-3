loadI	 1024 => r0
loadI	 4 => r1
add	 r0, r1 => r2
load	 r0 => r0
store	 r0 => r2
add	 r2, r1 => r2
store	 r0 => r2
add	 r2, r1 => r1
store	 r0 => r1
output	 1028
output	 1032
output	 1036
