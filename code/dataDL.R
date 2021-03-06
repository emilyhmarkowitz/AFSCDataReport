#' ---
#' title: 'Data Report: MAXYR Eastern Bering Sea continental shelf Bottom Trawl Survey of Groundfish and Invertebrate Fauna'
#' author: 'L. Britt, E. J. Dawson, R. Haehn and E. H. Markowitz'
#' purpose: Download data
#' start date: 2021-03-03
#' date modified: 2021-03-03        # CHANGE
#' Notes:                             # CHANGE
#' ---

# Example Data


PKG <- c(#"dplyr", "tidyverse", "knitr", "kableExtra", "reshape",
         "RODBC")
for (p in PKG) {
  if(!require(p,character.only = TRUE)) {  
    install.packages(p)
    require(p,character.only = TRUE)}
}

# This has a specific username and password because I DONT want people to have access to this!
source("C:/Users/emily.markowitz/Documents/Projects/ConnectToOracle.R")
# channel<-odbcConnect(dsn = "AFSC",
#                      uid = "USERNAME", # change
#                      pwd = "PASSWORD", #change
#                      believeNRows = FALSE)
# 
# odbcGetInfo(channel)



##################DOWNLOAD TABLES##################################

a<-RODBC::sqlQuery(channel, "SELECT * FROM RACEBASE.CATCH")
write.csv(x=a, "./data/catch.csv")

a<-RODBC::sqlQuery(channel, "SELECT * FROM RACEBASE.HAULS")
write.csv(x=a, "./data/hauls.csv")

a<-RODBC::sqlQuery(channel, "SELECT * FROM RACEBASE.HAUL")
write.csv(x=a, "./data/haul.csv")

a<-RODBC::sqlQuery(channel, "SELECT * FROM RACE_DATA.V_CRUISES")
write.csv(x=a, "./data/cruises.csv")

a<-RODBC::sqlQuery(channel, "SELECT * FROM RACEBASE.LENGTH")
write.csv(x=a, "./data/length.csv")

a<-RODBC::sqlQuery(channel, "SELECT * FROM RACEBASE.SPECIMEN")
write.csv(x=a, "./data/specimen.csv")

a<-RODBC::sqlQuery(channel, "SELECT * FROM RACEBASE.STRATUM")
write.csv(x=a, "./data/stratum.csv")

a<-RODBC::sqlQuery(channel, "SELECT * FROM RACEBASE.STATIONS")
write.csv(x=a, "./data/stations.csv")

a<-RODBC::sqlQuery(channel, "SELECT * FROM RACEBASE.SPECIES")
write.csv(x=a, "./data/species.csv")

a<-RODBC::sqlQuery(channel, "SELECT * FROM RACEBASE.SPECIES_CLASSIFICATION")
write.csv(x=a, "./data/species_classification.csv")

a<-RODBC::sqlQuery(channel, "SELECT * FROM RACE_DATA.RACE_SPECIES_CODES")
write.csv(x=a, "./data/race_species_codes.csv")

a<-RODBC::sqlQuery(channel, "SELECT * FROM RACE_DATA.VESSELS")
write.csv(x=a, "./data/vessels.csv")

a<-RODBC::sqlQuery(channel, "SELECT * FROM RACE_DATA.TAXONOMIC_RANKS")
write.csv(x=a, "./data/taxonomic_ranks.csv")

a<-RODBC::sqlQuery(channel, "SELECT * FROM RACE_DATA.SPECIES_TAXONOMIC")
write.csv(x=a, "./data/species_taxonomic.csv")

###############ADFG###################

a<-RODBC::sqlQuery(channel, "SELECT * FROM RACEBASE.LENGTH_ADFG")
write.csv(x=a, "./data/length_ADFG.csv")

a<-RODBC::sqlQuery(channel, "SELECT * FROM RACEBASE.SPECIMEN_ADFG")
write.csv(x=a, "./data/specimen_ADFG.csv")



# https://www.fisheries.noaa.gov/alaska/commercial-fishing/alaska-groundfish-bottom-trawl-survey-data

# if (survey %in% "EBS") {
#   # Download EBS
#   download.file(url = "https://www.afsc.noaa.gov/RACE/groundfish/survey_data/downloads/ebs2017_2018.zip", 
#                 destfile=paste0("./data/ebs2017_2018.zip") )
#   
#   
#   if (filetype==".zip") {
#     zip::unzip(zipfile = paste0("./data/ebs2017_2018.zip"), 
#           overwrite = T,
#           exdir = paste0("./data/"))
#   }
# }


