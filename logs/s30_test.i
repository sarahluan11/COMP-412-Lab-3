loadI	 2000 => r0
loadI	 20 => r1
store	 r1 => r0
loadI	 1996 => r0
loadI	 4 => r1
add	 r0, r1 => r0
mult	 r1, r1 => r2
mult	 r2, r1 => r2
mult	 r2, r1 => r2
mult	 r2, r1 => r2
loadI	 24 => r3
sub	 r2, r3 => r3
loadI	 2 => r2
mult	 r3, r2 => r2
load	 r2 => r3
add	 r3, r1 => r3
store	 r3 => r2
output	 2000
loadI	 2000 => r3
load	 r3 => r3
mult	 r3, r1 => r3
loadI	 2 => r4
mult	 r3, r4 => r3
mult	 r3, r4 => r3
mult	 r3, r4 => r3
mult	 r3, r4 => r3
mult	 r3, r4 => r3
mult	 r3, r4 => r4
add	 r1, r2 => r2
store	 r4 => r2
output	 2004