def displayMenu():
    choose = 0
    maxChoice = 4 
    print("List of Choices: ")
    print("1- Add ")
    print("2- Remove ")
    print("3- Display ")
    print("4- Exit ")
    candyList = ["Kitkat",  "Reeses",  "ButterFinger",  "Crunch"]
    
    while choose < maxChoice:
        choose = input("Please choose what you would like to do with the candy list (1-4): ")
        choose = int(choose)
        userChoice(choose, candyList)
        if int(choose) < maxChoice:
            print("Make another choice! ")
        else:
            print('')

def userChoice(cho, candyList): 
    if cho == 1:
        add = input("What candy would you like to add?: ")
        candyList.append(add)
        print(', '.join(candyList))
    elif cho == 2:
        remove_candy = input("What candy would you like to remove from the list?: ")
        if remove_candy in candyList:
            candyList.remove(remove_candy)
            print(', '.join(candyList))
        else:
            print('Item not Found')

    elif cho == 3:
        print(', '.join(candyList))
    elif cho == 4:
        print("You have exited the candy list. ")
    else:
        print("Invalid option")


displayMenu()