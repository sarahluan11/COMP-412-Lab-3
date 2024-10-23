loadI	 0 => r0
loadI	 1 => r1
add	 r0, r1 => r0
add	 r1, r0 => r1
add	 r0, r1 => r0
add	 r1, r0 => r1
add	 r0, r1 => r0
add	 r1, r0 => r1
add	 r0, r1 => r0
add	 r1, r0 => r0
loadI	 1024 => r1
loadI	 1028 => r2
loadI	 1032 => r3
loadI	 1036 => r4
loadI	 1040 => r5
load	 r1 => r6
store	 r6 => r1
store	 r0 => r2
output	 1024
output	 1028
