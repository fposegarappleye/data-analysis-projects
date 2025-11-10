food = "water bottles,meal packs,snacks,chocolate"
equipment = "space suits,jet packs,tool belts,thermal detonators"
pets = "parrots,cats,moose,alien eggs"
sleep_aids = "blankets,pillows,eyepatches,alarm clocks"


# a) Use split to convert the strings into four cabinet lists. Alphabetize the contents of each cabinet.
def splitSort(items):
    items = items.split(",")
    items.sort()
    return items



food = splitSort(food)
equipment = splitSort(equipment)
pets = splitSort(pets)
sleep_aids = splitSort(sleep_aids)



# b) Initialize a cargo_hold list and add the cabinet lists to it. Print cargo_hold to verify its structure.
cargo_hold = [food,equipment,pets,sleep_aids]
print(cargo_hold)



# c) Query the user to select a cabinet (0 - 3) in the cargo_hold.
# d) Use bracket notation and format to display the contents of the selected cabinet. If the user entered an invalid number, print an error message.
cabinet = -1
while True:
    user_input = str(input("Select a cabinet (0-3): "))
    try:
        if int(user_input) >= 0 and int(user_input) <= 3:
            cabinet = int(user_input)
            break
        else:
            print("ISSUE: Value is not between 0 and 3.\n")
    except ValueError:
        print("ERROR: Please choose a valid integer value.")
print(cargo_hold[cabinet])



# e) Modify the code to query the user for BOTH a cabinet in cargo_hold AND a particular item. 
cabinet = -1
while True:
    user_input = str(input("Select a cabinet (0-3): "))
    try:
        if int(user_input) >= 0 and int(user_input) <= 3:
            cabinet = int(user_input)
            break
        else:
            print("ISSUE: Value is not between 0 and 3.\n")
    except ValueError:
        print("ERROR: Please choose a valid integer value.")



# Use the in method to check if the cabinet contains the selected item, then print “Cabinet ____ DOES/DOES NOT contain ____.”
user_input = str(input(f"Select item in cabinet {cabinet}: "))
if user_input in cargo_hold[cabinet]:
    print(f"{cabinet} DOES contain {user_input}.")
else:
    print(f"{cabinet} DOES NOT contain {user_input}.")
