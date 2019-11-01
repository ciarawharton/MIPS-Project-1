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
bge $s2, 85, counter
sub $s2, $s2, 55
add $s3, $s3, $s2
j counter

# for the lowercase character u
lowercaseU:
bge $s2, 117, counter # for the letter u
sub $s2, $s2, 87
add $s3, $s3, $s2
j counter

numbers:
bge $s2, 48, counter
sub $s2, $s2, 48
add $s3, $s3, $s2
j counter

output:
li $v0, 4
la $a0, enter
syscall


li $v0, 1
move $a0, $s3
syscall

li $v0, 10
syscall

# program must exit afterwards


