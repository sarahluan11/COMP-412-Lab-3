loadI	 4 => r0
loadI	 2000 => r1
add	 r1, r0 => r0
store	 r0 => r1
output	 2000
loadI	 2000 => r1
loadI	 2004 => r0
load	 r1 => r1
add	 r1, r1 => r1
store	 r1 => r0
output	 2004
nop
loadI	 5000 => r0
loadI	 2008 => r1
store	 r0 => r1
output	 2008
