loadI	 1024 => r0
loadI	 1028 => r1
loadI	 1032 => r2
store	 r0 => r0
store	 r1 => r1
loadI	 2 => r1
add	 r2, r1 => r0
add	 r0, r1 => r0
add	 r0, r1 => r0
mult	 r0, r1 => r1
store	 r1 => r2
output	 1024
output	 1028
output	 1032
