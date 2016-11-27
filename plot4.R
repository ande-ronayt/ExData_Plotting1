##plot4
plot4 <- function(){
  pngfile <- "plot4.png"
  library(data.table)
  
  #readData
  datafile <- "household_power_consumption.txt"
  if (!file.exists(datafile)){
    ##unzip:
    unzip ("household_power_consumption.zip", datafile)
  }
  data <- fread(datafile, na.strings = "?", sep = ";", header = T)
  ndata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
  
  datetimeFormat <- "%d/%m/%Y %H:%M:%S"
  
  #set device
  png(pngfile, width = 480, height = 480, bg="transparent")
  
  #drow graph
  par("mfrow" = c(2,2))
  
  ##1
  with(ndata,
       plot(strptime(paste(Date, Time), datetimeFormat),
            Global_active_power, 
            type="l",
            ylab = "Global Active Power", xlab=""))
  
  ##2
  with(ndata,
       plot(strptime(paste(Date, Time), datetimeFormat),
            Voltage, 
            type="l",
            ylab = "Voltage", xlab="datetime"))
  
  ##3
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
         col = c("black","red","blue"),
         bty="n")
  
  ##4
  with(ndata,
       plot(strptime(paste(Date, Time), datetimeFormat),
            Global_reactive_power, 
            type="l",
            xlab="datetime"))
  
  #close device
  dev.off()
}