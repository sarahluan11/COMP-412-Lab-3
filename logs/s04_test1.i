loadI	 8 => r0
mult	 r0, r0 => r0
loadI	 1024 => r1
store	 r0 => r1
loadI	 8 => r2
add	 r2, r1 => r1
store	 r0 => r1
loadI	 192 => r2
loadI	 2 => r3
output	 1024
output	 1032
sub	 r1, r3 => r1
sub	 r1, r3 => r3
store	 r0 => r3
output	 1024
output	 1028
