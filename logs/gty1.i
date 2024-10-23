loadI	 1 => r0
loadI	 2 => r1
loadI	 3 => r2
loadI	 1000 => r3
loadI	 1004 => r4
loadI	 1008 => r5
mult	 r0, r0 => r0
mult	 r1, r1 => r1
mult	 r2, r2 => r2
store	 r0 => r3
store	 r1 => r4
store	 r2 => r5
output	 1000
output	 1004
output	 1008
output	 2000
output	 2004
output	 2008
