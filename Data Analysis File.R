#Data Analysis for Project

#Paper used the mean proportion of correct words recalled from each scenario
#Creating a data frame of all subjects with avg. remembered words

prop.c<-Data_Replication_NairneEtAl_2008 %>%
        select(Subject,Mean_RememberedWords_Survival,Mean_RememberedWords_Vacation)%>%
        filter(Mean_RememberedWords_Survival>.2,
               Mean_RememberedWords_Survival<.8,
               Mean_RememberedWords_Vacation<.8,
               Mean_RememberedWords_Vacation>.2)%>%
        group_by(Subject)

colnames(prop.c)<-c("Subject","Survival","Vacation")
        

#summary(prop.c)

#Adjusting the created data frame to create the long form table requirement for data analysis
long.prop.c<-melt(prop.c,id="Subject",measured= c("Survival","Vacation"))
colnames(long.prop.c)<- c("Subject","Condition","Rate")

long.prop.c$Subject<-as.factor(long.prop.c$Subject)
long.prop.c$Condition<-as.factor(long.prop.c$Condition)

groupsummary<-summarySE(long.prop.c,measurevar = "Rate",groupvars = "Condition")
errorbarinfoL<-groupsummary$Rate-groupsummary$se
errorbarinfoU<-groupsummary$Rate+groupsummary$se

#Within Subjects ANOVA code

result<-ezANOVA(data=long.prop.c,wid=Subject,within= Condition,dv= Rate, detailed = T)
result2<-aov(long.prop.c$Rate~long.prop.c$Condition+Error(Subject/Condition), data = long.prop.c)
summary(result2)

#statitics pull
print(result)
print(result2)

#post hoc tests prep and run
tapply(long.prop.c$Rate,list(long.prop.c$Condition), mean)
tapply(long.prop.c$Rate,list(long.prop.c$Condition), sd)
tapply(long.prop.c$Rate,list(long.prop.c$Condition), length)

pairwise.t.test(long.prop.c$Rate,long.prop.c$Condition,paired = T,p.adjust.method = "bonferroni")

#Effect Size Calculation
d.dep.t.avg(m1=.5334821,m2=.4508929,sd1 =.1376495 ,sd2=.1132909,n=28,a=.05)

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
               fill= "grey",
               color="black") +
  
  stat_summary(fun.data = mean_cl_normal(long.prop.c$Rate),
               geom = "errorbar",
               position = position_dodge(width = 0.9),
               width=0.2) +
  cleanup+
  
  xlab("Condition") +
  ylab("Proportion Correct") +
  scale_x_discrete(labels=c("Survival","Vacation")) +
  coord_cartesian(ylim = c(.30,.65)) +
  scale_y_continuous(breaks = seq(.3,.65,.05)) 
  #geom_errorbar(aes(ymin=errorbarinfoL,ymax=errorbarinfoU),width=.2,position = position_dodge(.9))


#bargraph2<- ggplot(long.prop.c,aes(Condition,Rate)) +
  #geom_bar(stat = "identity", position = "dodge") +
  #coord_cartesian(ylim=c(0,.65)) +
  #geom_errorbar(aes(ymin=.55-(.17/sqrt(34)),ymax=.55+(.17/sqrt(34))),width=.2,position = position_dodge(width = 0.9),color="black")

#groupsummary$Condition<-as.factor(groupsummary$Condition)

#bargraph3<- ggplot(groupsummary,aes(x=Condition,y=Rate,fill="white")) +
            #geom_bar(position = position_dodge(),stat = "identity") +
            #geom_errorbar(aes(ymin=Rate-se,ymax=Rate+se),width=.2,position = position_dodge(.9))



