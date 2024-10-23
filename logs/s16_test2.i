loadI	 3 => r0
loadI	 7 => r1
loadI	 5 => r2
mult	 r0, r1 => r3
mult	 r0, r1 => r4
mult	 r0, r1 => r5
mult	 r0, r1 => r1
add	 r2, r2 => r0
mult	 r0, r2 => r0
sub	 r0, r2 => r2
loadI	 1024 => r0
loadI	 1024 => r6
store	 r1 => r0
add	 r5, r3 => r3
output	 1024
add	 r3, r3 => r3
store	 r3 => r6
output	 1024
