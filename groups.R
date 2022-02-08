library(tidyverse)
r <- read.csv("roster.txt",col.names = c("Last","First","email"),header = F)


# set.seed(123)
# mp2.grp <- r%>%
#   mutate(ord=sample(1:nrow(r),replace = FALSE,nrow(r)),email=paste0(email,"@bc.edu"))%>%
#   arrange(ord)%>%mutate(group=ceiling(ord/3))%>%select(-ord)
# 
# mp3.grp <- r%>%
#   mutate(ord=sample(1:nrow(r),replace = FALSE,nrow(r)),email=paste0(email,"@bc.edu"))%>%
#   arrange(ord)%>%mutate(group=ceiling(ord/3))%>%select(-ord)
# 
# mp4.grp <- r%>%
#   mutate(ord=sample(1:nrow(r),replace = FALSE,nrow(r)),email=paste0(email,"@bc.edu"))%>%
#   arrange(ord)%>%mutate(group=ceiling(ord/3))%>%select(-ord)
# 
# mp5.grp <- r%>%
#   mutate(ord=sample(1:nrow(r),replace = FALSE,nrow(r)),email=paste0(email,"@bc.edu"))%>%
#   arrange(ord)%>%mutate(group=ceiling(ord/3))%>%select(-ord)



mp3.grp%>%kable()

saveRDS(list(mp2=mp2.grp,mp3=mp3.grp,mp4=mp4.grp,mp5=mp5.grp),"Groups.RDS")
