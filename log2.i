[ loadI   2000 => r24 ; loadI   4 => r3 ]
[ add     r24, r3 => r23 ; load    r24 => r19 ]
[ add     r23, r3 => r22 ; load    r23 => r17 ]
[ add     r22, r3 => r21 ; load    r22 => r15 ]
[ load    r21 => r14 ; add     r21, r3 => r20 ]
[ add     r20, r3 => r2 ; load    r20 => r16 ]
[ add     r2, r3 => r1 ; load    r2 => r18 ]
[ nop ; nop ]
[ mult    r17, r19 => r8 ; nop ]
[ nop ; nop ]
[ add     r14, r15 => r13 ; mult    r14, r15 => r10 ]
[ add     r16, r17 => r11 ; nop ]
[ mult    r18, r16 => r12 ; add     r18, r19 => r9 ]
[ add     r10, r11 => r7 ; add     r8, r9 => r5 ]
[ nop ; nop ]
[ add     r12, r13 => r6 ; nop ]
[ add     r6, r7 => r4 ; nop ]
[ add     r4, r5 => r0 ; nop ]
[ store   r0 => r1 ; nop ]
[ nop ; nop ]
[ nop ; nop ]
[ nop ; nop ]
[ nop ; nop ]
[ nop ; nop ]
[ output  2024 ; nop ]
