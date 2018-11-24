@ ARM Assembly - exercise 3

	.text 	@ instruction memory

	
@ Write YOUR CODE HERE	

@ ---------------------	
@ Fibonacci:
Fibonacci:
sub sp,sp,#20
str r11,[sp,#16]
str r10,[sp,#12]
str r9,[sp,#8]
str r8,[sp,#4]
str r7,[sp,#0]
mov r11,#0
mov r7,#1
mov r8,#0
mov r9,#1
mov r10,#0
loop:cmp r7,r0

beq loopexit

add r10,r8,r9
mov r8,r9
mov r9,r10
add r7,r7,#1
add r11,r11,r9

b loop
loopexit:
add r11,r11,#2
mov r0,r11
ldr r10,[sp,#16]
ldr r10,[sp,#12]
ldr r9,[sp,#8]
ldr r8,[sp,#4]
ldr r7,[sp,#0]
add sp,sp,#20
mov pc,lr




@ ---------------------
	
	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #8 	@the value n

	@ calling the Fibonacci function
	mov r0, r4 	@the arg1 load
	bl Fibonacci
	mov r5,r0
	

	@ load aguments and print
	ldr r0, =format
	mov r1, r4
	mov r2, r5
	bl printf

	@ stack handling (pop lr from the stack) and return
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

	.data	@ data memory
format: .asciz "F_%d is %d\n"

