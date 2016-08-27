# Calvin A. Cox
# Exploratory Data Data Analysis
# plot3.R

# Download and unzip file in working directory
elec_url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(elec_url,"elec_data.zip",mode=wb)
unzip("elec_data.zip")
elec_data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
elec_data$Date<-as.Date(elec_data$Date,"%d/%m/%Y")


# Subset elec_data to just include 2007-02-01 and 2007-02-02 and combine dat and time
elec_data_short<-subset(elec_data,elec_data$Date=="2007-02-01" | elec_data$Date=="2007-02-02")
elec_data_short$Date_Time <- as.POSIXct(paste(elec_data_short$Date, elec_data_short$Time))

# Plot 3 multiple plots on the same graph.
with(elec_data_short, plot(Date_Time,Sub_metering_1,type = 'l',xlab="",ylab = "Energy sub metering"))
with(elec_data_short, lines(Date_Time,Sub_metering_2, col="red"))
with(elec_data_short, lines(Date_Time,Sub_metering_3, col="blue"))

# Add a legend
col<-c("black","red","blue")
sub_meter_col_names<-grep("Sub_metering",colnames(elec_data_short),value = TRUE)
legend("topright", col=col, lwd=c(1, 1.5, 2),legend=sub_meter_col_names)

# Save to png file
dev.copy(png,'plot3.png')
dev.off()
