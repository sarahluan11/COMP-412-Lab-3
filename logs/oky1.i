loadI	 1 => r0
loadI	 4 => r1
loadI	 2048 => r2
add	 r2, r1 => r3
add	 r3, r1 => r4
add	 r4, r1 => r5
add	 r5, r1 => r6
store	 r0 => r2
output	 2048
add	 r0, r0 => r7
mult	 r7, r0 => r7
store	 r7 => r3
add	 r0, r0 => r7
output	 2052
add	 r0, r7 => r8
mult	 r8, r7 => r8
mult	 r8, r0 => r8
store	 r8 => r4
add	 r0, r7 => r8
output	 2056
loadI	 32768 => r9
store	 r4 => r9
add	 r0, r8 => r4
mult	 r4, r0 => r4
mult	 r4, r7 => r4
mult	 r4, r8 => r4
store	 r4 => r5
add	 r0, r8 => r4
output	 2060
loadI	 32772 => r9
store	 r5 => r9
add	 r0, r4 => r5
mult	 r0, r5 => r5
mult	 r7, r5 => r5
mult	 r8, r5 => r5
mult	 r4, r5 => r5
store	 r5 => r6
output	 2064
add	 r6, r1 => r1
load	 r2 => r2
load	 r3 => r3
loadI	 32768 => r9
load	 r9 => r5
load	 r5 => r5
loadI	 32772 => r9
load	 r9 => r4
load	 r4 => r4
load	 r6 => r6
add	 r2, r3 => r3
add	 r3, r5 => r5
add	 r5, r4 => r4
add	 r4, r6 => r6
store	 r6 => r1
output	 2068
