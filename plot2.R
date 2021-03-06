# Calvin A. Cox
# Exploratory Data Data Analysis
# plot2.R

# Download and unzip file in working directory
elec_url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(elec_url,"elec_data.zip",mode=wb)
unzip("elec_data.zip")
elec_data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
elec_data$Date<-as.Date(elec_data$Date,"%d/%m/%Y")


# subset elec_data to just include 2007-02-01 and 2007-02-02 and combine dat and time
elec_data_short<-subset(elec_data,elec_data$Date=="2007-02-01" | elec_data$Date=="2007-02-02")
elec_data_short$Date_Time <- as.POSIXct(paste(elec_data_short$Date, elec_data_short$Time))

# plot 2 line plot
with(elec_data_short, plot(Date_Time,Global_active_power,type = 'l',xlab="",ylab = "Global Active Power (kilowatts)"))

# Save to png file
dev.copy(png,'plot2.png')
dev.off()