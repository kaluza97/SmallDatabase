IF DB_ID('MojaBaza') IS NOT NULL
DROP DATABASE MojaBaza
CREATE DATABASE MojaBaza
GO

IF OBJECT_ID('Reklamacje','U') IS NOT NULL
DROP TABLE `MojaBaza`.`Reklamacje` 

IF OBJECT_ID('Rabaty','U') IS NOT NULL
DROP TABLE `MojaBaza`.`Rabaty` 

IF OBJECT_ID('Zamowienia','U') IS NOT NULL
DROP TABLE `MojaBaza`.`Zamowienia` 

IF OBJECT_ID('Klienci','U') IS NOT NULL
DROP TABLE `MojaBaza`.`Klienci` 

IF OBJECT_ID('Zaopatrzenie','U') IS NOT NULL
DROP TABLE `MojaBaza`.`Zaopatrzenie` 

IF OBJECT_ID('Dostepnosc','U') IS NOT NULL
DROP TABLE `MojaBaza`.`Dostepnosc` 

IF OBJECT_ID('Telefony','U') IS NOT NULL
DROP TABLE `MojaBaza`.`Telefony` 




-- --------------------------------
-- Tworzenie tabel
-- --------------------------------
IF OBJECT_ID('Telefony','U') IS NULL
CREATE TABLE `MojaBaza`.`Telefony` ( `IdTelefonu` INT NOT NULL AUTO_INCREMENT , `Model` TEXT NOT NULL , `Procesor` TEXT NOT NULL , `SystemOperacyjny` TEXT NOT NULL , `Ram` INT NOT NULL , `Pamiec Wewnetrzna [Gb]` INT(4) NOT NULL , `Cena` INT(5) NOT NULL , PRIMARY KEY (`IdTelefonu`)) ENGINE = InnoDB;


IF OBJECT_ID('Dostepnosc','U') IS NULL
CREATE TABLE `MojaBaza`.`Dostepnosc` ( `IdDostepnosci` INT NOT NULL AUTO_INCREMENT , `IdTelefonu` INT NOT NULL , `Dostepnosc` BOOLEAN NOT NULL , `IdZaopatrzenia` INT NULL DEFAULT NULL , PRIMARY KEY (`IdDostepnosci`)) ENGINE = InnoDB;


IF OBJECT_ID('Zaopatrzenie','U') IS NULL
CREATE TABLE `MojaBaza`.`Zaopatrzenie` ( `IdZaopatrzenia` INT NOT NULL AUTO_INCREMENT , `IdTelefonu` INT NOT NULL , `DataZamowienia` DATE NOT NULL , `Ilosc` INT NOT NULL , `CenaZakupu` INT NOT NULL COMMENT '(NETTO ZA 1 SZTUKE)' , `NrFaktury` TEXT NOT NULL , PRIMARY KEY (`IdZaopatrzenia`)) ENGINE = InnoDB;


IF OBJECT_ID('Klienci','U') IS NULL
CREATE TABLE `MojaBaza`.`Klienci` ( `IdKlienta` INT NOT NULL AUTO_INCREMENT , `Imie` VARCHAR(30) NOT NULL , `Nazwisko` VARCHAR(30) NOT NULL , `Miasto` VARCHAR(30) NOT NULL , `Kod Pocztowy` TEXT NOT NULL , `Adres` TEXT NOT NULL , `Numer Kontaktowy` TEXT NOT NULL , `Pesel` BIGINT(11) NOT NULL , PRIMARY KEY (`IdKlienta`)) ENGINE = InnoDB;


IF OBJECT_ID('Zamowienia','U') IS NULL
CREATE TABLE `MojaBaza`.`Zamowienia` ( `IdZamowienia` INT NOT NULL AUTO_INCREMENT , `IdKlienta` INT NOT NULL , `IdTelefonu` INT NOT NULL , `Data Wysylki` DATE NOT NULL COMMENT '(Po zaakceptowaniu platnosci)' , `Data Dostarczenia` DATE NOT NULL , `Realizacja Zamowienia` BOOLEAN NULL DEFAULT NULL COMMENT '(1=zrealizowano)' , PRIMARY KEY (`IdZamowienia`)) ENGINE = InnoDB;


IF OBJECT_ID('Rabaty','U') IS NULL
CREATE TABLE `MojaBaza`.`Rabaty` ( `IdRabatu` INT NOT NULL AUTO_INCREMENT , `IdKlienta` INT NOT NULL , `Rabat` INT NOT NULL COMMENT '[%]' , `NrKarty` INT(6) NOT NULL , PRIMARY KEY (`IdRabatu`) ) ENGINE = InnoDB;


IF OBJECT_ID('Reklamacje','U') IS NULL
CREATE TABLE `MojaBaza`.`Reklamacje` ( `IdReklamacji` INT NOT NULL AUTO_INCREMENT ,`IdZamowienia` INT NULL DEFAULT NULL COMMENT 'Jesli istnieje', `IdTelefonu` INT NOT NULL , `IdKlienta` INT NOT NULL , `Data Dostarczenia` DATE NOT NULL , `Nr Faktury Sprzedazy` INT NULL DEFAULT NULL , `Opis Uszkodzenia` TEXT NOT NULL , `Naprawiono Na Miejscu` BOOLEAN NOT NULL COMMENT '(1=Naprawiono)' , `Data Przyjecia Reklamacji` DATE NULL DEFAULT NULL , `Data Zwrotu` DATE NULL DEFAULT NULL , PRIMARY KEY (`IdReklamacji`)) ENGINE = InnoDB;
GO

-- ---------------------------------
-- Wstawianie wartości do tabel
-- ---------------------------------
INSERT INTO `Telefony` (`IdTelefonu`, `Model`, `Procesor`, `SystemOperacyjny`, `Ram`, `Pamiec Wewnetrzna [Gb]`, `Cena`) VALUES ('1', 'Samsung Galaxy S9+', 'Samsung Exynos 9810, 8 rdzeni', 'Android 8.0 Oreo', '6000', '256', '4950');
INSERT INTO `Telefony` (`IdTelefonu`, `Model`, `Procesor`, `SystemOperacyjny`, `Ram`, `Pamiec Wewnetrzna [Gb]`, `Cena`) VALUES ('2', 'Samsung Galaxy S9', 'Samsung Exynos 9810, 8 rdzeni', 'Android 8.0 Oreo', '4000', '128', '3950');
INSERT INTO `Telefony` (`IdTelefonu`, `Model`, `Procesor`, `SystemOperacyjny`, `Ram`, `Pamiec Wewnetrzna [Gb]`, `Cena`) VALUES ('3', 'Smartfon Apple iPhone 7', 'Apple A10 Quad Core 2.4GHz', 'iOS 10', '2000', '32', '2500');
INSERT INTO `Telefony` (`IdTelefonu`, `Model`, `Procesor`, `SystemOperacyjny`, `Ram`, `Pamiec Wewnetrzna [Gb]`, `Cena`) VALUES ('4', 'Smartfon Apple iPhone X', 'Apple A11 Bionic', 'iOS 11', '6000', '256', '5600');
INSERT INTO `Telefony` (`IdTelefonu`, `Model`, `Procesor`, `SystemOperacyjny`, `Ram`, `Pamiec Wewnetrzna [Gb]`, `Cena`) VALUES ('5', 'Xiaomi Redmi 4X', 'Snapdragon 435 Octa Core 1.4GHz', 'Android 6.0.1', '3000', '32', '750');
INSERT INTO `Telefony` (`IdTelefonu`, `Model`, `Procesor`, `SystemOperacyjny`, `Ram`, `Pamiec Wewnetrzna [Gb]`, `Cena`) VALUES ('6', 'Xiaomi Redmi 4X', 'Snapdragon 435 Octa Core 1.4GHz', 'Android 6.0.1', '3000', '32', '750');
INSERT INTO `Telefony` (`IdTelefonu`, `Model`, `Procesor`, `SystemOperacyjny`, `Ram`, `Pamiec Wewnetrzna [Gb]`, `Cena`) VALUES ('7', 'Samsung Galaxy A8', 'Samsung Exynos 7885', 'Android 7.1.1', '4000', '64', '1780');
INSERT INTO `Telefony` (`IdTelefonu`, `Model`, `Procesor`, `SystemOperacyjny`, `Ram`, `Pamiec Wewnetrzna [Gb]`, `Cena`) VALUES ('8', 'Huawei Mate 10', 'HiSilicon Kirin 970', 'Android 8.0 Oreo', '6000', '256', '4900');
INSERT INTO `Telefony` (`IdTelefonu`, `Model`, `Procesor`, `SystemOperacyjny`, `Ram`, `Pamiec Wewnetrzna [Gb]`, `Cena`) VALUES ('9', 'LG V30S ThinQ', 'Snapdragon 835', 'Android 8.0 Oreo', '6000', '256', '2300');
INSERT INTO `Telefony` (`IdTelefonu`, `Model`, `Procesor`, `SystemOperacyjny`, `Ram`, `Pamiec Wewnetrzna [Gb]`, `Cena`) VALUES ('10', 'Sony Xperia XZ2', 'Snapdragon 845 Qualcomm', 'Android 8.0 Oreo', '4000', '64', '3600');
INSERT INTO `Telefony` (`IdTelefonu`, `Model`, `Procesor`, `SystemOperacyjny`, `Ram`, `Pamiec Wewnetrzna [Gb]`, `Cena`) VALUES ('11', 'Samsung Galaxy J7', 'Osmiordzeniowy 1,6 GHz', 'Android 7.1 Nougat', '3000', '16', '1000');
INSERT INTO `Telefony` (`IdTelefonu`, `Model`, `Procesor`, `SystemOperacyjny`, `Ram`, `Pamiec Wewnetrzna [Gb]`, `Cena`) VALUES ('12', 'Huawei P20', 'Kirin 970 Osmiordzeniowy', 'Android 8.1 Oreo', '4000', '128', '1440');
INSERT INTO `Telefony` (`IdTelefonu`, `Model`, `Procesor`, `SystemOperacyjny`, `Ram`, `Pamiec Wewnetrzna [Gb]`, `Cena`) VALUES ('13', 'Nokia 6.1', 'Qualcomm Snapdragon 630', 'Android 8.1 Oreo', '3000', '32', '1200');
INSERT INTO `Telefony` (`IdTelefonu`, `Model`, `Procesor`, `SystemOperacyjny`, `Ram`, `Pamiec Wewnetrzna [Gb]`, `Cena`) VALUES ('14', 'Nokia 8', 'Qualcomm Snapdragon 835', 'Android 7.1.1 Nougat', '4000', '64', '1900');
INSERT INTO `Telefony` (`IdTelefonu`, `Model`, `Procesor`, `SystemOperacyjny`, `Ram`, `Pamiec Wewnetrzna [Gb]`, `Cena`) VALUES ('15', 'Huawei Y6', 'Qualcomm Snapdragon 425', 'Android 8.0 Oreo', '2000', '16', '650');
INSERT INTO `Telefony` (`IdTelefonu`, `Model`, `Procesor`, `SystemOperacyjny`, `Ram`, `Pamiec Wewnetrzna [Gb]`, `Cena`) VALUES ('16', 'Smartfon Apple iPhone 8', 'Apple A11 Bionic', 'iOS 11', '2000', '64', '2950');
INSERT INTO `Telefony` (`IdTelefonu`, `Model`, `Procesor`, `SystemOperacyjny`, `Ram`, `Pamiec Wewnetrzna [Gb]`, `Cena`) VALUES ('17', 'Smartfon Apple iPhone 8 Plus', 'Apple A11 Bionic', 'iOS 11', '3000', '128', '3350');

GO

INSERT INTO `Dostepnosc` (`IdDostepnosci`, `IdTelefonu`, `Dostepnosc`, `IdZaopatrzenia`) VALUES ('1', '1', '4', NULL);
INSERT INTO `Dostepnosc` (`IdDostepnosci`, `IdTelefonu`, `Dostepnosc`, `IdZaopatrzenia`) VALUES ('2', '2', '0', '1');
INSERT INTO `Dostepnosc` (`IdDostepnosci`, `IdTelefonu`, `Dostepnosc`, `IdZaopatrzenia`) VALUES ('3', '3', '2', NULL);
INSERT INTO `Dostepnosc` (`IdDostepnosci`, `IdTelefonu`, `Dostepnosc`, `IdZaopatrzenia`) VALUES ('4', '4', '3', NULL);
INSERT INTO `Dostepnosc` (`IdDostepnosci`, `IdTelefonu`, `Dostepnosc`, `IdZaopatrzenia`) VALUES ('5', '5', '4', NULL);
INSERT INTO `Dostepnosc` (`IdDostepnosci`, `IdTelefonu`, `Dostepnosc`, `IdZaopatrzenia`) VALUES ('6', '6', '1', NULL);
INSERT INTO `Dostepnosc` (`IdDostepnosci`, `IdTelefonu`, `Dostepnosc`, `IdZaopatrzenia`) VALUES ('7', '7', '2', NULL);
INSERT INTO `Dostepnosc` (`IdDostepnosci`, `IdTelefonu`, `Dostepnosc`, `IdZaopatrzenia`) VALUES ('8', '8', '3', NULL);
INSERT INTO `Dostepnosc` (`IdDostepnosci`, `IdTelefonu`, `Dostepnosc`, `IdZaopatrzenia`) VALUES ('9', '9', '4', NULL);
INSERT INTO `Dostepnosc` (`IdDostepnosci`, `IdTelefonu`, `Dostepnosc`, `IdZaopatrzenia`) VALUES ('10', '10', '3', NULL);
INSERT INTO `Dostepnosc` (`IdDostepnosci`, `IdTelefonu`, `Dostepnosc`, `IdZaopatrzenia`) VALUES ('11', '11', '3', NULL);
INSERT INTO `Dostepnosc` (`IdDostepnosci`, `IdTelefonu`, `Dostepnosc`, `IdZaopatrzenia`) VALUES ('12', '12', '3', NULL);
INSERT INTO `Dostepnosc` (`IdDostepnosci`, `IdTelefonu`, `Dostepnosc`, `IdZaopatrzenia`) VALUES ('13', '13', '1', NULL);
INSERT INTO `Dostepnosc` (`IdDostepnosci`, `IdTelefonu`, `Dostepnosc`, `IdZaopatrzenia`) VALUES ('14', '14', '0', '2');
INSERT INTO `Dostepnosc` (`IdDostepnosci`, `IdTelefonu`, `Dostepnosc`, `IdZaopatrzenia`) VALUES ('15', '15', '2', NULL);
INSERT INTO `Dostepnosc` (`IdDostepnosci`, `IdTelefonu`, `Dostepnosc`, `IdZaopatrzenia`) VALUES ('16', '16', '1', NULL);
INSERT INTO `Dostepnosc` (`IdDostepnosci`, `IdTelefonu`, `Dostepnosc`, `IdZaopatrzenia`) VALUES ('17', '17', '4', NULL);

GO

INSERT INTO `Zaopatrzenie` (`IdZaopatrzenia`, `IdTelefonu`, `DataZamowienia`, `Ilosc`, `CenaZakupu`, `NrFaktury`) VALUES ('1', '2', '2018-05-28', '5', '2100', '37/2018');
INSERT INTO `Zaopatrzenie` (`IdZaopatrzenia`, `IdTelefonu`, `DataZamowienia`, `Ilosc`, `CenaZakupu`, `NrFaktury`) VALUES ('2', '14', '2018-06-01', '2', '860', '44/2018');

GO

INSERT INTO `Klienci` (`IdKlienta`, `Imie`, `Nazwisko`, `Miasto`, `Kod Pocztowy`, `Adres`, `Numer Kontaktowy`, `Pesel`) VALUES ('1', 'Piotr', 'Kaluzny', 'Sulecin', '69-200', 'ul Dluga 6/4', '507444187', '97090605235');
INSERT INTO `Klienci` (`IdKlienta`, `Imie`, `Nazwisko`, `Miasto`, `Kod Pocztowy`, `Adres`, `Numer Kontaktowy`, `Pesel`) VALUES ('2', 'Kamil', 'Nowak', 'Miedzychod', '64-300', 'ul Krotka 2/1', '612443221', '91040205211');
INSERT INTO `Klienci` (`IdKlienta`, `Imie`, `Nazwisko`, `Miasto`, `Kod Pocztowy`, `Adres`, `Numer Kontaktowy`, `Pesel`) VALUES ('3', 'Anna', 'Wozniak', 'Torzym', '62-504', 'Lipowa 2/15', '518331212', '89020304233');
INSERT INTO `Klienci` (`IdKlienta`, `Imie`, `Nazwisko`, `Miasto`, `Kod Pocztowy`, `Adres`, `Numer Kontaktowy`, `Pesel`) VALUES ('4', 'Jakub', 'Borowski', 'Bydgoszcz', '61-617', 'Jasna 1/13', '555332422', '99010605233');
INSERT INTO `Klienci` (`IdKlienta`, `Imie`, `Nazwisko`, `Miasto`, `Kod Pocztowy`, `Adres`, `Numer Kontaktowy`, `Pesel`) VALUES ('5', 'Kamila', 'Worotnicka', 'Warszawa', '66-530', 'Spokojna 2/4', '560404232', '94091102239');
INSERT INTO `Klienci` (`IdKlienta`, `Imie`, `Nazwisko`, `Miasto`, `Kod Pocztowy`, `Adres`, `Numer Kontaktowy`, `Pesel`) VALUES ('6', 'Andrzej', 'Pakulski', 'Poznan', '61-607', 'ul Jasa Rola 33', '606424187', '92020605235');
INSERT INTO `Klienci` (`IdKlienta`, `Imie`, `Nazwisko`, `Miasto`, `Kod Pocztowy`, `Adres`, `Numer Kontaktowy`, `Pesel`) VALUES ('7', 'Kamil', 'Dubiel', 'Poznan', '61-619', 'ul Sobieskiego', '591143233', '92120237411');
INSERT INTO `Klienci` (`IdKlienta`, `Imie`, `Nazwisko`, `Miasto`, `Kod Pocztowy`, `Adres`, `Numer Kontaktowy`, `Pesel`) VALUES ('8', 'Patrycja', 'Brzydota', 'Pszczew', '64-290', 'ul Miodowa 4', '653331356', '95050504255');
INSERT INTO `Klienci` (`IdKlienta`, `Imie`, `Nazwisko`, `Miasto`, `Kod Pocztowy`, `Adres`, `Numer Kontaktowy`, `Pesel`) VALUES ('9', 'Aleksandra', 'Bogacz', 'Sady', '61-622', 'ul Dluga', '566332336', '98050805758');
INSERT INTO `Klienci` (`IdKlienta`, `Imie`, `Nazwisko`, `Miasto`, `Kod Pocztowy`, `Adres`, `Numer Kontaktowy`, `Pesel`) VALUES ('10', 'Henryk', 'Nowak', 'Warszawa', '66-530', 'Szpitalna 22/5', '610404632', '85071102264');
INSERT INTO `Klienci` (`IdKlienta`, `Imie`, `Nazwisko`, `Miasto`, `Kod Pocztowy`, `Adres`, `Numer Kontaktowy`, `Pesel`) VALUES ('11', 'Pawel', 'Biedak', 'Poznan', '61-618', 'Bronisza 4', '553304631', '92051104763');
INSERT INTO `Klienci` (`IdKlienta`, `Imie`, `Nazwisko`, `Miasto`, `Kod Pocztowy`, `Adres`, `Numer Kontaktowy`, `Pesel`) VALUES ('12', 'Henryk', 'Nowak', 'Warszawa', '66-530', 'Szpitalna 22/5', '507546323', '89030102295');

...
GO

INSERT INTO `Zamowienia` (`IdZamowienia`, `IdKlienta`, `IdTelefonu`, `Data Wysylki`, `Data Dostarczenia`, `Realizacja Zamowienia`) VALUES ('1', '1', '5', '2018-04-08', '2018-04-16', '1');
INSERT INTO `Zamowienia` (`IdZamowienia`, `IdKlienta`, `IdTelefonu`, `Data Wysylki`, `Data Dostarczenia`, `Realizacja Zamowienia`) VALUES ('2', '4', '15', '2018-04-09', '2018-04-16', '1');
INSERT INTO `Zamowienia` (`IdZamowienia`, `IdKlienta`, `IdTelefonu`, `Data Wysylki`, `Data Dostarczenia`, `Realizacja Zamowienia`) VALUES ('3', '3', '12', '2018-04-23', '2018-04-27', '1');
INSERT INTO `Zamowienia` (`IdZamowienia`, `IdKlienta`, `IdTelefonu`, `Data Wysylki`, `Data Dostarczenia`, `Realizacja Zamowienia`) VALUES ('4', '1', '9', '2018-04-27', '2018-04-29', '1');
INSERT INTO `Zamowienia` (`IdZamowienia`, `IdKlienta`, `IdTelefonu`, `Data Wysylki`, `Data Dostarczenia`, `Realizacja Zamowienia`) VALUES ('5', '5', '10', '2018-04-27', '2018-04-29', '1');
INSERT INTO `Zamowienia` (`IdZamowienia`, `IdKlienta`, `IdTelefonu`, `Data Wysylki`, `Data Dostarczenia`, `Realizacja Zamowienia`) VALUES ('6', '1', '16', '2018-04-28', '2018-04-31', '1');
INSERT INTO `Zamowienia` (`IdZamowienia`, `IdKlienta`, `IdTelefonu`, `Data Wysylki`, `Data Dostarczenia`, `Realizacja Zamowienia`) VALUES ('7', '1', '7', '2018-04-28', '2018-04-31', '1');
INSERT INTO `Zamowienia` (`IdZamowienia`, `IdKlienta`, `IdTelefonu`, `Data Wysylki`, `Data Dostarczenia`, `Realizacja Zamowienia`) VALUES ('8', '4', '1', '2018-04-28', '2018-04-31', '1');
INSERT INTO `Zamowienia` (`IdZamowienia`, `IdKlienta`, `IdTelefonu`, `Data Wysylki`, `Data Dostarczenia`, `Realizacja Zamowienia`) VALUES ('9', '10', '12', '2018-05-08', '2018-05-16', '1');
INSERT INTO `Zamowienia` (`IdZamowienia`, `IdKlienta`, `IdTelefonu`, `Data Wysylki`, `Data Dostarczenia`, `Realizacja Zamowienia`) VALUES ('10', '7', '11', '2018-05-09', '2018-05-16', '1');
INSERT INTO `Zamowienia` (`IdZamowienia`, `IdKlienta`, `IdTelefonu`, `Data Wysylki`, `Data Dostarczenia`, `Realizacja Zamowienia`) VALUES ('11', '8', '17', '2018-05-23', '2018-05-27', '1');
INSERT INTO `Zamowienia` (`IdZamowienia`, `IdKlienta`, `IdTelefonu`, `Data Wysylki`, `Data Dostarczenia`, `Realizacja Zamowienia`) VALUES ('12', '6', '6', '2018-05-27', '2018-05-29', '1');
INSERT INTO `Zamowienia` (`IdZamowienia`, `IdKlienta`, `IdTelefonu`, `Data Wysylki`, `Data Dostarczenia`, `Realizacja Zamowienia`) VALUES ('13', '9', '15', '2018-05-27', '2018-05-29', '1');
INSERT INTO `Zamowienia` (`IdZamowienia`, `IdKlienta`, `IdTelefonu`, `Data Wysylki`, `Data Dostarczenia`, `Realizacja Zamowienia`) VALUES ('14', '9', '13', '2018-05-28', '2018-05-31', '1');
INSERT INTO `Zamowienia` (`IdZamowienia`, `IdKlienta`, `IdTelefonu`, `Data Wysylki`, `Data Dostarczenia`, `Realizacja Zamowienia`) VALUES ('15', '4', '3', '2018-05-28', '2018-05-31', '1');
INSERT INTO `Zamowienia` (`IdZamowienia`, `IdKlienta`, `IdTelefonu`, `Data Wysylki`, `Data Dostarczenia`, `Realizacja Zamowienia`) VALUES ('16', '5', '2', '2018-05-28', '2018-05-31', '1');
GO

INSERT INTO `Rabaty` (`IdRabatu`, `IdKlienta`, `Rabat`, `NrKarty`) VALUES ('1', '1', '15', '015362');
INSERT INTO `Rabaty` (`IdRabatu`, `IdKlienta`, `Rabat`, `NrKarty`) VALUES ('2', '4', '10', '035294');


GO

INSERT INTO `Reklamacje` (`IdReklamacji`,`IdZamowienia`, `IdTelefonu`, `IdKlienta`, `Data Dostarczenia`, `Nr Faktury Sprzedazy`, `Opis Uszkodzenia`, `Naprawiono Na Miejscu`, `Data Przyjecia Reklamacji`, `Data Zwrotu`) VALUES ('1', '5', '10', '5', '2018-04-29', NULL, 'Sony Xperia XZ2 po podlaczeniu do dzialajacej i oryginalnej ladowarki, nie laduje sie.', '0', '2018-05-19', '2018-05-24');
INSERT INTO `Reklamacje` (`IdReklamacji`,`IdZamowienia`, `IdTelefonu`, `IdKlienta`, `Data Dostarczenia`, `Nr Faktury Sprzedazy`, `Opis Uszkodzenia`, `Naprawiono Na Miejscu`, `Data Przyjecia Reklamacji`, `Data Zwrotu`) VALUES ('2', '11', '17', '8', '2018-05-27', NULL, 'Iphone 8+ nie chce sie uruchomic, nie reaguje na ladowarke, diody sie nie swieca.', '0', '2018-06-02', '2018-06-06');
INSERT INTO `Reklamacje` (`IdReklamacji`,`IdZamowienia`, `IdTelefonu`, `IdKlienta`, `Data Dostarczenia`, `Nr Faktury Sprzedazy`, `Opis Uszkodzenia`, `Naprawiono Na Miejscu`, `Data Przyjecia Reklamacji`, `Data Zwrotu`) VALUES ('3', '15', '3', '4', '2018-05-31', NULL, 'Iphone 7 nie dziala glosnik.', '0', '2018-06-10', '2018-06-14');
INSERT INTO `Reklamacje` (`IdReklamacji`,`IdZamowienia`, `IdTelefonu`, `IdKlienta`, `Data Dostarczenia`, `Nr Faktury Sprzedazy`, `Opis Uszkodzenia`, `Naprawiono Na Miejscu`, `Data Przyjecia Reklamacji`, `Data Zwrotu`) VALUES ('4', '0', '4', '5', '2018-06-03', '23/2018', 'Iphone X, ladwarka nie laduje, wymiana ladowarki rozwiazala problem.', '1', '2018-06-22', '2018-06-22');
INSERT INTO `Reklamacje` (`IdReklamacji`,`IdZamowienia`, `IdTelefonu`, `IdKlienta`, `Data Dostarczenia`, `Nr Faktury Sprzedazy`, `Opis Uszkodzenia`, `Naprawiono Na Miejscu`, `Data Przyjecia Reklamacji`, `Data Zwrotu`) VALUES ('5', '0', '8', '5', '2018-06-08', '39/2018', 'Huawei Mate 10, telefon nie lapie zasiegu.', '0', '2018-06-29', '2018-07-02');

GO

-- ---------------------------------
-- Usuwanie i tworzenie widoków
-- ---------------------------------
IF OBJECT_ID('TEL5','V') IS NOT NULL
DROP VIEW TEL5
GO

CREATE VIEW TEL5 AS (
SELECT * FROM Telefony ORDER BY Cena DESC LIMIT 5
)
GO

IF OBJECT_ID('iOS','V') IS NOT NULL
DROP VIEW ANDROID
GO

CREATE VIEW ANDROID AS (SELECT * FROM Telefony WHERE SystemOperacyjny like "%iOS%"

)
GO

IF OBJECT_ID('TOP5','V') IS NOT NULL
DROP VIEW TOP5
GO

CREATE VIEW TOP5 AS (SELECT IdTelefonu, COUNT(IdTelefonu) as Ilosc FROM Zamowienia GROUP BY IdTelefonu ORDER BY `Ilosc` DESC
LIMIT 5

)
GO

IF OBJECT_ID('DOSTEPNOSC','V') IS NOT NULL
DROP VIEW DOSTEPNOSC
GO

CREATE VIEW DOSTEPNOSC AS (
SELECT Dostepnosc.IdTelefonu, Telefony.Model, Dostepnosc.Dostepnosc FROM Dostepnosc, Telefony WHERE Dostepnosc.IdTelefonu = Telefony.IdTelefonu
)
GO

IF OBJECT_ID('SPR','V') IS NOT NULL
DROP VIEW SPR
GO

CREATE VIEW SPR AS (
SELECT Telefony.IdTelefonu, Telefony.Model, Telefony.Cena FROM Telefony, Zamowienia WHERE Zamowienia.IdKlienta = 1 AND Telefony.IdTelefonu = Zamowienia.IdTelefonu 
)
GO

-- ---------------------------------------------
-- Utworzenie raportów (wywołanie widoków)
-- ---------------------------------------------

-- Nazwa raportu 1
SELECT * FROM TEL5

-- Nazwa raportu 2
SELECT * FROM iOS

-- Nazwa raportu 3
SELECT * FROM TOP5

-- Nazwa raportu 4
SELECT * FROM DOSTEPNOSC

-- Nazwa raportu 5
SELECT * FROM SPR

USE master
GO

IF DB_ID('MojaBaza') IS NOT NULL
DROP DATABASE MojaBaza
GO