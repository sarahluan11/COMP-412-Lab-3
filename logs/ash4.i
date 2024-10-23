loadI	 2048 => r0
loadI	 16 => r1
add	 r0, r1 => r2
store	 r1 => r2
add	 r1, r1 => r1
add	 r0, r1 => r2
store	 r1 => r2
output	 2080
load	 r0 => r2
loadI	 2 => r1
mult	 r0, r1 => r1
loadI	 3 => r0
mult	 r2, r0 => r0
store	 r0 => r1
output	 4096
loadI	 10 => r1
loadI	 8 => r0
loadI	 7 => r2
add	 r1, r0 => r0
mult	 r0, r2 => r2
loadI	 37 => r0
sub	 r2, r0 => r0
loadI	 2144 => r2
store	 r0 => r2
output	 2144
loadI	 5 => r2
loadI	 88 => r0
loadI	 2052 => r1
load	 r1 => r1
mult	 r2, r1 => r1
add	 r1, r0 => r0
loadI	 2056 => r1
load	 r1 => r1
loadI	 12 => r2
mult	 r2, r1 => r1
loadI	 11 => r2
sub	 r1, r2 => r2
add	 r0, r2 => r2
loadI	 3072 => r0
store	 r2 => r0
output	 3072
