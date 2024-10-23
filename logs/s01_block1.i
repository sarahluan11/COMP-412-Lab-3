loadI	 2 => r0
loadI	 3 => r1
mult	 r0, r1 => r1
mult	 r0, r1 => r0
mult	 r0, r1 => r1
loadI	 1028 => r0
store	 r1 => r0
output	 1028
