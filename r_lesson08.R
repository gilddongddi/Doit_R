# Boston Housing 데이터셋
# mlbench 패키지 설치
# install.packages("mlbench")
library(mlbench)
data("BostonHousing")
str(BostonHousing)
head(BostonHousing)

help(BostonHousing)
# myds 변수에 "crim", "rm", "dis", "tax", "medv" 열만 저장
myds <- BostonHousing[,c("crim","rm","dis","tax","medv")]
myds

# grp는 주택 가격을 상(H), 중(M), 하(L)로 분류한 것으로 25.0 이상이면 상(H), 
# 17.0 이하면 하(L), 나머지는 중(M)으로 분류

grp <- c()
for(i in 1:nrow(myds)){
  if(myds$medv[i]>=25.0){
    grp[i] <- "H"
  } else if (myds$medv[i] <=17.0){
    grp[i] <- "L"
  } else{
    grp[i] <- "M"
  }
}
# 문자 벡터를 팩터 타입으로 변경
grp <- factor(grp)
grp

# 레벨의 순서를 H, L, M -> H, M, L
grp <- factor(grp, levels = c("H", "M", "L"))
grp
# myds에 grp열 추가
myds <- data.frame(myds, grp)
myds

# grp 의 도수분포표 작성
table(myds$grp)

# 다중산점도 작성
pairs(myds[,-6])

# 점의 모양 지정
point <- as.integer(myds$grp)
point
# 점의 색 지정
color<-c("red","green","blue")
color
# 그룹정보를 포함하여 다중산점도 작성
pairs(myds[,-6], pch = point, col= color[point])
#상관계수 확인
cor(myds[,-6])
