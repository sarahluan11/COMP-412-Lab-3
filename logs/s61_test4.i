loadI	 0 => r0
loadI	 4 => r1
loadI	 32 => r2
load	 r2 => r2
add	 r0, r1 => r0
add	 r0, r0 => r3
mult	 r1, r0 => r0
store	 r0 => r1
output	 4
