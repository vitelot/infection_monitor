library(gtrendsR)

args = commandArgs(TRUE)
print(args)
time_lapse <- switch(args[1], "month"="today 1-m", "week"="now 7-d", "day"="now 1-d", "")

if(time_lapse=="") {
  stop("Please provide a time lapse [month, week, day]")
}

time = Sys.Date()
#print(time)
#stop("test")

words = list("corona symptome", "fieber", "husten", "Schnupfen", "Lungenentzündung", "coronavirus", "trockener husten")
countries = list("DE", "AT")


result <- gtrends(words[[1]], geo = c("DE"), gprop = "web", time = time_lapse)[[1]]
for(s in countries)
{
  result <- result[FALSE,]
  for (i in 1:length(words))
  {
    print(paste(s,words[[i]], time_lapse, sep=" "))
    result1 <- gtrends(words[[i]], geo = s, gprop = "web", time = time_lapse)[[1]]
    result <- rbind(result, result1)
    }
    write.csv(result, paste(time, "-", s, "-",time_lapse, ".csv", sep=""))
}

s <- "IT"
words = list("coronavirus", "febbre", "tosse", "tosse secca", "polmonite", "raffreddore", "mal di gola", "perdita olfatto", "perdita gusto")
result <- result[FALSE,]
for (i in 1:length(words))
{
  print(paste(s,words[[i]], time_lapse, sep=" "))
  result1 <- gtrends(words[[i]], geo = s, gprop = "web", time = time_lapse)[[1]]
  result <- rbind(result, result1)
}
write.csv(result, paste(time, "-", s, "-",time_lapse, ".csv", sep=""))



#str(result)

#stop()
