getwd()
getwd()

data1 <- read.table("/users/cmbae/workspace/r/ex-1.txt",header=T)
data1

data2 <- read.csv("/users/cmbae/workspace/r/ex-2.csv")
data2

website = "https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data"
data3 <- read.table(website, header=T, sep = ",")
data3
View(data3)

write.table(iris, "/users/cmbae/workspace/r/iris1.txt")

write.table(iris, "/users/cmbae/workspace/r/iris2,txt", row.name=FALSE, sep ="\t")

write.table(iris, "/users/cmbae/workspace/r/iris3.txt", row.name = FALSE, sep=",")
getwd()

# 작업 폴더 설정
getwd()
setwd("/users/cmbae/workspace/r")
getwd()

# ggplot2 설치
install.packages("ggplot2")
library(ggplot2)

# diamonds의 구조 확인
str(diamonds)
class(diamonds)
head(diamonds)
tail(diamonds)

# 커팅 품질이 Premium이고 2캐럿 이상인 다이아몬드 데이터를 추출
diamonds.new <- subset(diamonds, cut=='Premium' & carat>=2)
diamonds.new

# 추출한 데이터를 shiny_diamonds.csv로 저장
write.csv(diamonds.new, 'shiny_diamonds1.csv')
write.csv(diamonds.new, 'shiny_diamonds2.csv', row.names = F)

# csv 파일을 불러와서 diamonds.load에 저장
diamonds.load <- read.csv('shiny_diamonds2.csv', header = T)
diamonds.load

# color 가 D인 데이터를 제외하여 diamonds.new에 저장
diamonds.new <- subset(diamonds.load, color != 'D')
diamonds.new

# shiny_diamonds.csv로 저장
write.csv(diamonds.new, 'shiny_diamonds.csv', row.names = F)
