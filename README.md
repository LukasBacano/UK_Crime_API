# 📡 Skjult agenda i den engelske profilering af individer – Kort beskrivelse

Jeg har gennem [dette API](https://data.police.uk/docs/), lavet en analyse af det engelske politis etnicitetsfordeling, ved deres praksis af visitationer i London.
Jeg ville undersøge om der er gruppe som specielt er mere tilbøjelige til at blive visiteret end andre grupper.
Api'en er til fri benyttelse, og min data er baseret på data fra juli måned, 2024, men jeg vil udvide den senere med hele året 24 - Scriptet er vedlagt som et open-source-projekt alle kan bidrage til. 



'Analyse af Stop & Search med Data.police.uk API

📌 Introduktion

Dette projekt henter og analyserer data fra data.police.uk API'en med fokus på stop and search-hændelser. Formålet er at undersøge, om der er forskelle i, hvilke etniske grupper der oftere bliver kontrolleret af politiet i forskellige områder.

🛠 Teknologier

Projektet er udviklet i R og anvender følgende pakker:

📦 httr → Håndtering af HTTP-anmodninger

📦 jsonlite → Konvertering af JSON-data

📦 dplyr → Datamanipulation

📦 ggplot2 → Datavisualisering

📡 API Kilder

De vigtigste endpoints brugt i projektet:

🔍 Politi-kræse og senior officers

Forces API

Leicestershire Officers

🚔 Neighborhood teams

Leicestershire Neighborhoods

Neighborhood Team

📊 Gade- og kriminalitetsdata

All Crime Data

Crime Outcomes

🚨 Stop and Search

Stops by Force

Stops by Location

📥 Hentning af data

Projektet starter med at hente de nyeste data fra API'et og konvertere dem til en R-dataklasser:

📊 Analyse af Stop & Search efter etnicitet

Her undersøges, om en bestemt etnicitet er mere udsat for at blive stoppet og visiteret af politiet:

📈 Visualisering

Visualisering af stop-and-search hændelser fordelt på etnicitet:

📍 Lokationer med flest kontroller

Der analyseres, hvilke steder flest personer bliver stoppet:

🏁 Konklusion

Projektet viser, hvordan man kan hente og analysere stop & search-data fra data.police.uk API'et. Visualiseringen gør det muligt at identificere eventuelle mønstre i politiets kontrolpraksis.

📌 Forbedringsmuligheder

Mere præcis geografisk analyse: Brug en mere detaljeret polygon-baseret søgning i API'et.

Tidstrends: Undersøg, om der er ændringer over tid i, hvem der bliver stoppet.

Sammenligning med andre områder: Brug flere forces i API'et for at sammenligne praksis mellem politidistrikter.

sammenlign med % af befolknings etnicitet

🔗 Kilder & Ressourcer

Data.police.uk API
