loadI	 1024 => r0
load	 r0 => r1
loadI	 32 => r2
add	 r1, r2 => r1
add	 r1, r2 => r2
add	 r2, r1 => r1
mult	 r2, r1 => r1
store	 r1 => r0
output	 1024
load	 r0 => r0
