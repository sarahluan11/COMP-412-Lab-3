loadI	 0 => r0
loadI	 4 => r1
load	 r0 => r2
load	 r1 => r3
add	 r0, r1 => r4
add	 r1, r4 => r5
add	 r4, r5 => r6
add	 r5, r6 => r7
add	 r6, r7 => r8
loadI	 32768 => r9
store	 r3 => r9
add	 r2, r0 => r3
loadI	 32772 => r9
store	 r0 => r9
add	 r2, r1 => r0
store	 r4 => r4
output	 4
load	 r4 => r4
store	 r5 => r5
output	 8
load	 r5 => r5
store	 r6 => r6
output	 12
load	 r6 => r6
store	 r7 => r7
output	 20
load	 r7 => r7
store	 r8 => r8
output	 32
load	 r8 => r8
store	 r3 => r3
output	 100
load	 r3 => r3
store	 r0 => r0
output	 104
store	 r3 => r1
load	 r0 => r0
loadI	 32776 => r9
store	 r6 => r9
load	 r1 => r6
store	 r6 => r6
add	 r6, r0 => r0
load	 r6 => r6
add	 r6, r0 => r0
loadI	 32780 => r9
store	 r5 => r9
load	 r0 => r5
loadI	 32784 => r9
store	 r0 => r9
loadI	 32772 => r9
load	 r9 => r0
store	 r6 => r0
load	 r3 => r6
store	 r5 => r1
load	 r8 => r5
store	 r6 => r4
load	 r7 => r6
loadI	 32772 => r9
store	 r0 => r9
loadI	 32780 => r9
load	 r9 => r0
store	 r5 => r0
loadI	 32776 => r9
load	 r9 => r5
loadI	 32788 => r9
store	 r3 => r9
load	 r5 => r3
store	 r6 => r5
load	 r0 => r5
store	 r3 => r7
load	 r4 => r4
store	 r5 => r8
load	 r1 => r1
loadI	 32788 => r9
load	 r9 => r8
store	 r4 => r8
loadI	 32772 => r9
load	 r9 => r4
load	 r4 => r4
loadI	 32784 => r9
load	 r9 => r5
store	 r1 => r5
output	 100
output	 104
output	 0
output	 4
output	 8
output	 12
output	 20
output	 32
output	 100
output	 304
