loadI	 1 => r0
loadI	 3 => r1
loadI	 1024 => r2
add	 r0, r1 => r1
store	 r1 => r2
loadI	 7 => r0
mult	 r1, r0 => r0
loadI	 4 => r1
add	 r1, r2 => r2
store	 r0 => r2
loadI	 6 => r3
sub	 r0, r3 => r3
add	 r2, r1 => r1
store	 r3 => r1
output	 1024
output	 1028
output	 1032
