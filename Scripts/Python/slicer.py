# get user email address
email = input("what is your email address?: ").strip()

# slice out user name
user = email[:email.index("@")]

# slice domain name
domain = email[email.index("@")+ 1 :]

# format message
output = "Username: {}\nDomain: {}".format(user,domain)

# display output message
print("="*20)
print(output)
print("="*20)
