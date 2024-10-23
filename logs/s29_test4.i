loadI	 1024 => r0
loadI	 1028 => r1
loadI	 340 => r2
loadI	 4 => r3
mult	 r2, r3 => r4
add	 r3, r2 => r2
sub	 r4, r2 => r2
add	 r3, r2 => r2
add	 r2, r3 => r2
mult	 r3, r2 => r4
store	 r4 => r2
store	 r3 => r1
output	 1024
output	 1028
