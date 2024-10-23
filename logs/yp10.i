loadI	 1024 => r0
loadI	 2000 => r1
load	 r1 => r1
loadI	 1 => r2
lshift	 r1, r2 => r2
store	 r0 => r2
output	 1024
loadI	 1 => r2
loadI	 2 => r0
loadI	 1000 => r1
mult	 r2, r2 => r3
mult	 r2, r0 => r2
mult	 r0, r0 => r0
store	 r0 => r1
output	 1000
