loadI	 2000 => r0
load	 r0 => r0
loadI	 4 => r1
loadI	 4 => r2
loadI	 4 => r3
loadI	 4 => r4
add	 r1, r2 => r5
add	 r3, r4 => r6
add	 r5, r6 => r7
add	 r6, r7 => r8
loadI	 32768 => r9
store	 r4 => r9
add	 r7, r8 => r4
loadI	 32772 => r9
store	 r3 => r9
add	 r8, r4 => r3
loadI	 32776 => r9
store	 r1 => r9
add	 r4, r3 => r1
loadI	 32780 => r9
store	 r2 => r9
add	 r3, r1 => r2
loadI	 32784 => r9
store	 r2 => r9
add	 r1, r2 => r2
store	 r0 => r5
store	 r0 => r6
store	 r0 => r7
store	 r0 => r8
store	 r0 => r4
store	 r0 => r3
store	 r0 => r1
loadI	 32784 => r9
load	 r9 => r1
store	 r0 => r1
store	 r0 => r2
loadI	 16 => r2
loadI	 24 => r1
loadI	 40 => r3
loadI	 32776 => r9
load	 r9 => r8
loadI	 32780 => r9
load	 r9 => r7
add	 r8, r7 => r8
loadI	 32772 => r9
load	 r9 => r6
add	 r7, r6 => r7
loadI	 32768 => r9
load	 r9 => r5
add	 r6, r5 => r5
store	 r0 => r2
store	 r0 => r1
store	 r0 => r3
store	 r0 => r8
store	 r0 => r7
output	 8
output	 16
output	 24
output	 40
output	 64
output	 104
output	 168
output	 272
