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

plot(x=df$Date_Time,
     y=as.numeric(df$Global_active_power),
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

dev.copy(png,'plot2.png')
dev.off()