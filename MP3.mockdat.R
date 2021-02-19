library(data.table)
library(emojifont)
source("/Users/Chris/Documents/Mikhaila/jaw.model.fun.R")
setwd("/Users/Chris/Documents/BC/5380.s.2018/MP3")
library(png)
library(grid)
img <- readPNG("trump.png")
g <- rasterGrob(img, interpolate=TRUE)



  a<- c(pi/180*seq(-20,20,length.out = 50))-pi
hipL <- data.table(x=0,y=1,ang=a-pi)
hipL[,"xend":=x+cos(ang)*0.2]
hipL[,"yend":=y+sin(ang)*0.2]

hipR <- data.table(x=0,y=1,ang=a)
hipR[,"xend":=x+cos(ang)*0.2]
hipR[,"yend":=y+sin(ang)*0.2]

legL <- data.table(x=0,y=1,ang=a/30-pi/2)
legL[,"xend":=x+cos(ang)*2.2]
legL[,"yend":=y+sin(ang)*2.2]


for(i in 1:nrow(legL)){
p <- ggplot(dat=hipL[i])+geom_point(aes(x=xend,y=yend),size=5)
p <-p+geom_point(dat=hipR[i],aes(x=xend,y=yend),size=5)
p <- p+geom_point(dat=legL[i],aes(x=xend,y=yend),size=5)
p <- p+geom_point(dat=hipL[i],aes(x=xend,y=yend),color="white",size=0.1)
p <-p+geom_point(dat=hipR[i],aes(x=xend,y=yend),color="white",size=0.1)
p <- p+geom_point(dat=legL[i],aes(x=xend,y=yend),color="white",size=0.1)+theme_void()+xlim(c(-1,1))+ylim(c(-1.5,4))+annotation_custom(g, xmin=-0.5, xmax=.5, ymin=3, ymax=4)
jpeg(paste0("walk_",i,".jpg"))

print(p)
dev.off()
}



for(i in 2:4){
  w <- read.csv("walk_1.txt",sep="\t")
  w.col <- colnames(w)
  colnames(w) <- gsub("\\.","",colnames(w))
  x <- jitter(w$xpixel,factor = 10,amount = 2)
  y <- jitter(w$ypixel,factor = 10,amount = 2)
  w$xpixel <- x
  w$ypixel <- y
  colnames(w) <- w.col
  write.table(w,paste0("walk_",i,".txt"),row.names = F,sep="\t")
  }

walk.files <- list.files()[grep("walk_.*.txt",list.files())]
walk.dat <- list()
for(i in walk.files){
  walk.i <- read.csv(i,sep="\t")
  met.dat <- unlist(strsplit(i,"_")) #split i for metadata and unlist it
  speed <- met.dat[2] #get speed
  subject <- gsub(".txt","",met.dat[3]) #remove ".txt"
  walk.dat[[i]] <- data.frame(walk.i,speed=speed,subject=subject)
}
walk.dat <- do.call(rbind,walk.dat)
