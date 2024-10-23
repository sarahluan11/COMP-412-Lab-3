loadI	 4 => r0
loadI	 1024 => r1
add	 r0, r1 => r2
add	 r0, r2 => r3
add	 r0, r3 => r4
add	 r0, r4 => r5
add	 r0, r5 => r0
load	 r1 => r6
load	 r2 => r7
load	 r3 => r8
load	 r4 => r4
load	 r5 => r5
load	 r0 => r0
sub	 r6, r7 => r7
add	 r8, r4 => r4
mult	 r5, r0 => r0
store	 r7 => r1
store	 r4 => r2
store	 r0 => r3
output	 1024
output	 1028
output	 1032
