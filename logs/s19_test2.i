loadI	 1024 => r0
loadI	 1028 => r1
load	 r0 => r2
load	 r1 => r1
add	 r2, r1 => r1
loadI	 1032 => r2
load	 r2 => r2
sub	 r1, r2 => r2
loadI	 1036 => r1
load	 r1 => r1
mult	 r2, r1 => r1
store	 r1 => r0
output	 1024
