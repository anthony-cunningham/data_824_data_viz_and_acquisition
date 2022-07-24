library(googleVis)
## This data consits of Dates and Temperatures (in C) in Cairo between year 2002-2004
View(Cairo)


cal <- gvisCalendar(Cairo, datevar="Date", numvar="Temp")
plot(cal)

