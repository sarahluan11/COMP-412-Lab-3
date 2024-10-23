loadI	 1024 => r0
loadI	 1028 => r1
loadI	 1032 => r2
loadI	 1036 => r3
load	 r0 => r4
add	 r1, r2 => r5
sub	 r0, r4 => r6
add	 r0, r0 => r7
add	 r0, r0 => r8
sub	 r7, r4 => r4
store	 r4 => r0
store	 r1 => r2
store	 r2 => r3
output	 1024
output	 1032
output	 1036
