loadI	 1024 => r0
load	 r0 => r0
output	 1024
loadI	 1028 => r1
load	 r1 => r1
output	 1028
loadI	 1032 => r2
add	 r2, r0 => r0
store	 r0 => r2
loadI	 1036 => r2
output	 1032
add	 r2, r1 => r1
store	 r1 => r2
output	 1036
