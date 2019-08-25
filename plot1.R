date_one <- as.Date("2007-02-01")
date_two <- as.Date("2007-02-02")

df <- read.table(file="household_power_consumption.txt",
                 header=TRUE,
                 sep=";",
                 stringsAsFactors=FALSE,
                 dec=".")
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df <- subset(df,Date == date_one | Date == date_two)

hist(as.numeric(df$Global_active_power),
     col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

dev.copy(png,'plot1.png')
dev.off()
