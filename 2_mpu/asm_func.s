.syntax unified

.global	read_sp
read_sp:
	mov r0 , sp
	blx lr

.global	read_msp
read_msp:
	mrs r0 , msp
	blx lr
.global	read_psp
read_psp:
	mrs r0 , PSP
	blx lr

.global	read_ctrl
read_ctrl:
	mrs r0, CONTROL
	blx lr

.global	start_user
start_user:
	movs lr,r0
	msr psp, r1
	mov	r3,	#3
	MSR CONTROL, r3 
	
	ISB
	blx lr

.global	sw_priv
sw_priv:
	mov	r0,	#0
	MSR CONTROL,    r0  
	ISB
	blx lr
