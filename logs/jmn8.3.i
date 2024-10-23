loadI	 8 => r0
loadI	 7 => r1
loadI	 35 => r2
loadI	 2 => r3
mult	 r0, r1 => r1
mult	 r2, r3 => r3
loadI	 2000 => r2
loadI	 2004 => r0
store	 r1 => r2
store	 r3 => r0
output	 2000
output	 2004
