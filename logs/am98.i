loadI	 1024 => r0
loadI	 1028 => r1
loadI	 1032 => r2
loadI	 4 => r3
loadI	 8 => r4
loadI	 104 => r5
loadI	 108 => r6
load	 r0 => r7
sub	 r7, r4 => r8
mult	 r7, r3 => r7
store	 r5 => r8
store	 r5 => r7
load	 r1 => r1
load	 r2 => r2
add	 r1, r3 => r1
add	 r2, r4 => r2
store	 r5 => r1
output	 1036
store	 r6 => r2
output	 1036
load	 r0 => r2
add	 r2, r3 => r2
load	 r0 => r6
add	 r6, r4 => r6
store	 r2 => r6
load	 r0 => r2
sub	 r2, r4 => r2
load	 r0 => r0
add	 r0, r3 => r0
store	 r2 => r0
load	 r0 => r0
sub	 r0, r4 => r0
store	 r0 => r0
load	 r6 => r6
mult	 r6, r3 => r3
add	 r3, r4 => r4
store	 r4 => r4
output	 4120
output	 1008
