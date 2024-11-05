SET client_encoding='utf-8';

CREATE TABLE salon_samochodowy
(
    nazwa_salonu        VARCHAR(50) PRIMARY KEY,
    adres               VARCHAR(50) NOT NULL,
    liczba_samochodow   INT         NOT NULL
);

CREATE TABLE agent_sprzedajacy
(
    NUMER_ID                VARCHAR(10)     PRIMARY KEY,                            -- INT
    liczba_transakcji       VARCHAR(50)     NOT NULL,                               -- INT
    imie_nazwisko           VARCHAR(50)     NOT NULL,
    salon_nazwa             VARCHAR(50)     NOT NULL,
	FOREIGN KEY (salon_nazwa) REFERENCES salon_samochodowy(nazwa_salonu)
);

CREATE TABLE klient
(
	PESEL                   CHAR(11)        PRIMARY KEY,                            -- BIGINT
    adres_zamieszkania      VARCHAR(50)     NOT NULL,
    imie_nazwisko           VARCHAR(50)     NOT NULL,
    id_agent              VARCHAR(10)     NOT NULL,                               -- INT
	FOREIGN KEY (id_agent) REFERENCES agent_sprzedajacy(NUMER_ID)
);

CREATE TABLE klient_zagraniczny
(
	numer_dokumentu         VARCHAR(15)     PRIMARY KEY,
    adres_zamieszkania      VARCHAR(50)     NOT NULL,
    imie_nazwisko           VARCHAR(50)     NOT NULL,
    id_agent_zagraniczny   VARCHAR(50)     NOT NULL,
	FOREIGN KEY (id_agent_zagraniczny) REFERENCES agent_sprzedajacy(NUMER_ID)      -- INT
);

CREATE TABLE samochod
(
    nr_vin                  CHAR(17)        PRIMARY KEY,
    rodzaj_nadwozia         VARCHAR(50)     NOT NULL,
    rok_produkcji           VARCHAR(50)     NOT NULL,                               -- INT LUB COS TAM
    kolor                   VARCHAR(100)    NOT NULL,
    marka_auta              VARCHAR(50)     NOT NULL,
    cena_auta               INT             NOT NULL,                               -- DECIMAL(12,2)
    samochod_pesel          VARCHAR(50),
    samochod_pesel_zagraniczny  VARCHAR(50),
    samochod_id             VARCHAR(50)     NOT NULL,
    samochod_nazwa_salonu   VARCHAR(50)     NOT NULL,
	FOREIGN KEY (samochod_pesel) REFERENCES klient(PESEL),
	FOREIGN KEY (samochod_pesel_zagraniczny) REFERENCES klient_zagraniczny(numer_dokumentu),
	FOREIGN KEY (samochod_id) REFERENCES agent_sprzedajacy(NUMER_ID),               -- INT
	FOREIGN KEY (samochod_nazwa_salonu) REFERENCES salon_samochodowy(nazwa_salonu)
);

CREATE TABLE plac_parkingowy
(
    nazwa_placu     VARCHAR(50)     PRIMARY KEY
);

CREATE TABLE salon_plac
(
	nazwa_salonu            VARCHAR(50),
    nazwa_placu             VARCHAR(50),
    PRIMARY KEY (nazwa_salonu, nazwa_placu),
    FOREIGN KEY (nazwa_salonu) REFERENCES salon_samochodowy(nazwa_salonu),
	FOREIGN KEY (nazwa_placu) REFERENCES plac_parkingowy(nazwa_placu)
);