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
