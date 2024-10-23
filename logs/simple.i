loadI	 5 => r0
loadI	 10 => r1
add	 r0, r1 => r0
add	 r1, r0 => r1
mult	 r0, r1 => r1
loadI	 1024 => r0
store	 r1 => r0
load	 r0 => r1
store	 r1 => r0
load	 r0 => r0
output	 1024
