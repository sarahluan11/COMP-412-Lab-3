loadI	 1 => r0
loadI	 2 => r1
loadI	 4 => r2
loadI	 1 => r3
loadI	 2048 => r4
add	 r3, r1 => r5
mult	 r1, r1 => r6
add	 r0, r1 => r1
mult	 r6, r1 => r1
add	 r6, r1 => r7
add	 r0, r1 => r1
mult	 r1, r1 => r1
add	 r7, r1 => r8
add	 r0, r1 => r1
loadI	 32768 => r9
store	 r5 => r9
add	 r8, r1 => r5
mult	 r3, r5 => r5
add	 r0, r1 => r1
loadI	 32772 => r9
store	 r8 => r9
add	 r5, r1 => r8
add	 r0, r1 => r1
loadI	 32776 => r9
store	 r5 => r9
add	 r8, r1 => r5
add	 r0, r1 => r1
loadI	 32780 => r9
store	 r8 => r9
add	 r5, r1 => r8
add	 r0, r1 => r1
loadI	 32784 => r9
store	 r5 => r9
add	 r8, r1 => r5
add	 r0, r1 => r1
loadI	 32788 => r9
store	 r8 => r9
add	 r5, r1 => r8
add	 r0, r1 => r1
loadI	 32792 => r9
store	 r5 => r9
add	 r8, r1 => r5
add	 r0, r1 => r1
store	 r3 => r4
add	 r4, r2 => r4
store	 r6 => r4
add	 r4, r2 => r4
store	 r7 => r4
add	 r4, r2 => r4
loadI	 32772 => r9
load	 r9 => r7
store	 r7 => r4
add	 r4, r2 => r4
loadI	 32776 => r9
load	 r9 => r7
store	 r7 => r4
add	 r4, r2 => r4
loadI	 32780 => r9
load	 r9 => r7
store	 r7 => r4
add	 r4, r2 => r4
loadI	 32784 => r9
load	 r9 => r7
store	 r7 => r4
add	 r4, r2 => r4
loadI	 32788 => r9
load	 r9 => r7
store	 r7 => r4
add	 r4, r2 => r4
loadI	 32792 => r9
load	 r9 => r7
store	 r7 => r4
add	 r4, r2 => r4
store	 r8 => r4
add	 r4, r2 => r2
store	 r5 => r2
output	 2048
output	 2052
output	 2056
output	 2060
output	 2064
output	 2068
output	 2072
output	 2076
