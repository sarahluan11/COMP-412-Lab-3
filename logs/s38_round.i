loadI	 0 => r0
loadI	 4 => r1
loadI	 8 => r2
loadI	 12 => r3
loadI	 16 => r4
add	 r0, r4 => r5
add	 r0, r3 => r6
add	 r0, r2 => r7
add	 r0, r1 => r8
loadI	 32768 => r9
store	 r5 => r9
add	 r0, r0 => r5
add	 r0, r1 => r1
add	 r0, r2 => r2
add	 r0, r3 => r3
add	 r0, r4 => r4
loadI	 32772 => r9
store	 r5 => r9
loadI	 1024 => r5
loadI	 32776 => r9
store	 r6 => r9
add	 r5, r0 => r6
loadI	 32780 => r9
store	 r7 => r9
add	 r5, r1 => r7
loadI	 32784 => r9
store	 r8 => r9
add	 r5, r2 => r8
loadI	 32788 => r9
store	 r3 => r9
add	 r5, r3 => r3
add	 r5, r4 => r5
store	 r0 => r6
store	 r1 => r7
store	 r2 => r8
loadI	 32788 => r9
load	 r9 => r8
store	 r8 => r3
store	 r4 => r5
output	 1024
output	 1028
output	 1032
output	 1036
output	 1040
