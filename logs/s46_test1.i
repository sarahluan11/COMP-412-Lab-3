loadI	 1028 => r0
output	 1028
load	 r0 => r1
mult	 r0, r1 => r2
loadI	 1032 => r3
load	 r3 => r3
sub	 r3, r1 => r1
loadI	 1036 => r3
mult	 r1, r3 => r3
sub	 r3, r2 => r2
store	 r2 => r0
output	 1028