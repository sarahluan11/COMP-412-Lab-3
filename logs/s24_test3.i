loadI	 1024 => r0
load	 r0 => r0
loadI	 1028 => r1
load	 r1 => r1
loadI	 1032 => r2
load	 r2 => r2
loadI	 60 => r3
mult	 r3, r0 => r0
mult	 r3, r0 => r0
mult	 r1, r3 => r3
add	 r0, r3 => r3
add	 r2, r3 => r3
loadI	 2000 => r2
store	 r3 => r2
output	 2000
