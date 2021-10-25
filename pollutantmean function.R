pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## read in the data
        ## calculates the mean of a pollutant (sulfate or nitrate) across a 
        ## specified list of monitors
        ## inpute example "pollutantmean("specdata", "sulfate", 1:10)"
        
        pos_id <- 1
        airdata <- NULL
        
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
                airdata <- rbind(airdata, single_airdata)
                
        }
        if(pollutant == "sulfate") {
                mean(airdata$sulfate)

        } else if(pollutant == "nitrate") {
                mean(airdata$nitrate)
        } else {
                NULL
        }
        #x <- subset(airdata) will figure out if subseting with varable 
        #is possable latter
        #mean(airdata$pollutant)
        #print(airdata)
}

