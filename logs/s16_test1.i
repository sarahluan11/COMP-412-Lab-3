loadI	 3 => r0
loadI	 4 => r1
mult	 r0, r1 => r2
mult	 r0, r1 => r3
mult	 r0, r1 => r4
mult	 r0, r1 => r1
loadI	 1024 => r0
loadI	 1024 => r5
store	 r1 => r0
add	 r4, r2 => r2
output	 1024
add	 r2, r2 => r2
store	 r2 => r5
output	 1024
