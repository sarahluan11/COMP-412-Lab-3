loadI	 2000 => r0
loadI	 2004 => r1
loadI	 2032 => r2
load	 r2 => r3
sub	 r1, r3 => r1
store	 r2 => r0
store	 r3 => r1
output	 2000
