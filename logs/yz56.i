loadI	 1024 => r0
loadI	 1028 => r1
load	 r0 => r0
load	 r1 => r1
loadI	 1 => r2
add	 r0, r1 => r0
mult	 r2, r0 => r0
loadI	 1032 => r2
store	 r0 => r2
loadI	 2 => r2
add	 r0, r1 => r1
mult	 r1, r2 => r2
loadI	 1036 => r1
store	 r2 => r1
loadI	 3 => r1
add	 r0, r2 => r0
mult	 r1, r0 => r0
loadI	 1040 => r1
store	 r0 => r1
loadI	 4 => r1
add	 r2, r0 => r0
mult	 r1, r0 => r0
loadI	 1044 => r1
store	 r0 => r1
output	 1024
output	 1028
output	 1032
output	 1036
output	 1040
output	 1044
