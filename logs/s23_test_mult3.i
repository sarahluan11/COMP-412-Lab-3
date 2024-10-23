loadI	 1024 => r0
load	 r0 => r1
loadI	 1028 => r2
load	 r2 => r3
mult	 r3, r1 => r1
mult	 r1, r3 => r3
mult	 r3, r1 => r1
store	 r3 => r2
store	 r1 => r0
output	 1024
output	 1028
