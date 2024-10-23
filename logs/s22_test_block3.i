loadI	 1024 => r0
loadI	 4 => r1
load	 r0 => r2
add	 r0, r1 => r0
load	 r0 => r3
add	 r0, r1 => r0
load	 r0 => r4
add	 r0, r1 => r0
load	 r0 => r5
add	 r0, r1 => r0
load	 r0 => r6
loadI	 0 => r7
store	 r2 => r7
add	 r7, r1 => r7
sub	 r2, r3 => r3
store	 r3 => r7
add	 r7, r1 => r7
sub	 r3, r4 => r3
store	 r3 => r7
add	 r7, r1 => r7
sub	 r3, r5 => r5
store	 r5 => r7
add	 r7, r1 => r7
sub	 r5, r6 => r6
store	 r6 => r7
add	 r7, r1 => r1
store	 r1 => r1
output	 0
output	 4
output	 8
output	 12
output	 16
output	 20
