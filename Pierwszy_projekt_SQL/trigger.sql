


CREATE OR REPLACE FUNCTION sprawdz_klienta()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM klient WHERE imie_nazwisko = NEW.imie_nazwisko) THEN
        RAISE EXCEPTION 'Klient o takim imieniu i nazwisku już istnieje';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER sprawdz_klienta
BEFORE INSERT ON klient
FOR EACH ROW
EXECUTE PROCEDURE sprawdz_klienta();







CREATE OR REPLACE FUNCTION sprawdz_pesel()
RETURNS TRIGGER AS $$
BEGIN
    IF LENGTH(NEW.PESEL) != 11 THEN
        RAISE EXCEPTION 'PESEL musi mieć dokładnie 11 znaków';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER sprawdz_pesel
BEFORE INSERT ON klient
FOR EACH ROW
EXECUTE PROCEDURE sprawdz_pesel();

;





































-- drugi TRIGGER 

CREATE TRIGGER sprawdz_salon
BEFORE DELETE ON samochod
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM salon_samochodowy WHERE salon_samochodowy.nr_vin = OLD.nr_vin) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Samochód jest powiązany z salonem, nie można usunąć';
    END IF;
END;


DELETE FROM samochod WHERE nr_vin = '3TMLU47HG7M001057';


