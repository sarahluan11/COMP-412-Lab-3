loadI	 8 => r0
loadI	 2000 => r1
add	 r0, r1 => r2
mult	 r0, r0 => r3
lshift	 r0, r0 => r4
rshift	 r1, r0 => r5
sub	 r1, r2 => r6
lshift	 r3, r2 => r7
mult	 r2, r1 => r8
nop
nop
loadI	 32768 => r9
store	 r4 => r9
mult	 r3, r0 => r4
add	 r4, r1 => r4
nop
loadI	 32772 => r9
store	 r4 => r9
lshift	 r0, r2 => r4
loadI	 32776 => r9
store	 r4 => r9
rshift	 r0, r2 => r4
loadI	 32780 => r9
store	 r6 => r9
mult	 r0, r0 => r6
store	 r0 => r1
store	 r6 => r2
add	 r4, r3 => r3
add	 r7, r5 => r5
mult	 r5, r0 => r7
lshift	 r8, r4 => r6
loadI	 32784 => r9
store	 r6 => r9
loadI	 32780 => r9
load	 r9 => r6
sub	 r5, r6 => r6
nop
rshift	 r4, r0 => r5
nop
lshift	 r8, r3 => r3
add	 r3, r4 => r4
sub	 r4, r6 => r4
sub	 r4, r6 => r4
add	 r0, r6 => r6
add	 r1, r2 => r2
mult	 r2, r1 => r1
sub	 r1, r6 => r6
add	 r0, r0 => r0
store	 r0 => r2
output	 2000
output	 2008
