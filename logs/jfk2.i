loadI	 0 => r0
loadI	 1 => r1
add	 r0, r1 => r2
add	 r1, r2 => r3
add	 r2, r3 => r4
add	 r3, r4 => r5
add	 r4, r5 => r6
add	 r5, r6 => r7
add	 r6, r7 => r8
loadI	 32768 => r9
store	 r8 => r9
add	 r7, r8 => r8
loadI	 32772 => r9
store	 r8 => r9
loadI	 0 => r8
loadI	 32776 => r9
store	 r7 => r9
loadI	 4 => r7
loadI	 32780 => r9
store	 r6 => r9
loadI	 8 => r6
loadI	 32784 => r9
store	 r5 => r9
loadI	 12 => r5
loadI	 32788 => r9
store	 r4 => r9
loadI	 16 => r4
loadI	 32792 => r9
store	 r4 => r9
loadI	 20 => r4
loadI	 32796 => r9
store	 r4 => r9
loadI	 24 => r4
loadI	 32800 => r9
store	 r4 => r9
loadI	 28 => r4
loadI	 32804 => r9
store	 r4 => r9
loadI	 32 => r4
loadI	 32808 => r9
store	 r4 => r9
loadI	 36 => r4
store	 r0 => r8
store	 r1 => r7
store	 r2 => r6
store	 r3 => r5
loadI	 32788 => r9
load	 r9 => r5
loadI	 32792 => r9
load	 r9 => r6
store	 r5 => r6
loadI	 32784 => r9
load	 r9 => r6
loadI	 32796 => r9
load	 r9 => r5
store	 r6 => r5
loadI	 32780 => r9
load	 r9 => r6
loadI	 32800 => r9
load	 r9 => r2
store	 r6 => r2
loadI	 32776 => r9
load	 r9 => r2
loadI	 32804 => r9
load	 r9 => r6
store	 r2 => r6
loadI	 32768 => r9
load	 r9 => r6
loadI	 32808 => r9
load	 r9 => r1
store	 r6 => r1
loadI	 32772 => r9
load	 r9 => r1
store	 r1 => r4
output	 0
output	 4
output	 8
output	 12
output	 16
output	 20
output	 24
output	 28
output	 32
output	 36
