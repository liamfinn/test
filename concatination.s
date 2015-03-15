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
	beqz r3,done ; we're done if the byte we read is zero
	sb r2,c(r1)	;place it in i in c
	daddi r1,r1,1 ;i++
	j loop
	;place string b into c+space for a

done:

	daddi r1,r0,c
	sd r1,0(r21)     ; set DATA to output value (address of string, here)
	
	daddi r1,r0,4
	sd r1,0(r20)     ; write CONTROL
    halt          
