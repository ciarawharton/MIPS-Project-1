.data

prompt: .asciiz "Input integers: " # getting user input for integers
counter: .word 0 # counter for the loop
input: .space 10 # for the user input
inputSize: .word 10 # makes sure user can only write 10 integers

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

# user input as a string
li $v0, 8
la $a0, input
li $a1, 11
syscall

lw $t1, counter
lw $t2, inputSize
la $t0, input

#
li $v0, 10
syscall

# store user integers into $t0
move $t0, $v0
# beginning of loop
loop:
    bgt $t1, $t2, end
    sll $t3, $t1
    


# printing the integers
#li $v0, 1
move $a0, $t0
syscall
 

# program must exit afterwards


