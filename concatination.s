.data
	a: .asciiz "Hello"
	b: .asciiz " World"
	c: .asciiz "XXXXXXXXXXXXXXXXXXXX" ; Space for the concatenated string.

	CONTROL: .word 0x10000
	DATA:    .word 0x10008
	
.text
	ld r20,CONTROL(r0) ; load CONTROL address
	ld r21,DATA(r0)    ; load DATA address
	
main:
	daddi r1,r0,0 ;i
	daddi r2,r0,0 ;n
	
	;place string a into c
loop:
	lb r2,a(r1)	;load byte i from a
	beqz r2,done ; we're done if the byte we read is zero
	lb r3,c(r1)
	sb r2,c(r1)	;place it in i in c
	sb r3,a(r1)
	daddi r1,r1,2 ;i++
	j loop

done:

	daddi r4,r0,0
loop2:
	lb r2,b(r4)	;load byte i from b
	beqz r2,done2 ; we're done if the byte we read is zero
	lb r3,c(r1)
	sb r2,c(r1)	;place it in i in c
	sb r3,b(r4)
	daddi r1,r1,2 ;i=i+2
	daddi r4,r4,2
	j loop2

done2:

	daddi r1,r0,c
	sd r1,0(r21)     ; set DATA to output value (address of string, here)
	
	daddi r1,r0,4
	sd r1,0(r20)     ; write CONTROL
    halt          
