.data
	A:    .word 0
	B:    .word 1
	C:	  .word 20
	CONTROL: .word 0x10000
	DATA:    .word 0x10008
	
.text
	ld r20,CONTROL(r0) ; load CONTROL address
	ld r21,DATA(r0)    ; load DATA address
	
main:

done:
    halt          
