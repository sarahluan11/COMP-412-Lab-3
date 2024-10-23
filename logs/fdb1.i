loadI	 500 => r0
nop
loadI	 400 => r1
loadI	 300 => r2
loadI	 200 => r3
loadI	 300000 => r4
nop
mult	 r3, r2 => r2
store	 r2 => r4
nop
output	 300000
