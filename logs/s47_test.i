loadI	 1024 => r0
loadI	 1028 => r1
load	 r0 => r2
load	 r1 => r3
store	 r2 => r1
output	 1028
store	 r3 => r0
output	 1024
load	 r1 => r3
load	 r0 => r2
mult	 r3, r3 => r3
mult	 r2, r2 => r2
store	 r3 => r1
store	 r2 => r0
output	 1024
output	 1028
