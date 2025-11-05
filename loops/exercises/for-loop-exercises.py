# Exercise #1: Construct for loops that accomplish the following tasks:
    # a. Print the numbers 0 - 20, one number per line.
print("EXERCISE 1, QUESTION A")
for each in range(1,21):
    print(each)

    # b. Print only the ODD values from 3 - 29, one number per line.
print("EXERCISE 1, QUESTION B")
for each in range(3,30):
    if each%2 == 1:
        print(each)


    # c. Print the EVEN numbers 12 to -14 in descending order, one number per line.
print("EXERCISE 1, QUESTION C")
for each in range(12,-15,-2):
    print(each)

    # d. Challenge - Print the numbers 50 - 20 in descending order, but only if the numbers are multiples of 3. (Your code should work even if you replace 50 or 20 with other numbers).
print("EXERCISE 1, QUESTION D")
for each in range(50,19,-1):
    if each%3 == 0:
        print(each)


