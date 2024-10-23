loadI	 2000 => r0
loadI	 1024 => r1
load	 r1 => r1
loadI	 1028 => r2
load	 r2 => r2
mult	 r1, r2 => r3
store	 r3 => r0
add	 r1, r2 => r2
loadI	 2 => r1
mult	 r2, r1 => r1
loadI	 2004 => r2
store	 r1 => r2
output	 2000
output	 2004
