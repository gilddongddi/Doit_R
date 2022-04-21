# 벡터 생성

v1 <- c(1,2,3,4,5)
v1
v2 <- c(21:30)
v2
v3 <- seq(11,30, by=4)
v3
v4 <- seq(51,100, by=3)
v4
v5 <- rep(c(1:5), times=3)
v5
rep(c(1:3), times=5)
rep(c(1:100), length=10)
rep(v4, times=5)
rep(v5, times=10)


# 매트릭스 생성
matrix(1:20, nrow=4, ncol=5, byrow=F)
matrix(1:20, nrow=4, ncol=5, byrow=T)
matrix(1:20, nrow=2, ncol=10, byrow=F)
matrix(1:20, nrow=2, ncol=10, byrow=T)
v1 <- c(1:10)
v2 <- c(11:20)
cbind(v1, v2)
rbind(v1,v2)
v3 <- c(21:30)
cbind(v1,v2,v3)
rbind(v1,v2,v3)


# 데이터프레임 생성
bigdata <- c(90,80,70,65,95,100)
webdata <- c(95,85,75,85,90,80)
java <- c(70,75,85,65,90,60)
database <- c(80,90,75,95,100,65)
middle_test <-data.frame(bigdata,webdata,java,database)
names <- c("한병준", "이은선", "이상미", "최재웅", "진정순", "이신희")
middle_test <-data.frame(names,bigdata,webdata,java,database)
middle_test


# 리스트 생성
list1 <- c(1:3, "one", "two", "three", c(1:10)) # 이것은 벡터임. 숫자도 문자가됨 
list1
list2 <- list(c(1:3), "apple", "strawberry", "banana")
list2
list3 <- list(c(1:5), c(21:30), "Good", 4444, "number1")
list3



# 2. 다음의 코드를 작성하시오
H <- c(168.4, 169.5, 172.1, 185.2, 173.7, 175.2)
W <- c(62.4, 65.3, 59.8, 46.5, 49.8, 58.7)
B <- c("B", "A", "A", "O", "B", "AB")
student <- data.frame(H,W,B)
student

student.colnames <- c("Height", "Weight", "Blood")
student

colnames(student) <- c("Height", "Weight", "Blood")
student

student[2,]
student[3,]

# 1,3열의 값을 출력하시오
student[,c(1,3)]
student[,c("Height","Blood")]

# 1,2열의 합계, 평균을 구하시오
colSums(student[,c(1)]
colSums(student[,c(2)]
colSums(student)

colSums(student[1:2], na.rm=FALSE)        
colSums(student[1])        
colSums(student[2])
colSums(student[1:2])
colMeans(student[1:2])

# 01) read.table() 함수를 이용하여 웹사이트의 데이터를 직접 읽어들여서, 
# winedata 데이터 프레임을 생성하시오. 
# (단, 데이터는 세미콜론(;)으로 구분되어 있음)

website = "https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv"
winedata <- read.table(website, header=T, sep=";")
winedata
View(winedata)

# 02) winedata 데이터의 변수의 개수와 관측치의 개수를 구하시오.
str(winedata)
dim(winedata)


# 03) write.table() 함수를 이용하여 콤마(,)가 구분기호로 사용된 파일을 생성하고
# wine.txt라는 이름으로 외부에 저장하시오.
getwd()
write.table(winedata, "wine.txt", sep=",")

# 최대공약수 구하기

lgm <- function(x,y){
  i <- abs(x-y)
  while(i!=0){
    if(x%%i==0 && y%%i==0){
      return(i)
      break
    }
    i <- i-1
  }
}

result <- lgm(10,8)  
result
result <- lgm(10,20)
result
result <- lgm(12,9)
result
result <- lgm(12,4)
result
lgm(7,21)
lgm(42, 54)
lgm(91, 119)


# 5. Stat2Data 패키지에 있는 Diamonds 데이터셋의 
# PricePerCt(캐럿당 가격) 열을 이용하여 다음을 수행하시오.
install.packages("Stat2Data")
library(Stat2Data)
data(Diamonds)
dim(Diamonds)
str(Diamonds)
colnames(Diamonds)

# 01) PricePerCt(캐럿당 가격)의 평균, 중앙값, 표준편차를 각각 구하고 의미를 설명하시오.
mean(Diamonds$PricePerCt)
median(Diamonds$PricePerCt)
sd(Diamonds$PricePerCt)

# 02) PricePerCt(캐럿당 가격)의 히스토그램, 상자그림을 작성하고 의미를 설명하시오.  
# 단, 히스토그램 X축 제목은 ‘캐럿당 가격($), Y축 제목은 ’빈도수‘, 
# 가장 빈도가 높은 막대에는 다른 색을 지정하시 오. 
color <- rep("pink",times=20)
color[5] <- "hotpink"
hist(Diamonds$PricePerCt,
     main = "Price Per Carat",
     xlab = "PricePerCt($)",
     ylab = "Friquency",
     col = color,
     breaks = seq(0,20000,1000))

summary(Diamonds$PricePerCt)

boxplot(Diamonds$PricePerCt,
        col = "yellow",
        horizontal = F,
        main = "Price Per Carat",
        ylab = "PricePerCt($)",
        ylim = range(1:20000))


outlier <- Diamonds$PricePerCt >= 7762
sum(outlier)
sum(Diamonds$PricePerCt)

Q1_3 <- Diamonds$PricePerCt >= 4185 
sum(Q1_3)
Q1_3 <- Q1_3 <= 7762
sum(Q1_3)
