.data
    counter: .word 0 # counter for the loop
    input: .space 10 # for the user input
    inputSize: .word 10 # makes sure user can only write 10 integers
prompt: .asciiz "Input integers: " # getting user input for integers
# x = Howard ID
# N = 26 + (X % 11), N(base) = 31
# M = N - 10, M = 21
# base 31

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

lw $t1, iterator

loop:
    


# printing the integers
#li $v0, 1
move $a0, $t0
syscall
 

# program must exit afterwards


