.data

input: .space 11 # for the user input
enter: .asciiz "\n"
# N = 26 + (X % 11), N(base) = 31
# M = N - 10, M = 21
.text

main:
li $v0, 8
la $a0, input
li $a1, 11
syscall

enterInput:
move $t3, $a0
lb $s2, ($t3)

# check values
verify:
beq $t0, 10, output

sort_values:
addi $t0, $t0, 1
bge $s2, 97, lowercaseU # lowercase (BLT = less than)
bge $s2, 65, uppercaseU # uppercase (BLT = less than)
bge $s2, 48, numbers # for 0, BLT = less than

# creating a function
counter:
addi $t3, $t3, 1
lb $s2,($t3)
j verify

# uppercase character U
uppercaseU:
bge $s3, 84, counter
sub $s3, $s3, 65
add $s4, $s4, $s3
j counter

# for the lowercase character u
lowercaseU:
bge $s3, 65, counter # for the letter u
sub $s3, $s3, 48
add $s4, $s4, $s3
j counter

numbers:
bge $s3, 58, counter
sub $s3, $s3, 55
add $s4, $s4, $s3
j counter

calling:
li $v0, 4
la $a0, enter
syscall

li $v0, 1
move $a0, $s4
syscall

li $v0, 10
syscall

# program must exit afterwards


