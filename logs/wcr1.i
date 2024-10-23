loadI	 2048 => r0
load	 r0 => r0
add	 r0, r0 => r1
add	 r0, r1 => r1
add	 r0, r1 => r1
loadI	 2048 => r0
add	 r0, r1 => r2
load	 r0 => r0
store	 r0 => r2
loadI	 2052 => r2
add	 r2, r1 => r0
load	 r2 => r2
store	 r2 => r0
loadI	 2056 => r0
add	 r0, r1 => r2
load	 r0 => r0
store	 r0 => r2
loadI	 2060 => r2
add	 r2, r1 => r1
load	 r2 => r2
store	 r2 => r1
output	 2068
output	 2072
output	 2076
