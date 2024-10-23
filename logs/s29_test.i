loadI	 5 => r0
loadI	 3 => r1
loadI	 1024 => r2
mult	 r0, r1 => r1
store	 r0 => r2
add	 r0, r1 => r1
store	 r1 => r2
output	 1024
