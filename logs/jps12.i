loadI	 1024 => r0
loadI	 1028 => r1
loadI	 1032 => r2
loadI	 1 => r3
loadI	 2 => r4
loadI	 3 => r5
loadI	 4 => r6
loadI	 5 => r7
loadI	 6 => r8
mult	 r3, r6 => r6
mult	 r6, r6 => r6
mult	 r4, r7 => r7
mult	 r7, r7 => r7
mult	 r5, r8 => r8
mult	 r8, r8 => r8
store	 r6 => r0
store	 r7 => r1
store	 r8 => r2
output	 1024
output	 1028
output	 1032
