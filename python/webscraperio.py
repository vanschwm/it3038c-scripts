import requests, re 
from bs4 import BeautifulSoup

"""
r = requests.get("https://www.nike.com/w/mens-shoes-nik1zy7ok").content
soup = BeautifulSoup(r,'html.parser')
tags = soup.findAll("a",{"href":re.compile('(https://www.nike.com/t/air-force-1-07-mens-shoes-5QFp5Z/CW2288-111)')})
for a in tags:
    print(a.get('href'))
"""

r = requests.get("https://www.glassdoor.com/Salary/Amazon-Engineering-Salaries-EI_IE6036.0,6_DEPT1007.htm").content
soup = BeautifulSoup(r,'html.parser')
tags = soup.find_all()
print(tags)





