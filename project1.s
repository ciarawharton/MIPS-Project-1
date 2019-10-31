.data

prompt: .asciiz "Input integers: " # getting user input for integers
counter: .word 0 # counter for the loop
input: .space 10 # for the user input
inputSize: .word 10 # makes sure user can only write 10 integers

# x = Howard ID
# N = 26 + (X % 11), N(base) = 31
# M = N - 10, M = 21
# base 31

# range =

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
# total sum register = 0
li $s4, 0
# s3 is the total sum register

# beginning of loop
loop:
    bgt $t2, $t3, end
    sll $t4, $t2, 2 # counter x 4 store that into t3
    addu $t4, $t4, $t1 # for the index of the array
    lb $t7, 0($t4)
    addu $s8, $s8, $t7 # for the register
    addi $t2, $t2, 1
j loop


end:
    la $a0, input
syscall



# printing the integers
#li $v0, 1
move $a0, $t0
syscall
 

# program must exit afterwards


