# calling the function in separated script file. 
source("loadData.R")
# loading data frame which is passed by loadData()
dt <- loadData()

message("saving chart to the file...")

# open png device
png(file = "plot1.png",height=480, width=480)

# draw chart on the opened device - default is screen
with(dt,hist(Global_active_power,col = "red",main = "Global active power"
             , xlab = "Global Active Power (kilowatts)"))
# close device
dev.off()