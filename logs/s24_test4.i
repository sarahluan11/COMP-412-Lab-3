loadI	 1024 => r0
load	 r0 => r0
loadI	 5280 => r1
mult	 r0, r1 => r1
loadI	 12 => r0
mult	 r1, r0 => r0
loadI	 2000 => r1
store	 r0 => r1
output	 2000
