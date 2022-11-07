import requests, re 
from bs4 import BeautifulSoup

r = requests.get("https://www.nike.com/w/mens-shoes-nik1zy7ok").content
soup = BeautifulSoup(r,'html.parser')
tags = soup.findAll("div",{"class":re.compile('(product-grid_items css-hvew4t)')})

