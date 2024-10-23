loadI	 3 => r0
loadI	 1 => r1
add	 r0, r1 => r0
mult	 r1, r0 => r1
add	 r1, r0 => r0
sub	 r0, r1 => r1
add	 r0, r1 => r1
loadI	 1076 => r0
store	 r1 => r0
output	 1076
