loadI	 4 => r0
loadI	 8 => r1
loadI	 2000 => r2
loadI	 2004 => r3
loadI	 1996 => r4
add	 r0, r0 => r5
mult	 r0, r1 => r6
output	 2012
store	 r0 => r2
output	 2004
store	 r1 => r2
output	 2000
store	 r0 => r2
output	 2000
store	 r6 => r2
store	 r5 => r3
nop
nop
nop
nop
nop
nop
nop
nop
load	 r2 => r3
load	 r2 => r5
add	 r5, r0 => r6
add	 r6, r0 => r0
add	 r5, r1 => r5
output	 2000
add	 r1, r4 => r4
store	 r0 => r2
output	 2000
store	 r5 => r4
output	 2000
