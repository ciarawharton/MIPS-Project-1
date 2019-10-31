.data

prompt: .asciiz "Input integers: " # getting user input for integers
message: .asciiz "\n You entered "
# x = Howard ID
# N = 26 + (X % 11), N(base) = 31
# M = N - 10, M = 21

.text
# gets rid of error message
.globl main
main:
# loading to registers
li $v0, 4
la $a0, prompt
syscall

# get user's integers up to 10 numbers?
li $v0, 10
syscall

# store user integers into $t0
move $t0, $v0

# displaying message
li $v0, 4
la $a0, message
syscall

# printing the integers
li $v0, 1
move $a0, $t0
syscall

#.code
# loop instruction to add integers to an array
loop:
    ischaracter: # label name/creating a function?
       xor cx,cx # cx register = counter, setting to 0
        nop
        inc cx # incrementing counter
        cmp cx,10 # comparing cx to the limit
    # adding the numbers from user input
        mov eax,
        add eax, $st0
        jle ischaracter # loop while less or equal
    loop ischaracter
load:

syscall
 

# program must exit afterwards


