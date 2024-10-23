loadI	 1024 => r0
load	 r0 => r0
loadI	 2 => r1
loadI	 1032 => r2
loadI	 1028 => r3
lshift	 r1, r0 => r0
load	 r3 => r3
mult	 r0, r3 => r0
mult	 r0, r3 => r0
mult	 r0, r3 => r3
store	 r3 => r2
output	 1032
