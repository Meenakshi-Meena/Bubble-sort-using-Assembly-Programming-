.bubblesort: @bubblesort function

    mov r3,r0    @move r0 in r3
    add r4,r0,4  @increase the value of r0

    mov r5,0     @put 0 in r5
    mov r6,4   @move 4 into r6
    mov r7,0    @move 0 into r7

 .Repeat:
    ld r1, [r3]  @load r3 and r4 in r1 and r2 
    ld r2, [r4]  

    cmp r1, r2   @compares r1 and r2
    bgt .swap    @if r1 is greater then r2 then swap
    b .donot    @)no swap

 .swap:
    add r7,r7,1   @Here increase the count in r7 that is  used to check array is    
                  @ sorted or not
    mov r9, r1    
    mov r1, r2    @Swap the two elements
    mov r2, r9
      
 .donot:
    st r1, [r3]  @Store the elements back without swap
    st r2, [r4]
 
    add r3, r3,4  @Increase the address of array elements 
    add r4, r4,4  @stored in r3 and r4
    add r5, r5, 1 @Increase the loop count by 1

    cmp r6 , r5   @Compare to check whether all elements all checked 
    bgt .Repeat     @if not then jump again to loop
 
    cmp r7,0      @Compaire r7 with 0

    mov r5,0      @move the value 0 in  r5
      mov r3,r0
    mov r6,4
    add r4,r0,4    @Same as declared in starting
    mov r7,0   

    bgt .Repeat     @if array is not sorted then jump to .loop
ret    @return 


.main:

	@ Loading the values as an array into the registers
	mov r0, 0    
	mov r1, 12	@ replace 12 with the number to be sorted
	st r1, 0[r0]
	mov r1, 7	@ replace 7 with the number to be sorted
	st r1, 4[r0]
	mov r1, 11      @ replace 11 with the number to be sorted
	st r1, 8[r0]
	mov r1, 9   	@ replace 9 with the number to be sorted
	st r1, 12[r0]
	mov r1, 3   	@ replace 3 with the number to be sorted
	st r1, 16[r0]
	mov r1, 15  	@ replace 15 with the number to be sorted
	st r1, 20[r0]
	@ EXTEND ON SIMILAR LINES FOR MORE NUMBERS

	mov r2, 0       @ Starting address of the array
	
	@ Retreive the end address of the array
	mov r3, 6	@ REPLACE 6 WITH N, where, N is the number of numbers being sorted
	
	

	call .bubblesort
	
	

	@ Print statements for the result
        mov r3, 5      @ REPLACE 5 WITH N-1, where, N is the number of numbers being sorted 
        mov r2, 0      @ Starting address of the array
        .prntLoop:
           ld r1, 0[r2]
           .print r1
           add r2,r2,4  @ Incrementing address value
           cmp r3, 0    @ r3 contains number of elements in array
           sub r3,r3,1  
	   bgt .prntLoop
