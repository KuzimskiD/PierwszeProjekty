cases = [(220, 284), (1184, 1210), (2620, 2924), (10744, 10856), (63020, 76084), (555, 777), (321, 456)]

nr = 1
for one, two in cases:
    print(f"numer case: {nr}")
    print(f"pierwsza liczba: {one}")
    print(f"druga liczba: {two}")
    
    suma_one = 1
    suma_two = 1
    
    i = 2
    while i<=(one ** 0.5):
        if one % i == 0:
            suma_one += i + one//i
        i+=1
    print(f"Suma z dzielenia pierwszej liczby: {suma_one}")
    
    i = 2
    while i<=(two ** 0.5):
        if two % i == 0:
            suma_two += i + two//i  
        i+=1
    print(f"Suma z dzielenia drugiej liczby: {suma_two}")
    
    if suma_one == two and suma_two == one:
        print(f"Liczba {one} i {two} są przyjazne\n")
    else:
        print(f"Liczba {one} i {two} nie są przyjazne\n")
    nr += 1
    