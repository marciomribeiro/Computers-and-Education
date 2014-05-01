######
# Author: Marcio Ribeiro and Rodrigo Paes
# {marcio,rodrigo}@ic.ufal.br
# Federal University of Alagoas / Computer Science Institute
#
# Reference on R: http://bit.ly/r_hypothesis
######

# Precision analysis

########
# INPUT DATA
########

# number of success
precision_success=32 #14

# success+fails
precision_trials=40 #24

# alternative hypothesis
precision_h1 = .6

########
# END OF INPUT DATA
########


precision_average = precision_success / precision_trials

# Null hypothesis
precision_h0_average = precision_h1
precision_h0_stddev = sqrt( precision_h0_average*(1-precision_h0_average))

# bests estimates for our population
precision_pop_stddev = precision_h0_stddev / sqrt(precision_trials)
precision_pop_average = precision_average 
precision_pop_zscore = (precision_average - precision_h0_average )/ precision_pop_stddev

precision_p_value = 1- pnorm(precision_pop_zscore)

precision_p_value

# We could simplify and use this formula:
prop.test(precision_success, precision_trials, p=precision_h1, alt="greater", correct=FALSE) 

#### TODO: do the same thing for recall 