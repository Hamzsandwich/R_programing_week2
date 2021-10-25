## Write a function that takes a directory of data files and
## a threshold for complete cases and calculates the correlation between sulfate 
## and nitrate for monitor locations where the number of completely observed 
## cases (on all variables) is greater than the threshold.

## The function should return a vector of correlations for the monitors that
## meet the threshold requirement.

corr <- function(directory, threashold = 0) {
        pos_id <- 1
        id = 1:332
        cor_data <- 1
        print(cor_data)
        length(cor_data) <- 0
        print(cor_data)
        
        for(i in id) {
                if(id[pos_id] < 10) {
                        filename <- paste("00", id[pos_id] ,".csv", sep = "")
                } else if(id[pos_id] >=10 & id[pos_id] < 100) {
                        filename <- paste("0", id[pos_id] ,".csv", sep = "")
                } else {
                        filename <- paste(id[pos_id] ,".csv", sep = "")
                }
                path <- paste(directory, "/", filename, sep = "")
                pos_id <- pos_id +1
                airdata_withNAs <- read.csv(path)
                single_airdata <- airdata_withNAs[complete.cases(airdata_withNAs),]
                num_of_completecase <- length(complete.cases(single_airdata))
                
                #print(num_of_completecase)
                
                if(num_of_completecase > threashold) {
                        sulfate <- single_airdata$sulfate
                        nitrate <- single_airdata$nitrate
                        single_cor <- cor(sulfate, nitrate)
                        cor_data <- append(cor_data, single_cor)
                        #
                }else {
                       
                }
             
        }
        cor_data
}