loadI	 1024 => r0
loadI	 1028 => r1
loadI	 1032 => r2
loadI	 4 => r3
add	 r3, r0 => r0
store	 r3 => r0
loadI	 256 => r3
load	 r0 => r0
mult	 r3, r0 => r4
store	 r3 => r4
loadI	 1036 => r4
sub	 r4, r0 => r0
store	 r4 => r0
output	 1032
output	 1028
output	 1024
