loadI	 1024 => r0
load	 r0 => r1
load	 r1 => r2
load	 r2 => r2
store	 r2 => r0
add	 r0, r1 => r1
loadI	 3 => r0
lshift	 r1, r0 => r0
loadI	 1000 => r1
store	 r0 => r1
output	 1032
output	 1000
