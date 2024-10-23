loadI	 12 => r0
loadI	 4 => r1
loadI	 8 => r2
store	 r0 => r0
store	 r1 => r1
store	 r2 => r2
output	 8
loadI	 2048 => r3
load	 r3 => r3
output	 8
loadI	 1024 => r4
load	 r4 => r4
store	 r4 => r2
output	 8
mult	 r4, r4 => r4
store	 r4 => r4
output	 4
