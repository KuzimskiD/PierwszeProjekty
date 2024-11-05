dates_dict = {
    'date1': {'day': 12, 'month': 4, 'year': 2024},
    'date2': {'day': 5, 'month': 8, 'year': 2023},
    'date3': {'day': 20, 'month': 1, 'year': 2023}
}

items = list(dates_dict.items())

n = len(items)
for i in range(n-1): #jak wiele razy umeszczamy cos na koniec
    for j in range(0, n-i-1): # ile jest porównań w jednym ustawieniu
        date1 = items[j][1]
        date2 = items[j+1][1]
        wynik = None
        if date1['year'] != date2['year']:
            wynik = date1['year'] - date2['year']
        elif date1['month'] != date2['month']:
             wynik = date1['month'] - date2['month']
        else:
             wynik = date1['day'] - date2['day']
        
        if wynik > 0:
            items[j], items[j+1] = items[j+1], items[j]
sorted_dict = dict(items)
    
print("Posortowane daty:")
for key, value in sorted_dict.items():
    print(f"{key}: {value}")
        