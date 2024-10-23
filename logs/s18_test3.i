loadI	 2000 => r0
loadI	 4 => r1
loadI	 1024 => r2
loadI	 1028 => r3
loadI	 5 => r4
loadI	 1 => r5
load	 r2 => r6
load	 r2 => r2
load	 r3 => r7
load	 r3 => r3
mult	 r7, r3 => r7
mult	 r6, r2 => r6
sub	 r4, r5 => r4
mult	 r7, r3 => r7
mult	 r6, r2 => r6
sub	 r4, r5 => r4
mult	 r7, r3 => r7
mult	 r6, r2 => r6
sub	 r4, r5 => r4
mult	 r7, r3 => r3
mult	 r6, r2 => r2
sub	 r4, r5 => r5
store	 r2 => r0
add	 r1, r0 => r0
store	 r3 => r0
output	 2000
output	 2004
