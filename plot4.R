# calling the function in separated script file. 
source("loadData.R")
# loading data frame which is passed by loadData()
dt <- loadData()

message("saving chart to the file...")

# open png device
png(file = "plot4.png",height=480, width=480)

# draw chart on the opened device - default is screen
# 2 x 2 chart layout
par(mfrow = c(2,2)) 

with(dt,{
  # left top chart
  plot(datetime,Global_active_power,xlab = ""
       , ylab = "Global Active Power", type = "l")
  
  # right top chart
  plot(datetime,Voltage,type = "l")
  
  # left bottom chart
  plot(datetime,Sub_metering_1,xlab ="", ylab = "Energy sub metering",type="l")
  lines(datetime,Sub_metering_2, col = "red")
  lines(datetime,Sub_metering_3, col = "blue")
  legend("topright",lty = c(1,1,1),col=c("black","red","blue"),
         legend = colnames(dt[7:9]))
  
  # right bottom chart
  plot(datetime,Global_reactive_power, type="l")
})


# close device
dev.off()