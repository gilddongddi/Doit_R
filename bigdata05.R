getwd()
setwd("/users/cmbae/workspace")
getwd()
setwd("/users/cmbae/workspace/r")
getwd()

apply(iris[,1:4],1,mean)
apply(iris[,1:4],2,mean)

# lapply() l= list / 열 단위로만 계산 / 아래쪽으로 나열/ 리스트의 특성
a <- lapply(iris[,1:4], mean)
a[[1]]
a[[3]]
unlist(a)
# sapply() , 결과는 벡터 또는 행렬
sapply(iris[,1:4], mean)
# tapply() 그룹을 인자로 주고(factor형), 원소별이 아닌 그룹별 처리를 함, 결과는 백터 또는 행렬
tapply(iris$Sepal.Length, iris$Species, mean)
# mapply() , sapply와 비슷하지만 여러 개의 인자를 넘김, 결과는 벡터 또는 행렬
list1 <- list(a = c(1:10), b = c(11:20))
list1
list2 <- list(c = c(21:30), d = c(31:40))
list2
mapply(sum, list1$a, list2$c)
mapply(sum, list1$a, list1$b, list2$c, list2$d)

# 01 사용자 정의 함수
mymax <- function(x,y){
  num.max <- x
  if(y>x){
    num.max <- y
  }
  return(num.max)
}
mymax(10,15)
a <- mymax(20, 15)
b <- mymax(31, 45)
print(a+b)

# 02)
mydiv <- function(x, y=2){
  result <- x/y
  return(result)
}
mydiv(x=10, y=3)
mydiv(10,3)
mydiv(10)

# 03) 여러 개의 값을 반환하는 경우
myfunc <- function(x,y){
  val.sum <- x+y
  val.mul <- x*y
  return(list(sum=val.sum, mul=val.mul))
}
result <- myfunc(5,8)
result
s <- result$sum
s
m <- result$mul
m
cat('5+8=', s, "\n")
cat('5*8=', m, '\n')

# 04) 사용자 정의 함수의 저장
mydiv <- function(x,y=2){
  result <- x/y
  return(result)
}
setwd('/users/cmbae/workspace/r')
source('myfunc.R')
a <- mydiv(20,4)
b <- mydiv(30,4)
a+b
mydiv(mydiv(20,2),5)

# 05) 종업원의 팁 분석하기
# reshape2 패키지 로드
install.packages('reshape2')
library(reshape2)

# str 확인
str(tips)
# 디렉토리 확인과 설정
getwd()

meanbycol.tip <- function(colname){
  value <- unique(tips[, colname])
  result <- list()
  for(i in 1:length(value)){
    idx <- which(tips[,colname]==value[i])
    result[i] <- mean(tips[idx,'tip'])
  }
  names(result) <- value
  return(result)
}


# myfun1.R을 로드
source('myfunc1.R')

# 성별로 tip의 평균
meanbycol.tip('sex')
meanbycol.tip('smoker')
meanbycol.tip('size') #인원별
meanbycol.tip('day')

# myfunc2.R을 로드
source('myfunc2.R')

# categorize.tip 함수를 실행하고 결과를 tips.new에 저장
tips.new <- categorize.tip(tips)

#상위 데이터 확인
head(tips.new)
tail(tips.new)
