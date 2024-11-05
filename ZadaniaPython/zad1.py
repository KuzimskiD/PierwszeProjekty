
cases = [((0, 1), []), ((0, 23), [2, 3, 5, 7, 13, 17, 19, 23]), ((3, 8), [3, 5, 7]), ((60, 70), [61, 67]), ((82, 100), [83, 89, 97])]

for nr, elem in enumerate(cases):
    result = []
    for liczba in range( elem[0][0], elem[0][1]+1 ):
        if liczba < 2: continue
        i = 2
        ok = True
        while i <= (liczba ** 0.5): 
            if liczba%i == 0:
                ok = False
                break
            i += 1
        if ok == True:
            result.append(liczba)
    print(f"Case {nr+1}: {result}")
    