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
add $t2, $zero, $zero # index of string
load:
la $s0, array # load address of the array to s0
la $t0, list # loading address of input
sll $t3, $t2, 1 # skipping spaces
sll $t4, $s1, 2
addu $t0, $t0, $t3 # position of string
addu $s0, $s0, $t4
lbu $t1, 0($t0) # loading bytes of input to t1
addiu $t1, $t1, -48 # converting characters to integer
sb $t1, 0($s0) # storing bytes into array
addi $t2, $t2, 1 # increment index of string by 1
addi $s1, $s1, 1 # increment index of array by 1
li $v0, 11 # printing input as integers
#addi $a0, $zero, 0xA
syscall
 

# program must exit afterwards


