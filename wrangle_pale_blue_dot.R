## # # # # # # ###
##       wrangle##
## pale_blue_dot##
## # # # # # # ###

library(tuneR)
library(seewave)
library(magrittr)

## load all .mp3 files in wd
files <- list.files(pattern = "*.mp3", full.names =T)
names <- list("1.mp3", "2.mp3", "3.mp3", "4.mp3")
set.seed(2)
for (i in length(files)) {
    name <- files[i]
    dat <- readMP3(files[i])
    length <- round(length(dat@left) / dat@samp.rate, 2)
    length <- length - 60
    start <- as.numeric(sample(0:length, 1, replace =T))
    end <- start + 60
    cut <- cutw(dat, from = start, to = end, output = "Wave") %>%
        fadew(din = 1, dout = 3, shape = "exp", output = "Wave")
    writeWave(cut, filename = "1.mp3", extensible =F)
}
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
