loadI	 1 => r0
loadI	 1024 => r1
lshift	 r0, r0 => r2
lshift	 r2, r0 => r3
lshift	 r3, r0 => r4
lshift	 r4, r0 => r5
lshift	 r5, r0 => r6
lshift	 r6, r0 => r7
lshift	 r7, r0 => r8
loadI	 32768 => r9
store	 r1 => r9
lshift	 r8, r0 => r1
loadI	 32772 => r9
store	 r7 => r9
lshift	 r1, r0 => r7
loadI	 32776 => r9
store	 r1 => r9
lshift	 r7, r0 => r1
loadI	 32780 => r9
store	 r7 => r9
lshift	 r1, r0 => r7
loadI	 32784 => r9
store	 r1 => r9
lshift	 r7, r0 => r1
loadI	 32788 => r9
store	 r7 => r9
lshift	 r1, r0 => r7
loadI	 32792 => r9
store	 r1 => r9
lshift	 r7, r0 => r1
loadI	 32796 => r9
store	 r7 => r9
lshift	 r1, r0 => r7
loadI	 32800 => r9
store	 r1 => r9
lshift	 r7, r0 => r1
add	 r0, r2 => r2
add	 r3, r4 => r4
add	 r5, r6 => r6
loadI	 32772 => r9
load	 r9 => r3
add	 r3, r8 => r8
loadI	 32776 => r9
load	 r9 => r3
loadI	 32804 => r9
store	 r0 => r9
loadI	 32780 => r9
load	 r9 => r0
add	 r3, r0 => r0
loadI	 32784 => r9
load	 r9 => r3
loadI	 32808 => r9
store	 r5 => r9
loadI	 32788 => r9
load	 r9 => r5
add	 r3, r5 => r5
loadI	 32792 => r9
load	 r9 => r3
loadI	 32812 => r9
store	 r1 => r9
loadI	 32796 => r9
load	 r9 => r1
add	 r3, r1 => r1
loadI	 32800 => r9
load	 r9 => r3
add	 r3, r7 => r7
add	 r2, r4 => r4
add	 r6, r8 => r8
add	 r0, r5 => r5
add	 r1, r7 => r7
add	 r4, r8 => r8
add	 r5, r7 => r7
add	 r7, r8 => r8
loadI	 32812 => r9
load	 r9 => r7
add	 r8, r7 => r7
loadI	 32768 => r9
load	 r9 => r8
store	 r7 => r8
loadI	 32808 => r9
load	 r9 => r7
loadI	 32804 => r9
load	 r9 => r5
add	 r7, r5 => r7
lshift	 r5, r7 => r7
sub	 r7, r5 => r5
loadI	 4 => r7
add	 r8, r7 => r7
store	 r5 => r7
output	 1024
output	 1028