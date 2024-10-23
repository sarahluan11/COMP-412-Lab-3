loadI	 2 => r0
loadI	 1024 => r1
loadI	 5 => r2
loadI	 1028 => r3
loadI	 4 => r4
store	 r2 => r1
loadI	 10 => r1
loadI	 2 => r2
store	 r4 => r3
mult	 r1, r2 => r2
add	 r1, r2 => r2
loadI	 1032 => r1
load	 r3 => r4
mult	 r3, r2 => r2
store	 r2 => r4
output	 1024
output	 1028
