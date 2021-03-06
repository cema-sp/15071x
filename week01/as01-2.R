IBM <- read.csv("IBMStock.csv")
GE <- read.csv("GEStock.csv")
ProcterGamble <- read.csv("ProcterGambleStock.csv")
CocaCola <- read.csv("CocaColaStock.csv")
Boeing <- read.csv("BoeingStock.csv")

IBM$Date = as.Date(IBM$Date, "%m/%d/%y")
GE$Date = as.Date(GE$Date, "%m/%d/%y")
CocaCola$Date = as.Date(CocaCola$Date, "%m/%d/%y")
ProcterGamble$Date = as.Date(ProcterGamble$Date, "%m/%d/%y")
Boeing$Date = as.Date(Boeing$Date, "%m/%d/%y")

print("CocaCola price over years:")
plot(CocaCola, type="l", col="red")
lines(ProcterGamble, col="blue", lty=1)
abline(v=as.Date(c("2000-03-01")), lwd=1, lty=2, col="green")

print("CocaCola stocks 1995 - 2005")
plot(CocaCola$Date[301:432], CocaCola$StockPrice[301:432], type="l", col="red", ylim=c(0,210))
lines(IBM$Date[301:432], IBM$StockPrice[301:432], col="violet")
lines(GE$Date[301:432], GE$StockPrice[301:432], col="black")
lines(ProcterGamble$Date[301:432], ProcterGamble$StockPrice[301:432], col="orange")
lines(Boeing$Date[301:432], Boeing$StockPrice[301:432], col="blue")

