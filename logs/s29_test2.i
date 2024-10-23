loadI	 1024 => r0
loadI	 1028 => r1
loadI	 7 => r2
loadI	 11 => r3
mult	 r2, r3 => r2
mult	 r3, r2 => r2
store	 r2 => r0
store	 r3 => r1
output	 1024
output	 1028
