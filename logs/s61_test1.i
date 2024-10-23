loadI	 1024 => r0
loadI	 1032 => r1
loadI	 1036 => r2
loadI	 1036 => r3
loadI	 1036 => r4
loadI	 1036 => r5
store	 r2 => r2
store	 r3 => r3
store	 r4 => r4
store	 r5 => r5
store	 r0 => r0
store	 r1 => r1
add	 r0, r1 => r6
load	 r1 => r7
load	 r1 => r1
sub	 r0, r6 => r8
add	 r0, r6 => r0
loadI	 32768 => r9
store	 r0 => r9
mult	 r6, r6 => r0
store	 r6 => r6
store	 r2 => r2
store	 r3 => r3
store	 r4 => r4
store	 r5 => r5
output	 1024
output	 1032
output	 1036
output	 2056
