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
move $t4, $a0
lb $s3, ($t4)

# check values
verify:
beq $t1, 10, calling

addi $t1, $t1, 1
bge $s3, 97, low # lowercase (BLT = less than)
bge $s3, 65, up # uppercase (BLT = less than)
bge $s3, 48, num # for 0, BLT = less than

# creating a function
counter:
addi $t4, $t4, 1
lb $s3,($t4)
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


