loadI	 1024 => r0
load	 r0 => r0
loadI	 1028 => r1
add	 r0, r1 => r1
loadI	 1032 => r0
add	 r1, r0 => r0
loadI	 42 => r1
add	 r0, r1 => r1
store	 r1 => r0
output	 2160
