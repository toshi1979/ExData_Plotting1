# calling the function in separated script file. 
source("loadData.R")
# loading data frame which is passed by loadData()
dt <- loadData()

message("saving chart to the file...")

# open png device
png(file = "plot2.png",height=480, width=480)

# draw chart on the opened device - default is screen
with(dt,plot(datetime,Global_active_power,xlab = ""
             , ylab = "Global Active Power (kilowatts)", type = "l"))
# close device
dev.off()