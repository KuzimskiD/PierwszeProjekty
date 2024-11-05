SELECT klient.imie_nazwisko, agent_sprzedajacy.imie_nazwisko
FROM klient
INNER JOIN agent_sprzedajacy ON klient.id_agent = agent_sprzedajacy.NUMER_ID;


SELECT salon_nazwa, COUNT(*) AS liczba_agentow
FROM agent_sprzedajacy
GROUP BY salon_nazwa;


SELECT nr_vin, cena_auta, cena_auta * 1.23 AS cena_brutto
FROM samochod;


SELECT * FROM klient
WHERE imie_nazwisko LIKE 'Robert%';


SELECT nr_vin, cena_auta
FROM samochod
WHERE cena_auta > (SELECT AVG(cena_auta) FROM samochod);


SELECT s1.nr_vin, s1.cena_auta
FROM samochod s1
WHERE s1.cena_auta > (
    SELECT AVG(s2.cena_auta)
    FROM samochod s2
    WHERE s2.samochod_nazwa_salonu = s1.samochod_nazwa_salonu
);


SELECT * FROM salon_samochodowy
WHERE nazwa_salonu NOT IN (SELECT salon_nazwa FROM agent_sprzedajacy);


DELETE FROM klient
WHERE PESEL = '56101254789'
AND PESEL NOT IN (SELECT samochod_pesel FROM samochod);

UPDATE agent_sprzedajacy
SET liczba_transakcji = liczba_transakcji + 1
WHERE NUMER_ID = 2;



