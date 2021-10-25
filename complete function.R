## Write a function that reads a directory full of files 
##and reports the number of completely observed cases in each data file.

##The function should return a data frame where the first column is the 
##name of the file and the second column is the number of complete cases

##complete("specdata", c(2, 4, 8, 10, 12))

complete <- function(directory, id = 1:332){
        pos_id <- 1
        comp_num_data <- NULL
        
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
                add_vec <- c(filename, num_of_completecase)
                #print(add_vec)
                comp_num_data <- rbind(comp_num_data, add_vec)
                
        }
        comp_num_data
}