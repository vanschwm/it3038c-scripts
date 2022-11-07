import requests, re

data = "Hello.Myemailisreedws@ucmail.uc.edu.Pleasecontactme!"
p = re.compile('[A-Za-z0-9_%.-]+@[A-z0-9_%.-]+\.[A-z0-9]{2,}')
print(p.search(data).group())