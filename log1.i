[ loadI   2000 => r32 ; loadI   4 => r10 ]
[ add     r32, r10 => r29 ; load    r32 => r30 ]
[ add     r29, r10 => r28 ; load    r29 => r31 ]
[ add     r28, r10 => r27 ; load    r28 => r23 ]
[ add     r27, r10 => r26 ; load    r27 => r22 ]
[ add     r26, r10 => r15 ; load    r26 => r24 ]
[ load    r15 => r25 ; add     r15, r10 => r1 ]
[ loadI   2000 => r14 ; nop ]
[ add     r30, r31 => r19 ; add     r14, r10 => r11 ]
[ add     r11, r10 => r9 ; nop ]
[ mult    r22, r23 => r21 ; add     r23, r22 => r18 ]
[ add     r18, r19 => r17 ; add     r9, r10 => r8 ]
[ mult    r24, r25 => r20 ; nop ]
[ nop ; nop ]
[ nop ; nop ]
[ add     r20, r21 => r16 ; nop ]
[ add     r16, r17 => r3 ; nop ]
[ store   r3 => r1 ; nop ]
[ nop ; nop ]
[ nop ; nop ]
[ nop ; nop ]
[ nop ; nop ]
[ nop ; nop ]
[ load    r11 => r13 ; load    r14 => r12 ]
[ load    r9 => r7 ; load    r8 => r6 ]
[ nop ; nop ]
[ nop ; nop ]
[ nop ; nop ]
[ nop ; nop ]
[ mult    r12, r13 => r5 ; nop ]
[ add     r6, r7 => r4 ; nop ]
[ nop ; nop ]
[ add     r4, r5 => r2 ; nop ]
[ add     r2, r3 => r0 ; nop ]
[ store   r0 => r1 ; nop ]
[ nop ; nop ]
[ nop ; nop ]
[ nop ; nop ]
[ nop ; nop ]
[ nop ; nop ]
[ output  2024 ; nop ]
