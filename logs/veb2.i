loadI	 1024 => r0
load	 r0 => r0
loadI	 1 => r1
loadI	 2 => r2
mult	 r2, r0 => r0
sub	 r0, r1 => r2
mult	 r0, r2 => r2
rshift	 r2, r1 => r1
loadI	 2048 => r2
store	 r1 => r2
output	 2048
