loadI	 8 => r0
loadI	 15 => r1
mult	 r0, r1 => r1
store	 r1 => r0
output	 8
load	 r0 => r1
mult	 r1, r1 => r1
store	 r1 => r0
output	 8
load	 r0 => r1
add	 r1, r1 => r1
store	 r1 => r0
output	 8
