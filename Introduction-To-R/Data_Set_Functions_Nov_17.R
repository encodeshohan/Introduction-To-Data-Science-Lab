install.packages("dplyr")
library(dplyr) # Need to Load each Time

stats <- data.frame(player=c('A', 'B', 'C', 'D', 'A', 'A'), 
                    runs=c(100, 200, 408, 19, 56, 100), 
                    wickets=c(17, 20, NA, 5, 2, 17))

filter(stats, runs>100)

distinct(stats) #removes duplicate rows

distinct(stats, player, .keep_all = TRUE) #remove duplicates based on column

# Arrange method
arrange(stats, -wickets,) # Ordered data Based on wickets column
arrange(stats, -wickets,) # minus(-) to order decending

# select Method
select(stats, player,wickets) # to select multiple attributes

# rename method

rename(stats, run_scored=runs) # rename the column

# mutate() & transmute() method

mutate(stats, avg=runs/4) # add new column

transmute(stats, avg=runs/4) #drop all and create a new column

# summarized() method
summarize(stats, sum(runs), mean(runs)) 



