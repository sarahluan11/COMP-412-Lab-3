loadI	 1024 => r0
load	 r0 => r1
loadI	 1028 => r2
load	 r2 => r3
loadI	 1032 => r4
load	 r4 => r5
loadI	 1036 => r6
load	 r6 => r6
add	 r0, r1 => r1
store	 r1 => r0
loadI	 20 => r0
add	 r2, r0 => r0
store	 r0 => r0
output	 1048
store	 r3 => r0
output	 1048
load	 r0 => r0
store	 r0 => r4
output	 1024
output	 1032
