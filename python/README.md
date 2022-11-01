# Project 2, Python Script for user input regarding a list of candy.



## Python script that prompts user to Add, Remove, Display, or exit a Favorite candy list.  


To run the script you will need to go to my python repository linked [Here.](https://github.com/vanschwm/it3038c-scripts/blob/main/python/Project2Official.py) Download the Python file, open it in an IDE and run the script for Python. The code will display a list of options that the user can choose to to add, remove, display, or exit a candylist. If the user adds a candy it will append the candy added to the list, the user can remove the candy (if the item is not found it will say that), the user can display the current list, and the user can exit the list. The script will keep running until the user exits the list.   


*Code for Favorite Candy:*
```javascript 
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
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
