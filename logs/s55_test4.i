loadI	 1024 => r0
load	 r0 => r0
loadI	 1036 => r1
load	 r1 => r1
loadI	 4 => r2
add	 r1, r2 => r1
mult	 r0, r1 => r1
loadI	 1040 => r3
store	 r1 => r3
lshift	 r0, r2 => r2
loadI	 1072 => r0
store	 r2 => r0
output	 1024
output	 1036
output	 1040
output	 1072
