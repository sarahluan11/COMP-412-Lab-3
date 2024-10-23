loadI	 1024 => r0
loadI	 1028 => r1
load	 r0 => r0
load	 r1 => r1
loadI	 1032 => r2
load	 r2 => r3
add	 r3, r0 => r3
mult	 r3, r3 => r3
store	 r3 => r2
output	 1032
sub	 r3, r0 => r0
store	 r0 => r2
output	 1032
