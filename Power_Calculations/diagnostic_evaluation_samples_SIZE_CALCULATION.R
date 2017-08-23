#For the findings of the proposed study of diagnostic accuracy to be robust, we require a minimum number of infected and uninfected cases. The total number of samples required to accurately evaluate the diagnostic devices can be calculated4 using the formula 


#p  the expected sensitivity of the novel diagnostic
p<-0.99

# po is the minimum acceptable level of sensitivity
po<-0.98

po<-c(0.9,0.905,0.91,0.915,0.92,0.925,0.93,0.935,0.94,0.945)
po<-c(0.9,0.905,0.91,0.915,0.92,0.925,0.93,0.935,0.94,0.945,0.95,0.955,0.96,0.965)
po<-c(0.9,0.905,0.91,0.915,0.92,0.925,0.93,0.935,0.94,0.945,0.95,0.955,0.96,0.965,0.97,0.975,0.98,0.985)
#m is the prevalence of infection in the population
m<-0.05

#required specimens gives the number of specimens needed to obtain power to evaluate the diagnostic, whilst satisfying the requirements above. When n is chosen this way, you can design the test to ensure that the  the lower limit of the confidence interval for the estimate of sensitivity/specificity is not likely to exceed p0

required_specimens_min_acceptable<-(((1.96+1.28)^2)*(p*(1-p)))/((p-po)^2)/m

plot(po,required_specimens_min_acceptable,xlab="minimum extent of lower 95% confidence limit",main=c("prevalence : ",m,"  true sensitivity : ",p),ylab="number of specimens required",ylim=c(0,1.2*(max(required_specimens_min_acceptable))))
lines(po,required_specimens_min_acceptable)
text(po,(1.1*max(required_specimens_min_acceptable)),round(required_specimens_min_acceptable,0),cex=0.5)


#based on Banoo, S. et al. Evaluation of diagnostic tests for infectious diseases: general principles. Nature Reviews Microbiology 4, S20–S32 (2006). 


#x is the precision with which you want to evaluate, expressed as a proportion. i.e. if you want to evaluate a test that you expect to have a sensitivity or specificity of 95% with precision plus or minus 5%, then x should be 0.05
x<-0.02
required_specimens_plus_minus_precision<- ((1.96^2)*(p*(1-p)))/x^2

