loadI	 2 => r0
loadI	 4 => r1
loadI	 1024 => r2
add	 r0, r1 => r1
loadI	 52 => r0
mult	 r0, r0 => r0
store	 r1 => r2
output	 1024
