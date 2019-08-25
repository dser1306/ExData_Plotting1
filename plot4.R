date_one <- as.Date("2007-02-01")
date_two <- as.Date("2007-02-02")

df <- read.table(file="household_power_consumption.txt",
                 header=TRUE,
                 sep=";",
                 stringsAsFactors=FALSE,
                 dec=".")
df$Date_Time <- paste(df$Date,df$Time)
df$Date_Time <- strptime(df$Date_Time, format="%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df <- subset(df,Date == date_one | Date == date_two)

png("plot4.png", width=480, height=480)
par(mfcol=c(2,2))

plot(x=df$Date_Time,
     y=as.numeric(df$Global_active_power),
     type="l",
     ylab="Global Active Power",
     xlab="")

plot(x=df$Date_Time,
     y=as.numeric(df$Sub_metering_1),
     type="l",
     ylab="Energy sub metering",
     xlab="")
lines(x=df$Date_Time,
      y=as.numeric(df$Sub_metering_2),
      col="red")
lines(x=df$Date_Time,
      y=as.numeric(df$Sub_metering_3),
      col="blue")
legend("topright",legend=c("Sub_metering_1",
                           "Sub_metering_2",
                           "Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1,
       lwd=2.5,
       cex=0.6,
       bty="o")

plot(x=df$Date_Time,
     y=as.numeric(df$Voltage),
     type="l",
     ylab="Voltage",
     xlab="datetime")

plot(x=df$Date_Time,
     y=as.numeric(df$Global_reactive_power),
     type="l",
     ylab="Global_reactive_power",
     xlab="datetime")

dev.off()