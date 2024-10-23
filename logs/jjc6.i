loadI	 2004 => r0
loadI	 2008 => r1
add	 r0, r0 => r0
add	 r1, r1 => r1
loadI	 2024 => r2
add	 r0, r1 => r1
store	 r1 => r2
output	 2024
