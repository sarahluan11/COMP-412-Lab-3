loadI	 1024 => r0
load	 r0 => r0
loadI	 1028 => r1
load	 r1 => r1
add	 r0, r1 => r2
add	 r0, r2 => r2
add	 r1, r2 => r2
loadI	 1032 => r1
store	 r2 => r1
output	 1032
