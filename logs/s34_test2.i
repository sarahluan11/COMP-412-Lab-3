loadI	 1024 => r0
load	 r0 => r0
lshift	 r0, r0 => r1
lshift	 r1, r0 => r2
lshift	 r2, r0 => r3
lshift	 r3, r0 => r4
lshift	 r4, r0 => r5
lshift	 r5, r0 => r6
lshift	 r6, r0 => r7
lshift	 r7, r0 => r8
loadI	 32768 => r9
store	 r6 => r9
lshift	 r8, r0 => r6
loadI	 32772 => r9
store	 r8 => r9
lshift	 r6, r0 => r8
loadI	 32776 => r9
store	 r6 => r9
lshift	 r8, r0 => r6
loadI	 32780 => r9
store	 r8 => r9
lshift	 r6, r0 => r8
loadI	 32784 => r9
store	 r6 => r9
lshift	 r8, r0 => r6
loadI	 32788 => r9
store	 r8 => r9
lshift	 r6, r0 => r8
loadI	 32792 => r9
store	 r6 => r9
lshift	 r8, r0 => r6
loadI	 32796 => r9
store	 r8 => r9
lshift	 r6, r0 => r8
add	 r0, r1 => r1
add	 r2, r3 => r3
add	 r4, r5 => r5
loadI	 32768 => r9
load	 r9 => r2
add	 r2, r7 => r7
loadI	 32772 => r9
load	 r9 => r2
loadI	 32800 => r9
store	 r0 => r9
loadI	 32776 => r9
load	 r9 => r0
add	 r2, r0 => r0
loadI	 32780 => r9
load	 r9 => r2
loadI	 32804 => r9
store	 r4 => r9
loadI	 32784 => r9
load	 r9 => r4
add	 r2, r4 => r4
loadI	 32788 => r9
load	 r9 => r2
loadI	 32808 => r9
store	 r8 => r9
loadI	 32792 => r9
load	 r9 => r8
add	 r2, r8 => r8
loadI	 32796 => r9
load	 r9 => r2
add	 r2, r6 => r6
add	 r1, r3 => r3
add	 r5, r7 => r7
add	 r0, r4 => r4
add	 r8, r6 => r6
add	 r3, r7 => r7
add	 r4, r6 => r6
add	 r6, r7 => r7
loadI	 32808 => r9
load	 r9 => r6
add	 r7, r6 => r6
loadI	 0 => r7
store	 r6 => r7
loadI	 32804 => r9
load	 r9 => r6
loadI	 32800 => r9
load	 r9 => r4
add	 r6, r4 => r6
lshift	 r4, r6 => r6
sub	 r6, r4 => r4
loadI	 1028 => r6
add	 r7, r6 => r6
store	 r4 => r6
output	 1024
output	 1028