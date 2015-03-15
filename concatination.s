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
	

done:
    halt          
