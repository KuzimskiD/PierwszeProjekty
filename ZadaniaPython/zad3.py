
cases = [(1, 1), (3, 3), (8, 1), (14, 13)]

for one, two in cases:
    wynik = ""
    temp = one
    while temp != 0:
        wynik = str(temp%2) + wynik
        temp //= 2
    wynik = wynik[1:] + wynik[0]    
    
    wynik = wynik[::-1] #123 = 3*2^0 + 2*2^1 
    potega = 0
    result = 0
    for elem in wynik:
        result += int(elem) * (2**potega)
        potega += 1
    if result == two:
        print(f"Poprawny test, przezyla osoba nr {result}")
        