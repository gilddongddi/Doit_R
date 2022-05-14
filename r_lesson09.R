# 전처리 #### 
# 결측값과 특이값

z <- c(1,2,3,NA, 5, NA,8)
sum(z)
is.na(z)
sum(is.na(z))
sum(z, na.rm=TRUE) # na값을 완전히 삭제한 것은 아니네
is.na(z)
z

z1<- c(1,2,3,NA, 5, NA, 8)
z2 <- c(5,8,1,NA,3,NA,7)
z1[is.na(z1)]<-0    # 결측값을 다른 값으로 치환
z1
z3 <- as.vector(na.omit(z2))  # 결측값을 그냥 삭제
z3

#NA를 포함하는 test데이터 생성
x <- iris
x[1,2] <- NA; x[1,3] <-NA
x[2,3] <- NA; x[3,4] <- NA
head(x)

#apply를 이용해서 열별 결측값 확인
col_na <- function(y){
  return(sum(is.na(y)))
}
na_count <- apply(x,2,FUN=col_na)  # 1 = 행, 2 = ㅎ열
na_count

# 행별 결측값 확인
rowSums(is.na(x))
sum(rowSums(is.na(x))>0)
sum(is.na(x))

head(x)
x[!complete.cases(x),]    #NA가 포함된 행들 출력
y <- x[complete.cases(x),]
head(y)


# 특이값 #### 

# 상자글미을 통한 특이값 확인
st <- data.frame(state.x77)
boxplot(st$Income)
boxplot.stats(st$Income)$out

# 특이값을 포함한 행 제거
out.val <- boxplot.stats(st$Income)$out  # 특이값 추출
st$Income[st$Income%in%out.val]<-NA   #특이값을 NA로 대체
head(st)
newdata <- st[complete.cases(st),]
head(newdata)


# 데이터 집계와 병합 ####
# 정렬 ####
v1 <-c(1,7,6,8,4,2,3)
order(v1)   # 위치만 순서대로 알려줌

v1 <- sort(v1)   # 순서를 직접 지정해서 정렬
v1
v2 <- sort(v1, decreasing=T)
v2
v1
v2

# 데이터 분리와 선택 ####
sp <- split(iris, iris$Species)
sp
summary(sp)
sp$setosa

subset(iris, Species == "setosa")
subset(iris, Sepal.Length>7.5)
subset(iris, Sepal.Length>5.1 & Sepal.Width>3.9)
subset(iris, Sepal.Length>7.6, select = c(Petal.Length,Petal.Width))

# 데이터 집계와 병합 ####

# iris 데이터셋에서 각 변수의 품종별 평균 출력
agg <- aggregate(iris[,-5],list(품종=iris$Species), mean)     # 5열 제외(품종)
agg

x <- data.frame(name=c("lee","kim","choi"),kor=c(100,90,80)) # 데이터 프레임 생성
y <- data.frame(name=c("lee","kim","park"),eng=c(95,85,75))
z <- merge(x,y, by="name")
z

merge(x,y,all.x=T)   # x는 모두 표시
merge(x,y,all.y=T)   # y는 모두 표시
merge(x,y,all=T)     # x,y 모두 표시
