# calling the function in separated script file. 
source("loadData.R")
# loading data frame which is passed by loadData()
dt <- loadData()

message("saving chart to the file...")

# open png device
png(file = "plot3.png",height=480, width=480)

# draw chart on the opened device - default is screen
with(dt,{
  plot(datetime,Sub_metering_1,xlab ="", ylab = "Energy sub metering",type="l")
  lines(datetime,Sub_metering_2, col = "red")
  lines(datetime,Sub_metering_3, col = "blue")
})
legend("topright",lty = c(1,1,1),col=c("black","red","blue"),
       legend = colnames(dt[7:9]))

# close device
dev.off()