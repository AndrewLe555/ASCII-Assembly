# ASCII-Assembly

To run the code, use the following commands:
nasm -f elf32 -g -F dwarf -o ascii.o ascii.asm
ld -m elf_i386 -o ascii ascii.o
./ascii

Author: Andrew Lentz, 2:30 class
Purpose: Given a list of hex values, the program will print out the values of the hex. For example, if 0xA5 is given, the program will print A5
Files: ascii.asm, Uses a loop to go through 8 hex values, then prints them to the terminal as previously described.
Build Instructions: First, create a program that works for one hex value. This will include two if statements to check if it's a letter or a number. Once that is working, implement it in a loop using a counter and checking it when one iteration finishes. After the loop is finished, print the output to the terminal with spaces in between the hex values and a new line character at the end.
Testing Methodology: First tried getting the program to work with one hex value and no segmentation faults. Then, implemented the loop, making sure there were no segementation faults.
Additional Information: For the lines add BL, 48 and add BL, 55, The 48 and 55 values are gotten from the ASCII table. If you have a number 9, in binary would be the tab character. However, if we add 48 to 9 to get 57, that will gives us the ASCII value of 9. It's the same thing for the letters. A is represented as 10, which is a new line in ASCII. But, if we add 55 to 10 to get 65, that is the ASCII value for A.
