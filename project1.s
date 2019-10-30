.data

prompt: .asciiz "Input integers: " # getting user input for integers
message: .asciiz "\n You entered "
# x = 02880894
# N = 26 + (02880894 % 11), N = 31
# M = N - 10, M = 21

.text
# gets rid of error message
.globl main
main:
# loading to registers
li $v0, 4
la $a0, prompt
syscall

