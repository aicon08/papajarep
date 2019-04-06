#Data Analysis for Project

#Paper used the mean proportion of correct words recalled from each scenario
#Creating a data frame of all subjects with avg. remembered words

prop.c<-Data_Replication_NairneEtAl_2008 %>%
        select(Subject,Mean_RememberedWords_Survival,Mean_RememberedWords_Vacation)%>%
        filter(Mean_RememberedWords_Survival>0,
               Mean_RememberedWords_Vacation>0)
        group_by(Subject)

colnames(prop.c)<-c("Subject","Survival","Vacation")
        

#summary(prop.c)

#Adjusting the created data frame to create the long form table requirement for data analysis
long.prop.c<-melt(prop.c,id="Subject",measured= c("Survival","Vacation"))
colnames(long.prop.c)<- c("Subject","Condition","Rate")

long.prop.c$Subject<-as.factor(long.prop.c$Subject)
long.prop.c$Condition<-as.factor(long.prop.c$Condition)


#Within Subjects ANOVA code

result<-ezANOVA(data=long.prop.c,wid=Subject,within=Condition,dv= Rate, detailed = T)
result2<-aov(long.prop.c$Rate~long.prop.c$Condition+Error(Subject/Condition), data = long.prop.c)
summary(result2)

#statitics pull
print(result)

#post hoc tests prep and run
tapply(long.prop.c$Rate,list(long.prop.c$Condition), mean)
tapply(long.prop.c$Rate,list(long.prop.c$Condition), sd)
tapply(long.prop.c$Rate,list(long.prop.c$Condition), length)

pairwise.t.test(long.prop.final$Rate,long.prop.c$Condition,paired = T,p.adjust.method = "bonferroni")

#Effect Size Calculation
d.dep.t.avg(m1=.5569853,m2=.4522059,sd1 =.1722784 ,sd2=.1350670,n=34,a=.05)

#bargraph data

cleanup<- theme(panel.grid.major = element_blank(),
                panel.grid.minor = element_blank(),
                panel.background = element_blank(),
                axis.line = element_line(colour="black"),
                legend.key = element_rect(fill = "white"),
                text = element_text(size = 15))

bargraph<- ggplot(long.prop.c,aes(Condition,Rate))

bargraph+
  stat_summary(fun.y = mean,
               geom = "bar",
               fill= "white",
               color="black") +
  
  stat_summary(fun.data = mean_cl_normal,
               geom = "errorbar",
               position = position_dodge(width = 0.9),
               width=0.2) +
  cleanup+
  
  xlab("Condition") +
  ylab("Words Remembered") +
  scale_x_discrete(labels=c("Survival","Vacation"))

#bargraph2<- ggplot(long.prop.c,aes(Condition,Rate)) +
  #geom_bar(stat = "identity", position = "dodge") +
  #coord_cartesian(ylim=c(0,.65)) +
  #geom_errorbar(aes(ymin=.55-(.17/sqrt(34)),ymax=.55+(.17/sqrt(34))),width=.2,position = position_dodge(width = 0.9),color="black")




