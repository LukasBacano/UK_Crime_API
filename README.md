Analyse af Stop & Search med Data.police.uk API

Introduktion

Dette projekt henter og analyserer data fra data.police.uk API'en med fokus på stop and search-hændelser. Formålet er at undersøge, om der er forskelle i, hvilke etniske grupper der oftere bliver kontrolleret af politiet i forskellige områder.

Teknologier

Projektet er udviklet i R og anvender følgende pakker:

httr → Håndtering af HTTP-anmodninger

jsonlite → Konvertering af JSON-data

dplyr → Datamanipulation

ggplot2 → Datavisualisering

API Kilder

De vigtigste endpoints brugt i projektet:

Politi-kræse og senior officers

https://data.police.uk/api/forces

https://data.police.uk/api/forces/leicestershire/people

Neighborhood teams

https://data.police.uk/api/leicestershire/neighbourhoods

https://data.police.uk/api/leicestershire/NC04/people

Gade- og kriminalitetsdata

https://data.police.uk/api/crimes-street/all-crime?date=2024-01&poly=...

https://data.police.uk/api/outcomes-at-location?date=2024-01&poly=...

Stop and Search

https://data.police.uk/api/stops-no-location?date=2024-01&force=leicestershire

https://data.police.uk/api/stops-street?date=2024-07&poly=51.261,-0.510:51.686,-0.510:51.686,0.280:51.261,0.280

Hentning af data

Projektet starter med at hente de nyeste data fra API'et og konvertere dem til en R-dataklasser:

Analyse af Stop & Search efter etnicitet

Her undersøges, om en bestemt etnicitet er mere udsat for at blive stoppet og visiteret af politiet:

Visualisering

Visualisering af stop-and-search hændelser fordelt på etnicitet:

Lokationer med flest kontroller

Der analyseres, hvilke steder flest personer bliver stoppet:

Konklusion

Projektet viser, hvordan man kan hente og analysere stop & search-data fra data.police.uk API'et. Visualiseringen gør det muligt at identificere eventuelle mønstre i politiets kontrolpraksis.

Forbedringsmuligheder

Mere præcis geografisk analyse: Brug en mere detaljeret polygon-baseret søgning i API'et.

Tidstrends: Undersøg, om der er ændringer over tid i, hvem der bliver stoppet.

Sammenligning med andre områder: Brug flere forces i API'et for at sammenligne praksis mellem politidistrikter.

