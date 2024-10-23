loadI	 2000 => r0
loadI	 2004 => r1
load	 r0 => r0
load	 r1 => r1
add	 r0, r1 => r1
load	 r1 => r1
loadI	 2008 => r0
store	 r1 => r0
output	 2008
