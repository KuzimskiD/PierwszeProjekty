
W katalogu `begin` znajduje się definicja świata, w którym rządzą następujące zasady:
* świat jest płaski i posiada wysokość i szerokość
* każdy organizm na świecie posiada: 
    * `power`: zwiększa się co jedną turę o 1; decyduje o sile organizmu
    * `initiative`: priorytet decyduje o  kolejności wykonania ruchu w ramach jednej tury
    * `position`: położenie w świecie
    * `liveLength`: liczba tur do końca życia
    * `powerToReproduce`: granica dolna siły, powyżej której może się rozmnażać; po rozmnożeniu traci połowę siły
    * `sign`: znak reprezentujący organizm w świecie
    * `world`: świat, w którym żyje organizm
* jedynymi organizmemi żyjącym na świecie jest trawa i owca.

## Ryś 
Bazując na definicji zwierzęcia dodać rysia, który posiada następujące atrubuty:
* `power = 6`
* `initiative = 5`
* `liveLength = 18`
* `powerToReproduce = 14`
* `sign = 'R'`


## Antylopa
Dodać antylopę, która zachowuje się jak owca, z tym, że jeżeli w jej otoczeniu pojawi Ryś, to ucieka od niego o dwa pola (kierunek odwrotny do występowania rysia), jeżeli ucieczka nie jest możliwa, atakuje rysia.
* `power = 4`
* `initiative = 3`
* `liveLength = 11`
* `powerToReproduce = 5`
* `sign = 'A'`


## Plaga
Dodaj możliwość włączenia trybu plagii, który powoduje skrócenie życia wszystkim organizmów o połowę. Plaga działa tylko dwie tury i nie powoduje zmian w dalszych pokoleniach organizów.

## Dodanie organizmu
Zaimplementować możliwość dodania po dowolnej turze dowolnego nowego organizmu na dowolne wolne pole.

## Uwaga
- Do każdej dodawanej nowej funkcjonalności napisać odpowiednie testy jednostkowe.
- Opracować reguły *ochrony przyrody*, które nie pozwolą wyginąć żadnemu gatunkowi ani przejąć mu kontroli nad światem.

