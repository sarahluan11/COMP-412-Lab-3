loadI	 1032 => r0
loadI	 1036 => r1
loadI	 1040 => r2
loadI	 1044 => r3
loadI	 1048 => r4
loadI	 1052 => r5
loadI	 1056 => r6
loadI	 1060 => r7
loadI	 1 => r8
loadI	 2 => r9
loadI	 32768 => rNone
store	 r7 => rNone
loadI	 3 => r7
loadI	 32772 => rNone
store	 r5 => rNone
loadI	 4 => r5
loadI	 32776 => rNone
store	 r4 => rNone
loadI	 5 => r4
loadI	 32780 => rNone
store	 r4 => rNone
loadI	 6 => r4
store	 r8 => r0
store	 r9 => r1
output	 1024
load	 r0 => r0
load	 r1 => r1
output	 1028
store	 r7 => r2
store	 r5 => r3
output	 1024
load	 r2 => r2
load	 r3 => r3
mult	 r0, r1 => r1
store	 r1 => r6
loadI	 32780 => rNone
load	 rNone => r6
loadI	 32776 => rNone
load	 rNone => r1
store	 r6 => r1
loadI	 32772 => rNone
load	 rNone => r1
store	 r4 => r1
mult	 r2, r3 => r3
loadI	 32768 => rNone
load	 rNone => r2
store	 r3 => r2
output	 1056
output	 1060
