# ---- Exercise 2: Bracket Notation Basics ----

text = 'Strings_are_sequences_of_characters.'
word = 'tomato'

# 1. Print a slice of the first 12 characters from 'text'.
print(text[0:12])

# 2. Print a slice of the last 12 characters from 'text'. You should NOT have to count the index values yourself!
print(text[-12::])

# 3. Print a slice of the middle 12 characters from 'text'.
print(text[(len(text)//2-6):(len(text)//2+6)])


# ---- Exercise 3: Looping Through a String ----

# Use index values to loop backwards through 'word'.
# 1. Print 1 letter per line.
i = len(word)-1
while i > -1:
    print(word[i])
    i -= 1

# 2. Refactor the code to use the accumulator pattern to build up and print the reversed string. For example, if given 'good', print 'doog' on one line.
i = len(word)-1
while i > -1:
    print(word[i], end = "")
    i -= 1
# 3. Refactor the code to print a combination of the original and reversed string. For example, given 'tomato', print 'tomatootamot'. (If you want to be fancy, print 'tomato | otamot').
print("\n" + word + ' | ' + word[::-1])