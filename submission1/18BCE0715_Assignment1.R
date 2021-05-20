# 18BCE0715 - Sanjit Kumar
# dataset creation

tn_transport_data <- data.frame(
  D_code = c(45,45,78,78,78,78,111,111,111),
  District = c(rep(c("Ranipet"),times=2), rep(c("Thirupatthur"),times=4), rep(c("Vellore"),times=3)),
  Transport_Mode = c("Bicycle","Bike",NA,NA,"Bicycle",NA,"Car","Bicycle","Bike"),
  Pop_total = c(73560,1634923,797818,3865125,42880,7710301,373402,27313,14525322),
  Selfdrive_total = c(2414,42902,21348,75246,1088,399041,13922,1075,557036)
)

tn_transport_data

# total number of missing values
print("Total number of missing values:")
sum(is.na(tn_transport_data))

# max and min of population total
print("Maximum value of attribute Pop_total is:")
max(tn_transport_data$Pop_total)
print("Minimum value of attribute Pop_total is:")
min(tn_transport_data$Pop_total)

# percentage of people who drove alone in all three districts
print("percentage of people who drove alone in all three districts")
percentage_of_selfdriving_people = sum(tn_transport_data$Selfdrive_total)*100/sum(tn_transport_data$Pop_total)
percentage_of_selfdriving_people

# districts ranked on % of bicycle users
print("districts ranked on % of bicycle users")
ranipet_subset = subset(tn_transport_data,District=="Ranipet")
thirupatthur_subset = subset(tn_transport_data,District=="Thirupatthur")
vellore_subset = subset(tn_transport_data,District=="Vellore")

s1 <- tn_transport_data$Pop_total[tn_transport_data$Transport_Mode == "Bicycle" & tn_transport_data$District == "Ranipet" ]*100/sum(tn_transport_data$Pop_total[tn_transport_data$District == "Ranipet"])
s1
s2 <- tn_transport_data$Pop_total[tn_transport_data$Transport_Mode == "Bicycle"  & !is.na(tn_transport_data$Transport_Mode) & tn_transport_data$District == "Thirupatthur"]*100/sum(tn_transport_data$Pop_total[tn_transport_data$District == "Thirupatthur"])
s2
s3 <- tn_transport_data$Pop_total[tn_transport_data$Transport_Mode == "Bicycle" & tn_transport_data$District == "Vellore" ]*100/sum(tn_transport_data$Pop_total[tn_transport_data$District == "Vellore"])
s3
df_bicycle_district_percent = data.frame(
  District=c("Ranipet","Thirupatthur","Vellore"),
  bicycle_percent = c(s1,s2,s3)
)
df_bicycle_district_percent
rank(df_bicycle_district_percent$bicycle_percent)
# order(df_bicycle_district_percent$bicycle_percent)
