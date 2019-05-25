known_users = ["Mohsen", "Bob", "Harry"]

#print(len(known_users))

#contains är in; strip tar bort tecken, i det här fallet mellanslag
while True:
	print("Hi! My Name Is Voltron")
	name = input("What is your name?: ").capitalize().strip()
	
	if name in known_users:
		print("Hello {}!".format(name))
		#.lower() tvingar input lowcase
		remove = input("Would you like to be removed from the system (y/n)?: ").lower()
		if remove == "y":
			known_users.remove(name)
			print(known_users)
			print("="*10)
		elif remove == "n":
			print("No problem, I didn't want you to leave anyway!")

	else:
		print("Hmm, I don't think i have met you yet {}".format(name))
		add_me = input("Would you like to be added to the system (y/n)?: ").strip().lower()
		if add_me == "y":
			known_users.append(name)                       
		elif add_me == "n":
			print("No worries, see you around!")
