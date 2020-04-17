loadData <- function(){
  library(sqldf)
  library(dplyr)
  library(datasets)
  
  #--- download data set from web
  zFileDir <-"./zfile"
  zFileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  zFileName <- "file.zip"
  zFilePath <- paste0(zFileDir,"/",zFileName)
  dataDir <- "./data"
  
  # skip download if it already exists
  if (!file.exists(zFileDir)) {
    message("downloading zip file...")
    dir.create(zFileDir)
    download.file(url = zFileUrl, destfile = zFilePath)
  }
  
  # skip unzip if data is already exist
  if (!file.exists(dataDir)) {
    message("uncompressing zip file...")
    dir.create(dataDir)
    unzip(zipfile = zFilePath, exdir = dataDir)
    message("done..")
  }
  
  # fread() then subset is faster, but I take the one which consume lower memory.
  # also read.csv.sql does not have na.string argument.
  
  message("loading data set...")
  filePath <- paste0(dataDir,"/household_power_consumption.txt")
  dt <- read.csv.sql(cmd, sql = "select * from file where 
              Date = '1/2/2007' or Date = '2/2/2007'", sep = ";")
  
  # add new column - datetime
  return(cbind(dt,datetime= as.POSIXct(strptime(
    paste(dt$Date,dt$Time),format = "%d/%m/%Y %H:%M:%S"))))
  
}