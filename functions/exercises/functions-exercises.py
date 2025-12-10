# Part 1 A -- Make a Line
def make_line(x):
    return x*'#'

# Part 1 B -- Make a Square
# create a function using your make_line function to code a square
def make_square(x):
    if x <= 0:
        return ''
    return make_line(x)+('\n'+ make_line(x))*(x-1)

# Part 1 C -- Make a Rectangle
def make_rectangle(x,y):
    if x <= 0 or y <= 0:
        return ''
    return make_line(x)+('\n'+ make_line(x))*(y-1)

# Part 2 A -- Make a Stairs
def make_stairs(x):
    stairs = ''
    for step in range(x+1):
        if step > 1:
            stairs += '\n'
        stairs += '#'*step
    return stairs

# Part 2 B -- Make Space-Line 
def make_space_line(spaces, chars):
    return spaces*' ' + chars*'#' + spaces*' '

# Part 2 C -- Make Isosceles Triangle
def make_isosceles_triangle(x):
    t = ''
    for step in range(x):
        t += (x-step)*' '
        t += (1+2*(step))*'#'
        if step < x - 1:
            t+='\n'
    return t

# Part 3 -- Make a Diamond
def make_diamond(x):
    t = ''
    for y in range(x):
        t += (x-y)*' '
        t += (1+2*(y))*'#'
        t+='\n'
    for y in range(x-2, -1, -1):
        t += (x-y)*' '
        t += (1+2*(y))*'#'
        t+='\n'
    return t