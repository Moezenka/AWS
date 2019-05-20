# Ask user for name
name = input("What is your name?: ")

# Ask user for age
age = input("How old are you?: ")

# Ask user for city
city = input("What city do you live in?: ")

# Ask user what they enjoy
love = input("What do you love doing?: ")

# Create output text
string = "Name: {}\nAge: {}\nCity: {}\nEnjoy: {}"
output = string.format(name,age,city,love)

#Print output to screen
print("="*20)
print(output)
print("="*20)
