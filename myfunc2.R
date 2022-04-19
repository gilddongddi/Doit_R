categorize.tip <- function(tips){
  tip_ratio <- tips$tip/tips$total_bill*100
  
  class <- c()
  
  for(i in 1:nrow(tips)){
    if(tip_ratio[i] <10){
      class[i] <- 1
    }else if(tip_ratio[i] <15){
      class[i] <- 2
    }else if(tip_ratio[i] <20){
      class[i] <- 3
    }else{
      class[i] <- 4
    }
  }
  tips.new <- cbind(tips, type = class, ratio = tip_ratio)
  return(tips.new)
}