## # # # # # # ###
##       wrangle##
## pale_blue_dot##
## # # # # # # ###

library(tuneR)
library(seewave)
library(magrittr)


## load sound file
pbd <- readMP3("The Pale Blue Dot - Cosmos- A Space Time Odyssey.mp3")


## slice to 60 seconds
cut <- cutw(pbd, from = 4, to = 64, output = "Wave") %>%
    fadew(din = 1, dout = 3, shape = "exp", output = "Wave")

# reverse
tuc <- revw(cut, output ="Wave")

## export shortened file
writeWave(cut, "cut.mp3")


## ph function
## load all mp3 files
## files <- sapply(dir, paste("\\.wav$", readMP3)
## for (i in files)
    ## find file name
    ## find start and end
    ## create vector of time from start to end minus 60 seconds
    ## get random sample from vector, assign as x
    ## add 60 to x; assign to y
    ## cut file from = x, to = y, output = "Wave"
    ## writeWave(i, paste(filename.mp3"))

## create 1 hour list
## load all mp3 files
## files <- sapply(dir, paste("\\.wav$", readMP3)
## bind files into object
## writeWave(object, "object.mp3")

listen(pbd)
listen(cut)
listen(tuc)
