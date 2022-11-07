import requests
from bs4 import BeautifulSoup

data= []
stats= []
categories= ["BA:", "HRs:", "RBIs:", "Hs:", "SBs:", "Wins:", "ERA:", "Saves:", "SOs:", "QualityS:"]

page = requests.get('https://www.espn.com/mlb/stats')

soup = BeautifulSoup(page.content, 'html.parser')

baseball = soup.find_all('tbody', class_='Table__TBODY')


for each in baseball:
    try:
        data.append(each.find('a', class_='AnchorLink flex items-center').text.strip())
        number = each.find('tr', class_='Table__TR Table__TR--sm Table__even')
        stats.append(number.find_all('td', class_='Table__TD')[1].text)
    except:
        num = 1


entry = 0


while entry < 10:
    print(categories[entry],"\n League Leader: ", data[entry], "-", stats[entry])
    entry += 1