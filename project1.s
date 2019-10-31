.data

prompt: .asciiz "Input integers: " # getting user input for integers
counter: .word 0 # counter for the loop
input: .space 11 # for the user input
inputSize: .word 10 # makes sure user can only write 10 integers

# N = 26 + (X % 11), N(base) = 31
# M = N - 10, M = 21
.text
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

li $v0, 10
syscall

# store user integers into $t0
move $t4, $a0
lb $s3, ($t4)
# total sum register = 0
addi $t4, $t4, 1
lb $s3,($t4)
syscall

move $a0, $t0
syscall

secondLoop: # running through each number in string
    bgt $a1, 47 # greater than 0
    blt $a1, $t2, 58 # less than 10



#97-117

# program must exit afterwards


