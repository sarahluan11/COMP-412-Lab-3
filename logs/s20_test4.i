loadI	 1024 => r0
load	 r0 => r0
loadI	 1028 => r1
load	 r1 => r1
add	 r0, r1 => r2
loadI	 1032 => r3
store	 r2 => r3
output	 1032
loadI	 1024 => r3
load	 r3 => r3
loadI	 1028 => r2
load	 r2 => r4
lshift	 r3, r2 => r2
loadI	 1032 => r3
store	 r2 => r3
output	 1032
loadI	 1024 => r3
load	 r3 => r3
loadI	 1028 => r2
load	 r2 => r2
rshift	 r3, r2 => r2
loadI	 1032 => r3
store	 r2 => r3
output	 1032
loadI	 1024 => r3
loadI	 1028 => r2
loadI	 1032 => r5
loadI	 1036 => r6
add	 r0, r1 => r7
add	 r0, r7 => r7
add	 r1, r7 => r7
loadI	 1032 => r1
store	 r7 => r1
output	 1032
