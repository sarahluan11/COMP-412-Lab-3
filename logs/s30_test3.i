loadI	 2048 => r0
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
add	 r2, r3 => r3
sub	 r4, r5 => r5
mult	 r3, r5 => r5
add	 r5, r6 => r6
add	 r0, r1 => r1
store	 r6 => r1
output	 2068
