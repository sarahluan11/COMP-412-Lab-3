loadI	 1024 => r0
load	 r0 => r0
mult	 r0, r0 => r1
loadI	 1028 => r2
store	 r1 => r2
loadI	 1032 => r2
mult	 r1, r0 => r1
store	 r1 => r2
loadI	 1036 => r2
loadI	 1040 => r3
loadI	 1044 => r4
mult	 r1, r0 => r1
store	 r1 => r2
mult	 r1, r0 => r1
mult	 r1, r0 => r0
store	 r1 => r3
store	 r0 => r4
output	 1024
output	 1028
output	 1032
output	 1040
output	 1044
