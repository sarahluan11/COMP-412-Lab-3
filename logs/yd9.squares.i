loadI	 2000 => r0
loadI	 1 => r1
loadI	 4 => r2
mult	 r1, r1 => r3
add	 r1, r1 => r4
mult	 r4, r4 => r5
add	 r4, r1 => r4
mult	 r4, r4 => r6
add	 r4, r1 => r4
mult	 r4, r4 => r7
add	 r4, r1 => r4
mult	 r4, r4 => r8
add	 r4, r1 => r4
loadI	 32768 => r9
store	 r8 => r9
mult	 r4, r4 => r8
add	 r4, r1 => r4
loadI	 32772 => r9
store	 r8 => r9
mult	 r4, r4 => r8
add	 r4, r1 => r4
loadI	 32776 => r9
store	 r8 => r9
mult	 r4, r4 => r8
add	 r4, r1 => r4
loadI	 32780 => r9
store	 r8 => r9
mult	 r4, r4 => r8
add	 r4, r1 => r4
loadI	 32784 => r9
store	 r8 => r9
mult	 r4, r4 => r8
add	 r4, r1 => r1
mult	 r1, r1 => r1
store	 r3 => r0
add	 r0, r2 => r0
store	 r5 => r0
add	 r0, r2 => r0
store	 r6 => r0
add	 r0, r2 => r0
store	 r7 => r0
add	 r0, r2 => r0
loadI	 32768 => r9
load	 r9 => r7
store	 r7 => r0
add	 r0, r2 => r0
loadI	 32772 => r9
load	 r9 => r7
store	 r7 => r0
add	 r0, r2 => r0
loadI	 32776 => r9
load	 r9 => r7
store	 r7 => r0
add	 r0, r2 => r0
loadI	 32780 => r9
load	 r9 => r7
store	 r7 => r0
add	 r0, r2 => r0
loadI	 32784 => r9
load	 r9 => r7
store	 r7 => r0
add	 r0, r2 => r0
store	 r8 => r0
add	 r0, r2 => r2
store	 r1 => r2
output	 2000
output	 2004
output	 2008
output	 2012
output	 2016
output	 2020
output	 2024
output	 2028
output	 2032
output	 2036
output	 2040
