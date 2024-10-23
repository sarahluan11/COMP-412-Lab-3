loadI	 4 => r0
loadI	 1024 => r1
load	 r1 => r1
add	 r0, r1 => r1
loadI	 1024 => r0
store	 r1 => r0
output	 1024
