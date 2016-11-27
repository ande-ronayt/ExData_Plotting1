##plot1
plot1 <- function() {
  
    pngfile <- "plot1.png"
    library(data.table)
    
    #readData
    datafilezip <- "household_power_consumption.zip"
    datafile <- "household_power_consumption.txt"
    if (!file.exists(datafile)){
      ##unzip:
      unzip (datafilezip, datafile)
    }
    data <- fread(datafile, na.strings = "?", sep = ";", header = T)
    ndata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
    
    datetimeFormat <- "%d/%m/%Y %H:%M:%S"
    
    #set device
    png(pngfile, width = 480, height = 480,bg="transparent")
    
    #drow graph
    hist(ndata[,Global_active_power], 
         col="red", 
         xlab="Global Active Power(kilowatts)", 
         main = "Global Active Power")
    
    #close device
    dev.off()
}