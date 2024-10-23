loadI	 256 => r0
loadI	 2 => r1
lshift	 r0, r1 => r0
mult	 r1, r1 => r1
add	 r1, r1 => r1
store	 r1 => r0
loadI	 1024 => r0
loadI	 1032 => r2
add	 r1, r1 => r1
store	 r1 => r2
output	 1024
output	 1032
