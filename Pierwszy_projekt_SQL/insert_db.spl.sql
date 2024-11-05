-- pokaz relacje jeden do jeden, jeden do wielu, wiele do wielu

INSERT INTO salon_samochodowy (nazwa_salonu, adres, liczba_samochodow) VALUES
('AUTO-Karczemki', 'Komorowskiego', '1'),
('AUTO-Szadółki', 'Kochanowskiego', '1'),
('AUTO-Morena', 'Jankowicza', '1'),
('AUTO-Letnica', 'Sienkiewicza', '1'),
('AUTO-Przymorze', 'Marcowa', '1');

INSERT INTO agent_sprzedajacy (NUMER_ID, liczba_transakcji, imie_nazwisko, salon_nazwa) VALUES 
('1', '3', 'Robert_Kowalski', 'AUTO-Karczemki'), 
('2', '2', 'Adam_Nowak', 'AUTO-Szadółki'), 
('3', '1', 'Jan_Robinowski', 'AUTO-Morena'), 
('4', '4', 'Jakub_Nowala', 'AUTO-Letnica'), 
('5', '6', 'Alan_Szumowski', 'AUTO-Przymorze'),
('6', '2', 'Rafal_Gatowski', 'AUTO-Przymorze');

INSERT INTO klient (PESEL, adres_zamieszkania, imie_nazwisko, id_agent) VALUES
('56101254789', 'Kasprowicza_11_Gdańsk', 'Wikor_Janowicz', '2'),
('45021355784', 'Warszawska_20_Sopot', 'Marek_Pawłowicz', '2'),
('54041556987', 'Ptasia_34_Gdynia', 'Robert_Pozowski', '5');


INSERT INTO klient_zagraniczny (numer_dokumentu, adres_zamieszkania, imie_nazwisko, id_agent_zagraniczny) VALUES
('75116422982', 'Winston_22_Paris', 'Jhon_Mery', '4'),
('80126484552', 'Sasky_01_Barlin', 'Alex_Wobsky', '4'),
('85110434891', 'Sasky_01_Barlin', 'Jim_Beem', '3');



INSERT INTO samochod (nr_vin, rodzaj_nadwozia, rok_produkcji, kolor, marka_auta, cena_auta, samochod_pesel, 
samochod_pesel_zagraniczny, samochod_id, samochod_nazwa_salonu) VALUES
('3TMLU42N78M001057', 'sedan', '2024', 'czerwony', 'Fiat', '220000', '56101254789', NULL, '1', 'AUTO-Karczemki'),
('5J6TF1H30BL098961', 'sedan', '2023', 'niebieski', 'Alfa', '200000', '45021355784', NULL, '1', 'AUTO-Szadółki'),
('1C4NJRFB4DD111651', 'coupe', '2020', 'biały', 'GMC', '180000', '54041556987', NULL, '3', 'AUTO-Morena'),
('4USCC8322SLA66001', 'cabrio', '2019', 'zielony', 'Volvo', '150000', NULL, '75116422982', '4', 'AUTO-Letnica'),
('4T1BF1FK0FU080242', 'kombi', '2024', 'porańczowy', 'Honda', '250000', NULL, '80126484552', '5', 'AUTO-Przymorze'),
('4T1Bh45E0FU080242', 'kombi', '2020', 'czerwony', 'Hyundai', '190000', NULL, '85110434891', '5', 'AUTO-Przymorze');


INSERT INTO plac_parkingowy (nazwa_placu) VALUES
('Karczemki'),
('Szadółki'),
('Morena'),
('Letnica'),
('Przymorze');

INSERT INTO salon_plac (nazwa_salonu, nazwa_placu) VALUES 
('AUTO-Karczemki', 'Karczemki'),
('AUTO-Karczemki', 'Szadółki'),
('AUTO-Morena', 'Szadółki'),
('AUTO-Letnica', 'Letnica'),
('AUTO-Przymorze', 'Przymorze');

