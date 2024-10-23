loadI	 4 => r0
loadI	 2000 => r1
add	 r0, r1 => r0
load	 r1 => r2
load	 r0 => r0
sub	 r2, r0 => r2
sub	 r2, r0 => r2
sub	 r0, r2 => r0
sub	 r0, r2 => r2
store	 r2 => r1
output	 2000
