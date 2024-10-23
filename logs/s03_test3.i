loadI	 1024 => r0
loadI	 1036 => r1
load	 r1 => r1
load	 r0 => r2
mult	 r1, r2 => r3
loadI	 1028 => r4
load	 r4 => r4
sub	 r4, r2 => r2
loadI	 1032 => r4
load	 r4 => r4
mult	 r2, r4 => r4
sub	 r3, r4 => r4
store	 r1 => r0
store	 r4 => r0
output	 1024
