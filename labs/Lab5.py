vowels = ['a', 'e', 'i', 'o', 'u']
vwls = 0
cons = 0
word = input(str("Enter your word: "))

for x in word:
    if x in vowels:
        vwls += 1
    elif x != ' ':
        cons += 1

print("The number of vowels are: " + (str(vwls)))
print("The number of consonants in your word is: " + (str(cons)))
print("The number of letters in your word is: ", len(word))