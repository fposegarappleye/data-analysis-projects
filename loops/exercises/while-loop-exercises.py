import time


# Define three variables for the LaunchCode shuttle - one for the starting fuel level, another for the number of astronauts aboard, and the third for the altitude the shuttle reaches.
fuel = 0
maxfuel = 0
astronauts = 0
altitude = 0
fuelBarWidth = 20



def DisplayBar():
    print(10*"\n" + f"Altitude: {altitude} km")
    print(f"    Fuel: {fuel} kg")

    percentage = fuel/maxfuel
    if int(percentage*100) < 10:
        pct = f" {int(percentage*100)}"
    else:
        pct = f"{int(percentage*100)}"

    print(f"{pct}% [" 
            + "█" * int(percentage*(fuelBarWidth)) 
            + " " * (fuelBarWidth - int(percentage*(fuelBarWidth))) 
            + "]")




# Exercise #1: Construct while loops to do the following:
# a. Query the user for the starting fuel level. Validate that the user enters a positive, integer value greater than 5000 but less than 30000. 
while True:
    userInput = str(input("Enter starting fuel level: ")).replace(",","")
    if userInput.isdigit():
        if int(userInput)<=5000:
            print("Not enough fuel! Choose an amount above 5,000 and below 30,000\n")
        elif int(userInput)>30000:
            print("Too much fuel! Choose an amount above 5,000 and below 30,000\n")
        else:
            fuel = int(userInput)
            maxfuel = fuel
            break
    else:
        print("Please enter an integer value.\n")




# b. Use a second loop to query the user for the number of astronauts (up to a maximum of 7). Validate the entry.
while True:
    userInput = str(input("Enter number of astronauts (maximum of 7): "))
    if userInput.isdigit():
        if int(userInput) <= 7 and int(userInput) >= 1:
            astronauts = int(userInput)
            break
        else:
            print("Choose a number between 1 and 7.\n")
    else:
        print("Please choose a valid integer value.")




countdown = 3
print("Liftoff in T-minus")
for i in range(countdown,0,-1):
    print(f"{i}...")
    time.sleep(.75)




# c. Use a final loop to monitor the fuel status and the altitude of the shuttle. Each iteration, decrease the fuel level by 100 units for each astronaut aboard. Also, increase the altitude by 50 kilometers.
while fuel > 0:

    DisplayBar()

    # Burn fuel and move
    cost = 100*astronauts
    if fuel > cost:
        altitude += 50
        fuel -= cost
    else:
        altitude += 50*(fuel/cost)
        fuel = 0
        
    time.sleep(.125)
DisplayBar()




# Exercise #2: Print the result with the phrase, The shuttle gained an altitude of ___ km and has ___ kg of fuel left. Fill in the blanks with the altitude and fuel level values.
print(f"The shuttle gained an altitude of {altitude} km and has {fuel} kg of fuel left.")



# If the altitude is 2000 km or higher, add “Orbit achieved!” Otherwise add, “Failed to reach orbit.”
if altitude >= 2000:
    print("\033[1;32mOrbit achieved!\x1b[0m")
else:
    print(f"\x1b[31mFailed to reach orbit.\x1b[0m")