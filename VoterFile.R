library(dplyr)

#loading hilsborough county data
try1 <- read.delim("20181113_VoterHistory/HIL_H_20181113.txt")

try1_filter <- try1 %>%
  filter(PPP == "OTH")

try_datefil <- try1 %>%
  filter(X01.31.2012 == "03/03/2015")

try1_2011fil <- try1_filter %>%
  filter(X01.31.2012 == "03/01/2011")

hil2016gen <- try1 %>%
  filter(PPP == "GEN") %>%
  filter(X01.31.2012 == "11/08/2016")

voterdet <- read.delim("20181113_VoterDetail/HIL_20181113.txt")

hil2018gen <- try1 %>%
  filter(PPP == "GEN")

set.seed(84996)
sampling <- hil2018gen[sample(nrow(hil2018gen), 20), ]
sampsq <- sampling[sample(nrow(sampling), 10), ]


new_hil <- read.csv("New_Hils.csv")

new_hil_tampa <- new_hil %>% 
  filter(X2015.Tampa.Municipal.Mar.03.2015. == "A")



#looking for Jack
sarasota <- read.delim("20181113_VoterHistory/SAR_H_20181113.txt")
manatee <- read.delim("20181113_VoterHistory/MAN_H_20181113.txt")

#Variables are not consistently named
#I'll need to make column name vectors at some point
man.jack <- manatee %>%
  filter(X100003072 == 121959076)
sar.jack <- sarasota %>%
  filter(X100003707 == 121959076)

newsar <- read.delim("20190108_VoterHistory/SAR_H_20190108.txt")
newman <- read.delim("20190108_VoterHistory/MAN_H_20190108.txt")

newman.jack <- newman %>%
  filter(X100000559 == 121959076)
newsar.jack <- newsar %>%
  filter(X100000698 == 121959076)

#loading hilsborough data from january 2019
hils2019det <- read.delim("20190108_VoterDetail/HIL_20190108.txt")
hils2019hist <- read.delim("20190108_VoterHistory/HIL_H_20190108.txt")


#filtering tampa precincts
tampa_precincts <- hils2019det %>%
  #X593 corresponds to precinct, loaded as a factor, coercing to numeric
  mutate(precinct = as.numeric(as.character(X953))) %>%
  #tampa precincts are all 3-digit codes from the 100s to 300s in Hilsborough
  filter(precinct < 400)


#searching for inconsistencies in turnout: miami dade
miamidade.hist <- read.delim("20190108_VoterHistory/DAD_H_20190108.txt")

miabeach.mun <- miamidade.hist %>%
  filter(X03.15.2016 ==  "09/26/2017") %>%
  filter(PPP == "OTH")
#SOE says 454 people voted
summary(miabeach.mun$Y)
#dataset says 224 voted


#trying special in miami dade
specialprimary.july <- miamidade.hist %>%
  filter(X03.15.2016 ==  "07/25/2017") %>%
  filter(PPP == "PRI")
#SOE says 26272 people voted
summary(specialprimary.july$Y)
#dataset says 25708 voted

#generals in miamidade
dadgeneral18 <- miamidade.hist %>%
  filter(X03.15.2016 ==  "11/06/2018") %>%
  filter(PPP == "GEN")
#SOE says 813,353
summary(dadgeneral18$Y)
#data says 812,352

dadgeneral16 <- miamidade.hist %>%
  filter(X03.15.2016 ==  "11/08/2016") %>%
  filter(PPP == "GEN")
#SOE says 1,005,940 
summary(dadgeneral16$Y)
#data says 977,608