############################################################
# Author: Marcio Ribeiro and Rodrigo Paes
# {marcio,rodrigo}@ic.ufal.br
# Federal University of Alagoas / Computer Science Institute
#
# Reference on R: http://bit.ly/r_hypothesis
############################################################


script_dir='/Users/marcioribeiro/Dropbox/Meus Artigos/2014/Computers and Education/util/'
#script_dir='D:\\Documents\\pessoal-dropbox\\Dropbox\\artigos\\computers_education_2014\\util\\'

#data_script = paste(script_dir,"data_3_groups.csv",sep="")
data_script = paste(script_dir,"data_2_groups.csv",sep="")



############
# INPUT DATA
############
data = read.csv(data_script, header = TRUE, sep = ",")

####################
# Precision analysis
####################

# number of success
precision_success = nrow(subset(data, subset = (PRECISION.SUCCESS == 1)))
print(paste("Precision success = ", precision_success, sep=""))

# success + fails
precision_trials = nrow(subset(data, subset = (PRECISION.SET == 1)))
print(paste("Precision set = ", precision_trials, sep=""))

# alternative hypothesis
precision_h1 = .72

# Hypothesis test
print(prop.test(precision_success, precision_trials, p = precision_h1, alt="greater", correct=FALSE))


#################
# Recall analysis
#################

# number of success
recall_success = nrow(subset(data, subset = (RECALL.SUCCESS == 1)))
print(paste("Recall success = ", recall_success, sep=""))

# success + fails
recall_trials = nrow(subset(data, subset = (RECALL.SET == 1)))
print(paste("Recall set = ", recall_trials, sep=""))

# alternative hypothesis
recall_h1 = .55

# Hypothesis test
print(prop.test(recall_success, recall_trials, p = recall_h1, alt="greater", correct=FALSE))