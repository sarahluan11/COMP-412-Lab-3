loadI	 1024 => r0
load	 r0 => r1
mult	 r0, r1 => r2
loadI	 1028 => r3
load	 r3 => r3
sub	 r3, r1 => r1
loadI	 1725 => r3
mult	 r1, r3 => r3
sub	 r3, r2 => r2
store	 r2 => r0
output	 1024
