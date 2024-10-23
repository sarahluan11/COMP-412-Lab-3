loadI	 1024 => r0
loadI	 1028 => r1
load	 r0 => r2
load	 r1 => r1
mult	 r2, r1 => r2
add	 r1, r2 => r2
store	 r2 => r0
output	 1024
