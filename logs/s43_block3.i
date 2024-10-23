loadI	 1032 => r0
loadI	 1024 => r1
load	 r1 => r1
loadI	 4 => r2
loadI	 1028 => r3
load	 r3 => r3
store	 r1 => r0
add	 r0, r2 => r2
add	 r1, r3 => r3
store	 r3 => r2
load	 r2 => r2
loadI	 1036 => r3
load	 r3 => r3
mult	 r2, r3 => r3
loadI	 1040 => r2
store	 r3 => r2
output	 1036
output	 1040
