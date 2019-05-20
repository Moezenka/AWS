known_users = ["Mohsen", "Bob", "Harry"]

print(len(known_users))

#contains är in; strip tar bort tecken, i det här fallet mellanslag
while True:
	print("Hi! My Name Is Voltron")
	name = input("What is your name?: ").capitalize().strip()
	
	if name in known_users:
		print("name IS recognized")
	else:
		print("name is NOT recognized")
