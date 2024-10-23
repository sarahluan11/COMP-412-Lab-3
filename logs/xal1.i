loadI	 1024 => r0
loadI	 1028 => r1
load	 r0 => r0
load	 r1 => r1
loadI	 10 => r2
loadI	 2 => r3
mult	 r1, r1 => r1
mult	 r0, r3 => r3
mult	 r1, r3 => r3
mult	 r2, r3 => r3
loadI	 2000 => r2
store	 r3 => r2
output	 2000
