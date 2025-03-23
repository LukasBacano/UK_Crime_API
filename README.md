# 🔍👮‍♂️ Skjult agenda i den engelske profilering af individer

Jeg har gennem [dette API](https://data.police.uk/docs/), lavet en analyse af det engelske politis etnicitetsfordeling, ved deres praksis af visitationer i London.
Jeg ville undersøge om der er gruppe som specielt er mere tilbøjelige til at blive visiteret end andre grupper.
Api'en er til fri benyttelse ud udarbejdet af Storbritanien, og min data er baseret på "stop and search" logs fra juli måned, 2024, men jeg vil udvide den senere med hele året 24 - Scriptet er vedlagt som et open-source-projekt alle kan bidrage til. 

📌 Introduktion

Dette projekt henter og analyserer data fra data.police.uk API'en med fokus på stop and search-hændelser. Formålet er at undersøge, om der er forskelle i, hvilke etniske grupper der oftere bliver kontrolleret af politiet i forskellige områder.

--- 

##🛠 Teknologier

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
![Fordeling](IMG/ProcPlot.jpeg)

### 🌡 Heatmap
![Heatmap](IMG/heatmap.png)

### 📌 Positioner
![Alle positioner](IMG/all_positions.png)

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
