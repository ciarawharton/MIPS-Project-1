.data

prompt: .asciiz "Input integers: " # getting user input for integers
message: .asciiz "\n You entered "
# x = 02880894
# N = 26 + (02880894 % 11), N(base) = 31
# M = N - 10, M = 21

.text
# gets rid of error message
.globl main
main:
# loading to registers
li $v0, 4
la $a0, prompt
syscall

# get user's integers
li $v0, 10
syscall

# store integers into $t0
move $t0, $v0

# displaying message
li $v0, 4
la $a0, message
syscall

# printing the integers
li $v0, 1
move $a0, $t0
syscall

.code
# for each character of input
# loop instruction
ischaracter: # label name/creating a function?
   xor cx,cx # cx register = counter, setting to 0
    nop
    inc cx # incrementing counter
    cmp cx,10 # comparing cx to the limit
    jle ischaracter # loop while less or equal
loop ischaracter

# adding the numbers from user input

# program must exit afterwards


