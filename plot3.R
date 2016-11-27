##plot3
plot3 <- function(){
  pngfile <- "plot3.png"
  library(data.table)
  
  #readData
  datafile <- "household_power_consumption.txt"
  if (!file.exists(datafile)){
    ##unzip:
    unzip ("household_power_consumption.zip", exdir = "./")
  }
  data <- fread(datafile, na.strings = "?", sep = ";", header = T)
  ndata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
  
  datetimeFormat <- "%d/%m/%Y %H:%M:%S"
  
  #set device
  png(pngfile, width = 480, height = 480, bg="transparent")
  
  #drow graph
  with(ndata, 
       plot(strptime(paste(Date, Time), datetimeFormat),
            Sub_metering_1, 
            type="l", 
            ylab = "Energy sub metering", xlab=""))
  with(ndata, 
       lines(strptime(paste(Date, Time), datetimeFormat),
             Sub_metering_2, 
             col="red"))
  with(ndata, 
       lines(strptime(paste(Date, Time), datetimeFormat),
             Sub_metering_3, 
             col="blue"))
  
  legend("topright", 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty=c(1,1,1), 
         col = c("black","red","blue"))
  #close device
  dev.off()
}