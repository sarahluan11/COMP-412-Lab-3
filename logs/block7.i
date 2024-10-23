loadI	 0 => r0
loadI	 4 => r1
loadI	 0 => r2
loadI	 1 => r3
loadI	 2000 => r4
add	 r2, r3 => r3
add	 r3, r2 => r5
add	 r5, r3 => r6
add	 r6, r5 => r7
add	 r7, r6 => r8
loadI	 32768 => r9
store	 r0 => r9
add	 r8, r7 => r0
loadI	 32772 => r9
store	 r8 => r9
add	 r0, r8 => r8
loadI	 32776 => r9
store	 r0 => r9
add	 r8, r0 => r0
loadI	 32780 => r9
store	 r8 => r9
add	 r0, r8 => r8
loadI	 32784 => r9
store	 r0 => r9
add	 r8, r0 => r0
store	 r2 => r4
add	 r4, r1 => r4
store	 r3 => r4
add	 r4, r1 => r4
store	 r5 => r4
add	 r4, r1 => r4
store	 r6 => r4
add	 r4, r1 => r4
store	 r7 => r4
add	 r4, r1 => r4
loadI	 32772 => r9
load	 r9 => r7
store	 r7 => r4
add	 r4, r1 => r4
loadI	 32776 => r9
load	 r9 => r7
store	 r7 => r4
add	 r4, r1 => r4
loadI	 32780 => r9
load	 r9 => r7
store	 r7 => r4
add	 r4, r1 => r4
loadI	 32784 => r9
load	 r9 => r7
store	 r7 => r4
add	 r4, r1 => r4
store	 r8 => r4
add	 r4, r1 => r1
store	 r0 => r1
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
