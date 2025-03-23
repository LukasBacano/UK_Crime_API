# 🔍👮‍♂️ Skjult agenda i den engelske profilering af individer

Jeg har gennem [dette API](https://data.police.uk/docs/), lavet en analyse af det engelske politis etnicitetsfordeling, ved deres praksis af visitationer i London.
Jeg ville undersøge om der er gruppe som specielt er mere tilbøjelige til at blive visiteret end andre grupper.
Api'en er til fri benyttelse ud udarbejdet af Storbritanien, og min data er baseret på "stop and search" logs fra juli måned, 2024, men jeg vil udvide den senere med hele året 24 - Scriptet er vedlagt som et open-source-projekt alle kan bidrage til. 

📌 Introduktion

Dette projekt henter og analyserer data fra data.police.uk API'en med fokus på stop and search-hændelser. Formålet er at undersøge, om der er forskelle i, hvilke etniske grupper der oftere bliver kontrolleret af politiet i forskellige områder.

--- 

## 🛠 Teknologier

Projektet er udviklet i R og anvender følgende pakker:

📦 httr → Håndtering af HTTP-anmodninger

📦 jsonlite → Konvertering af JSON-data

📦 dplyr → Datamanipulation

📦 ggplot2 → Datavisualisering

📦 Leaflet → Verdenskort

---

## 🌍 Analyse

Jeg har meget simpelt valgt at tælle op på mængden af visitationer ud fra hver "officer_defined_ethnicity" (fortæller hvilken etnicitet politibetjenten selv har klassificeret og tildelt individet)


### 📊
![MAP](IMG/map.png)
Det første jeg gjorde var at plotte hvert at de i alt 9278, datapunkter via deres Lat/Long fra mit APIkald. For at få et bedre indblik i fordelingen, har jeg farvekoordineret mine cirkler efter etnicitet.

Ud fra det ovenstående kort er det svært at se om visse områder hvor der forekommer flere "stop and searches" end andre - for at finde ud af præcist dette, har jeg lavet et heatmap.

![Heatmap](IMG/heatmap.png)

En spændende opdagelse var at hotspotsne var tæt på togstationer så jeg har også plottet det samme heatmap, men med et tog-infrastruktur layer for at se om min teori passede.

![Heatmaptog](IMG/heatmaprails.png)

### 📊

Det er vigtigt at påpege at hvis vi læger alle vores procenter sammen giver det ikke 100%, da jeg har fjernet mine NA-værdier. (retter dette senere)

### 📊
![Fordeling](IMG/ProcPlot.jpeg)


ved første øjekast kan det se nogenlunde ligligt fordelt ud, men hvis man kigger på [dette link](https://www.ethnicity-facts-figures.service.gov.uk/uk-population-by-ethnicity/national-and-regional-populations/regional-ethnic-diversity/latest/), fra "service.gov.uk" giver vores procenter pludselig en helt anden mening.
### 📊 service.gov.uk
![service.gov.uk](IMG/Ethnicity.png)


### 📌 Tabel
![Tabel](IMG/proc.png)

Vi kan ud fra vores tal, se at specielt, personer som er klassificeret "black" kun udgør 13.5% af befolkningen i london, men udgør 37.4% af alle "stop and searches", hvilket man jo må indrømme er en ret voldsom fordeling.

### Arrests

![Arrests](IMG/arrestratebyETH.png)

Jeg har så undersøgt om der er en forskel på hvilken etnicitet som bliver arresteret mest og igen er "black" meget tæt på white, men vi kan ikke rigtig bruge dette til så meget da det er op til en dommer at kende dem skyldige eller uskyldige.




---

## 📊 Dataoverblik

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Her er en tabel over de tre mest aktive flylande i datasættet:

| Land            | Antal Fly | Sidst Set       |
|-----------------|-----------|-----------------|
| DPRK            | 132       | 2025-03-21 06:00 |
| Republic of Korea | 98      | 2025-03-21 05:58 |
| USA             | 21        | 2025-03-21 05:55 |

---

## 📁 Struktur


🔗 Kilder & Ressourcer

Data.police.uk API
