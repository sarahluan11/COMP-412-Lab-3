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
loadI	 128 => r8
loadI	 32772 => r9
store	 r7 => r9
loadI	 132 => r7
loadI	 32776 => r9
store	 r6 => r9
loadI	 136 => r6
loadI	 32780 => r9
store	 r5 => r9
loadI	 140 => r5
loadI	 32784 => r9
store	 r4 => r9
loadI	 144 => r4
loadI	 32788 => r9
store	 r4 => r9
loadI	 148 => r4
loadI	 32792 => r9
store	 r4 => r9
loadI	 152 => r4
loadI	 32796 => r9
store	 r4 => r9
loadI	 156 => r4
loadI	 32800 => r9
store	 r4 => r9
loadI	 160 => r4
store	 r0 => r8
store	 r1 => r7
store	 r2 => r6
store	 r3 => r5
loadI	 32784 => r9
load	 r9 => r5
loadI	 32788 => r9
load	 r9 => r3
store	 r5 => r3
loadI	 32780 => r9
load	 r9 => r3
loadI	 32792 => r9
load	 r9 => r5
store	 r3 => r5
loadI	 32776 => r9
load	 r9 => r5
loadI	 32796 => r9
load	 r9 => r3
store	 r5 => r3
loadI	 32772 => r9
load	 r9 => r3
loadI	 32800 => r9
load	 r9 => r5
store	 r3 => r5
loadI	 32768 => r9
load	 r9 => r5
store	 r5 => r4
output	 128
output	 132
output	 136
output	 140
output	 144
output	 148
output	 152
output	 156
output	 160
