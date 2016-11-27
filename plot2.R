##plot2
plot2 <- function(){
  pngfile <- "plot2.png"
  library(data.table)
  
  #readData
  datafile <- "household_power_consumption.txt"
  if (!file.exists(datafile)){
    ##unzip:
    unzip ("household_power_consumption.zip",datafile)
  }
  data <- fread(datafile, na.strings = "?", sep = ";", header = T)
  ndata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
  
  datetimeFormat <- "%d/%m/%Y %H:%M:%S"
  
  #set device
  png(pngfile, width = 480, height = 480, bg="transparent")
  
  #drow graph
  with(ndata,
       plot(strptime(paste(Date, Time), datetimeFormat),
            Global_active_power, 
            type="l",
            ylab = "Global Active Power(kilowatts)", xlab=""))
  
  #close device
  dev.off()
}