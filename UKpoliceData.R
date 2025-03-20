library(readxl) #læs excel
library(httr) #snak til api
library(jsonlite) #læs content
library(dplyr) #nemmere wrangling
library(ggplot2) #plots


#politi-kræse
# https://data.police.uk/api/forces
#Senior officers - find ud fra /forces.
# https://data.police.uk/api/forces/leicestershire/people

#neighborhoodteam ID'er
# https://data.police.uk/api/leicestershire/neighbourhoods
#neighborhood team
# https://data.police.uk/api/leicestershire/NC04/people

#street lvl crime - (hvad der ligner anmeldt kriminalitet)
# https://data.police.uk/api/crimes-street/all-crime?date=2024-01&poly=52.268,0.543:52.794,0.238:52.130,0.478
#outcomes af anmeldelser
# https://data.police.uk/api/outcomes-at-location?date=2024-01&poly=52.268,0.543:52.794,0.238:52.130,0.478

#Crime cats
# https://data.police.uk/api/crime-categories?date=2024-01
#søg på specifik crime via crimeid (64char id fra de andre søgemetoder) jeg forstår ikke 100% mangler at mere analyse
# https://data.police.uk/api/outcomes-for-crime/e11dade0a92a912d12329b9b2abb856ac9520434ad6845c30f503e9901d140f1

#for at finde stop and search ud fra politienheden(forces)
# https://data.police.uk/api/stops-no-location?date=2024-01&force=leicestershire


#endpointmapping
Url <- "DIN_API_DU_VIL_UNDERSØGE"
test <- GET(Url)
testres <- fromJSON(rawToChar(test$content))

#tjek sidste opdateringsdato for nyeste data-retrival
Lastupdated <- "https://data.police.uk/api/crime-last-updated"
LastUpdatedRes <- GET(Lastupdated)
LastupdatedDate <-  fromJSON(rawToChar(LastUpdatedRes$content))
print(LastupdatedDate)

#check specific date for crime i london poly (chatten gav mig london)
CustomURL <- "https://data.police.uk/api/stops-street?date=2024-07&poly=51.261,-0.510:51.686,-0.510:51.686,0.280:51.261,0.280"
bboxCrime <- GET(CustomURL)
bboxCrimeRes <-  fromJSON(rawToChar(bboxCrime$content))
bboxCrimeRes <- flatten(bboxCrimeRes)

######################################################################################################
######################################################################################################
#     Case, er der en etnicitet som er mere udsat end andre for at blive kontrolleret af politiet.   #
######################################################################################################
######################################################################################################

#opsumering grunde til at blive stoppet ud fra etnicitet
opsamling <- bboxCrimeRes %>% 
  group_by(officer_defined_ethnicity, object_of_search) %>% 
  summarise(count = n(), .groups = "drop")

# opsumering af hvilken etnicitet bliver stoppet og kropsvisiteret mest
stopANDsearchEthnic <- bboxCrimeRes %>% 
  group_by(officer_defined_ethnicity) %>% 
  summarise(total_count = n(), .groups = "drop") %>% 
  mutate(percentage = (total_count / sum(total_count)) * 100) %>% 
  mutate(percentage=round(percentage,1)) %>% 
  arrange(desc(total_count))  

#Plot %
ggplot(data = stopANDsearchEthnic, aes(x = reorder(officer_defined_ethnicity, -percentage), y = percentage)) +
  geom_col(fill = "steelblue") +
  geom_text(aes(label = paste0(percentage, "%")), vjust = -0.5, size = 5) + 
  labs(title = "Ikke den store forskel mellem hvide og sorte.",
       x = "Etnicitet",
       y = "Procent") +
  theme_minimal()




#Kilde til hvor stor en % hver etnicitet udgør: 
#https://www.ons.gov.uk/peoplepopulationandcommunity/culturalidentity/ethnicity/bulletins/ethnicgroupenglandandwales/census2021
UKeth <- as.data.frame(read_excel("Downloads/uketh.xlsx"))
colnames(UKeth) <- UKeth[4,] #lav kolonnenavne
UKeth <- UKeth[4:nrow(UKeth),] #fjern tomme rows
rownames(UKeth) <- UKeth[,2]
# ^ Her kan jeg udregne de rigtige forhold af etniciteter og se, om politiet er mere tilbøjelige til at visitere specifikke etniciteter.



#Hvilke "locations" er man mere tilbøgelig til at blive kontrolleret af politiet?
MostStopAndSearch <- bboxCrimeRes %>% group_by(location.street.name) %>% 
  summarise(count = n(), .groups = "drop")

