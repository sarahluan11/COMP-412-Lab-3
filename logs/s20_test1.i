loadI	 1 => r0
loadI	 2 => r1
add	 r1, r0 => r0
loadI	 5 => r1
mult	 r1, r0 => r0
loadI	 9 => r1
loadI	 7 => r2
sub	 r1, r2 => r2
sub	 r0, r2 => r2
loadI	 3 => r0
add	 r2, r0 => r0
loadI	 1024 => r2
store	 r0 => r2
output	 1024
