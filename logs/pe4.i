loadI	 4 => r0
loadI	 1024 => r1
loadI	 1028 => r2
loadI	 1032 => r3
add	 r0, r1 => r4
store	 r2 => r4
store	 r0 => r3
load	 r0 => r0
nop
load	 r0 => r4
store	 r1 => r3
store	 r0 => r1
output	 1028
output	 1032
