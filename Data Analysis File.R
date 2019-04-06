#Data Analysis for Project

#Paper used the mean proportion of correct words recalled from each scenario
#Creating a data frame of all subjects with avg. remembered words

prop.c<-Data_Replication_NairneEtAl_2008 %>%
        select(Subject,Mean_RememberedWords_Survival,Mean_RememberedWords_Vacation)%>%
        group_by(Subject)

