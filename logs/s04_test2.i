loadI	 8 => r0
loadI	 20 => r1
loadI	 1044 => r2
sub	 r2, r1 => r2
store	 r0 => r2
add	 r0, r2 => r0
store	 r1 => r0
output	 1024
output	 1032
load	 r2 => r1
loadI	 20 => r3
store	 r1 => r0
store	 r3 => r2
output	 1032
output	 1024
