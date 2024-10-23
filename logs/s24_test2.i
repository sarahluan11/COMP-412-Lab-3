loadI	 2000 => r0
loadI	 1024 => r1
load	 r1 => r1
loadI	 1028 => r2
load	 r2 => r2
loadI	 1032 => r3
load	 r3 => r3
mult	 r1, r1 => r1
mult	 r2, r2 => r2
mult	 r3, r3 => r4
store	 r3 => r0
loadI	 4 => r3
add	 r0, r3 => r0
store	 r2 => r0
add	 r0, r3 => r3
store	 r4 => r3
output	 2000
output	 2004
output	 2008
