loadI	 1024 => r0
load	 r0 => r0
loadI	 1028 => r1
load	 r1 => r1
loadI	 1032 => r2
load	 r2 => r2
add	 r0, r1 => r1
add	 r2, r1 => r1
loadI	 1036 => r2
store	 r1 => r2
output	 1036
