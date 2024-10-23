loadI	 1024 => r0
loadI	 7 => r1
store	 r1 => r0
loadI	 1028 => r0
loadI	 5 => r2
store	 r2 => r0
loadI	 1032 => r0
loadI	 1036 => r3
loadI	 1040 => r4
mult	 r1, r1 => r1
store	 r1 => r0
mult	 r2, r2 => r2
store	 r2 => r3
sub	 r1, r2 => r2
store	 r2 => r4
output	 1024
output	 1028
output	 1032
output	 1036
output	 1040
