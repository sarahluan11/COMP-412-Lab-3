loadI	 1024 => r0
load	 r0 => r1
load	 r0 => r0
loadI	 1 => r2
sub	 r1, r2 => r1
mult	 r1, r0 => r0
sub	 r1, r2 => r1
mult	 r1, r0 => r3
sub	 r1, r2 => r1
mult	 r1, r3 => r4
sub	 r1, r2 => r1
mult	 r1, r4 => r5
sub	 r1, r2 => r1
mult	 r1, r5 => r6
sub	 r1, r2 => r1
mult	 r1, r6 => r7
sub	 r1, r2 => r1
mult	 r1, r7 => r8
sub	 r1, r2 => r2
mult	 r2, r8 => r2
loadI	 128 => r1
store	 r0 => r1
loadI	 132 => r1
store	 r3 => r1
loadI	 136 => r1
store	 r4 => r1
loadI	 140 => r1
store	 r5 => r1
loadI	 144 => r1
store	 r6 => r1
loadI	 148 => r1
store	 r7 => r1
loadI	 152 => r1
store	 r8 => r1
loadI	 156 => r1
store	 r2 => r1
output	 128
output	 132
output	 136
output	 140
output	 144
output	 148
output	 152
output	 156
