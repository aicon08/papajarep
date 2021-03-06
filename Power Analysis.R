# # function to run a simulated t-test
# sim_power_anova <- function(x){
#   A <- rnorm(n=20,mean=0, sd=1)
#   B <- rnorm(n=20,mean=0, sd=1)
#   C <- rnorm(n=20,mean=0, sd=1)
#   D <- rnorm(n=20,mean=(0+x), sd=1)
#   df <- data.frame(condition = as.factor(rep(c("A","B","C","D"),each=20)),
#                    DV = c(A,B,C,D))
#   aov_results <- summary(aov(DV~condition,df))
#   #return the pvalue
#   return(aov_results[[1]]$`Pr(>F)`[1])
# }
# 
# # vector of effect sizes
# effect_sizes <- seq(.1,2,.1)
# # run simulation for each effect size 1000 times
# power <- sapply(effect_sizes, 
#                 FUN = function(x) {
#                   sims <- replicate(1000,sim_power_anova(x))
#                   sim_power <- length(sims[sims<.05])/length(sims)
#                   return(sim_power)})
# # combine into dataframe
# plot_df <- data.frame(effect_sizes,power)
# 
# # plot the power curve
# ggplot(plot_df, aes(x=effect_sizes,
#                     y=power))+
#   geom_point()+
#   geom_line()
# 


# sim_anova<-function(x)
# {
#   S<-rnorm(20,mean = 0,sd=1)
#   V<-rnorm(20,mean=0+x,sd=1)
#   data<-data.frame(subject=as.factor(rep(1:20,2)),condition=as.factor(rep(c("S","V"),each=20)),rate=c(S,V))
#   
#   aov_results1<-summary(aov(rate~condition+Error(subject/condition),data = data))
#   return(as.numeric(unlist(aov_results1)[14]))
# }

sim_anova_s<-function(x)
{
  S<-rnorm(n=x,mean = 0,sd=1)
  V<-rnorm(n=x,mean=1.75,sd=1)
  data<-data.frame(subject=as.factor(rep(1:x,2)),condition=as.factor(rep(c("S","V"),each=x)),rate=c(S,V))
  
  aov_results1<-summary(aov(rate~condition+Error(subject/condition),data = data))
  return(as.numeric(unlist(aov_results1)[14]))
}
#eff_size<-seq(.1,2,.1)
subjects<-seq(2,30,1)

# pow<-sapply(eff_size,
#             FUN = function(x){
#               sim<-replicate(1000,sim_anova(x))
#               sim_pow<-length(sim[sim<.05])/length(sim)
#               return(sim_pow)
# })

pow<-sapply(subjects,
            FUN = function(x){
              sim<-replicate(1000,sim_anova_s(x))
              sim_pow<-length(sim[sim<.05])/length(sim)
              return(sim_pow)
            })

#plot_ef<-data.frame(eff_size,pow)

plot_gf<-data.frame(subjects,pow)

# ggplot(plot_ef, aes(x=eff_size,
#                     y=pow))+
#   geom_point()+
#   geom_line()

 
ggplot(plot_gf, aes(x=subjects,
                    y=pow))+
  geom_point()+
  geom_line()+
  scale_x_continuous(breaks = seq(0,30,5))
