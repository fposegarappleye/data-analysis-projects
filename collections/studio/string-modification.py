my_string = "LaunchCode"


# a) Use string methods to remove the first three characters from the string and add them to the end.
new_string = my_string[3:] + my_string[:3]
print(new_string)


# Use a template literal to print the original and modified string in a descriptive phrase.
print(f"Old: {my_string} | New: {new_string}")


# b) Modify your code to accept user input. Query the user to enter the number of letters that will be relocated.
n = -1
while n < 0:
    user_input = input("Select a number of characters to relocate: ")
    try:
        if int(user_input) >= 0:
            if int(user_input) <= len(my_string):
                n = int(user_input)
                break
            else:
                print("ISSUE: Value is greater than string length.\n")
        else:
            print("ISSUE: Value must be a positive integer.\n")
    except ValueError:
        print("ERROR: Please choose a valid integer value.\n")
print(f"Old: {my_string} | New: {my_string[n:] + my_string[:n]}")


# c) Add validation to your code to deal with user inputs that are longer than the word. In such cases, default to moving 3 characters. Also, the template literal should note the error.
n = 3
while True:
    user_input = input("Select a number of characters to relocate (will default to 3): ")
    try:
        if int(user_input) >= 0:
            if int(user_input) <= len(my_string):
                n = int(user_input)
                break
            else:
                print("ISSUE: Value is greater than string length. Defaulting to 3.\n")
                break
        else:
            print("ISSUE: Value must be a positive integer.\n")
    except ValueError:
        print("ERROR: Please choose a valid integer value.\n")
print(f"Old: {my_string} | New: {my_string[n:] + my_string[:n]}")

