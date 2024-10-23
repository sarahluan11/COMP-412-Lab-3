loadI	 1024 => r0
load	 r0 => r1
loadI	 1028 => r2
load	 r2 => r2
load	 r0 => r3
load	 r0 => r4
load	 r0 => r5
mult	 r1, r2 => r2
mult	 r2, r3 => r3
mult	 r3, r4 => r4
mult	 r4, r5 => r5
store	 r5 => r0
output	 1024
