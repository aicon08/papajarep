#Data Analysis for Project

#Paper used the mean proportion of correct words recalled from each scenario
#Creating a data frame of all subjects with avg. remembered words

prop.c<-Data_Replication_NairneEtAl_2008 %>%
        select(Subject,Mean_RememberedWords_Survival,Mean_RememberedWords_Vacation)%>%
        group_by(Subject)

colnames(prop.c)<-c("Subject","Survival","Vacation")
        

#summary(prop.c)

#Adjusting the created data frame to create the long form table requirement for data analysis
long.prop.c<-melt(prop.c,id="Subject",measured= c("Survival","Vacation"))
colnames(long.prop.c)<- c("Subject","Condition","Rate")

long.prop.c$Subject<-as.factor(long.prop.c$Subject)
long.prop.c$Condition<-as.factor(long.prop.c$Condition)

#Within Subjects ANOVA code

ezANOVA(data=long.prop.c,wid=Subject,within=Condition,dv= Rate, detailed = T)

#statitics pull


#post hoc tests prep and run
tapply(long.prop.c$Rate,list(long.prop.c$Condition), mean)
tapply(long.prop.c$Rate,list(long.prop.c$Condition), sd)
tapply(long.prop.c$Rate,list(long.prop.c$Condition), length)

pairwise.t.test(long.prop.c$Rate,long.prop.c$Condition,paired = T,p.adjust.method = "bonferroni")

#Effect Size Calculation
d.dep.t.avg(m1=.4983553,m2=.4046053,sd1 =.2376541 ,sd2=.1898706,n=38,a=.05)

#bargraph data

cleanup<- theme()

