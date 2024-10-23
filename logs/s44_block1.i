loadI	 1024 => r0
loadI	 1028 => r1
load	 r0 => r0
load	 r1 => r1
add	 r0, r1 => r0
add	 r0, r1 => r1
loadI	 1032 => r0
store	 r1 => r0
add	 r1, r1 => r0
loadI	 1036 => r2
store	 r0 => r2
output	 1024
output	 1028
output	 1032
output	 1036
lshift	 r1, r1 => r2
loadI	 1044 => r0
store	 r2 => r0
output	 1044
rshift	 r2, r1 => r1
loadI	 1040 => r2
store	 r1 => r2
output	 1040
