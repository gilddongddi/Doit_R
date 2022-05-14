# 데이터 시각화기법 ####

# 트리맵(treemap)
install.packages("treemap")
library(treemap)
data(GNI2014)
head(GNI2014)
treemap(GNI2014,
        index=c("continent","iso3"),   # 계층구조 설정(대륙 = 국가)
        vSize = "population",   # 타일의 크기
        vColor = "GNI",         # 타일의 컬러
        type = "value",         # 타일 컬러링
        bg.labels="yellow",     # 레이블의 배경색
        title = "World's GNI")  # 트리맵 제목


# 버블 차트(bubble chart)
st <- data.frame(state.x77)
symbols(st$Illiteracy, st$Murder,    # 원의 x,y좌표의 열-문맹률, 범죄율
        circles=st$Population,       # 원의 반지름의 열
        inches = 0.4,               # 원의 크기 조절값
        fg="white",                  # 원의 테두리 색
        bg="lightgray",              # 원의 바탕색
        lwd=1.5,                     # 원의 테두리선 두께
        xlab="rate of Illiteracy",
        ylab = "crime(murder) rate",
        main="Illiteracy and Crime")
text(st$Illiteracy, st$Murder,      # 텍스트가 출력될 x,y좌표
     rownames(st),                  # 출력할 텍스트
     cex=0.6,                       # 폰트 크기
     col="brown")                   # 폰트 컬러

# 모자이크 플롯(mosaic plot)
head(mtcars)
? mtcars
mosaicplot(~gear+vs, data = mtcars, color=TRUE,     # ~은 x축, +는 y축, color=TRUE : 음영을주겠다
           main="Gear and Vs")
mosaicplot(~gear+vs, data = mtcars, color=c("blue", "yellow"),
           main="Gear and Vs")


# ggplot ####

library(ggplot2)
month <- c(1,2,3,4,5,6)
rain <- c(55,50,45,50,60,70)
df <- data.frame(month, rain)
df

ggplot(df, aes(x=month, y=rain))+
  geom_bar(stat="identity",           #막대의 높이는 y축에 해당하는 열의 값
           width=0.7,                 # 막대의 폭 지정
           fill="steelblue")+          # 막대의 색 지정
           ggtitle("월별 강수량")+
  theme(plot.title = element_text(size=25, face="bold", colour="steelblue"))+
  labs(x="월", y="강수량")+
  coord_flip()     # 그래프를 가로 방향으로 출력

# 기본적인 히스토그램

ggplot(iris, aes(x=Petal.Length))+
  geom_histogram(binwidth=0.5)

ggplot(iris, aes(x=Sepal.Width, fill=Species, color=Species))+
  geom_histogram(binwidth = 0.5, position = "dodge") +    # dodge: 막대를 겹치지 않음
  theme(legend.position = "top")  # legend: 범례

ggplot(iris, aes(x=Sepal.Width, fill=Species, color=Species))+
  geom_histogram(binwidth = 0.5, position = "identity") +    # dodge: 막대를 겹치지 않음
  theme(legend.position = "top")  # legend: 범례

# 기본적인 산점도
ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width))+
  geom_point()

ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width,
                      color=Species))+
  geom_point(size=3)+
  ggtitle("꽃잎의 길이와 폭")+
  theme(plot.title = element_text(size=25, face="bold", colour="steelblue"))


# 그룹별 상자그림

ggplot(data=iris, aes(y=Petal.Length))+
  geom_boxplot(fill="yellow")

ggplot(data=iris, aes(y=Petal.Length, fill=Species))+
  geom_boxplot()

# 워드 클라우드
install.packages("dplyr")
library(dplyr)
install.packages("readr")
library(readr)
install.packages("tidytext")
library(tidytext)
library(ggplot2)
install.packages("wordcloud2")
library(wordcloud2)

f <- read_file("trump.txt")
trump <- data_frame(f)
tidy_trump <- trump %>% unnest_tokens(word,f)
tidy_trump <- tidy_trump %>% anti_join(stop_words)
wordcount <- sort(table(tidy_trump), decreasing = T)
wordcount <- wordcount[wordcount > 2]
wordcloud2(wordcount)


# Library
library(ggplot2)

# create a dataset
data <- data.frame(
  name=c( rep("A",500), rep("B",500), rep("B",500), rep("C",20), rep('D', 100)  ),
  value=c( rnorm(500, 10, 5), rnorm(500, 13, 1), rnorm(500, 18, 1), rnorm(20, 25, 4), rnorm(100, 12, 1) )
)   # rnorm : 정규분포 만드는 함수
data
# Most basic violin chart
p <- ggplot(data, aes(x=name, y=value, fill=name)) + # fill=name allow to automatically dedicate a color for each group
  geom_violin()

p


# library
library(wordcloud2) 

# have a look to the example dataset
# head(demoFreq)

# Basic plot
wordcloud2(data=demoFreq, size=1.6)

# library
library(wordcloud2) 

letterCloud( demoFreq, word = "R", color='random-light' , backgroundColor="black")
letterCloud( demoFreq, word = "PEACE", color="white", backgroundColor="pink")


x <- runif(300,  min=-10, max=10) 
y <- 0.1*x^3 - 0.5 * x^2 - x + 10 + rnorm(length(x),0,8) 

# plot of x and y :
plot(x,y,col=rgb(0.4,0.4,0.8,0.6),pch=16 , cex=1.3) 

# Can we find a polynome that fit this function ?
model <- lm(y ~ x + I(x^2) + I(x^3))

# I can get the features of this model :
#summary(model)
#model$coefficients
#summary(model)$adj.r.squared

# For each value of x, I can get the value of y estimated by the model, and add it to the current plot !
myPredict <- predict( model ) 
ix <- sort(x,index.return=T)$ix
lines(x[ix], myPredict[ix], col=2, lwd=2 )  

install.packages("qqman")
library(qqman)
# Make the Manhattan plot on the gwasResults dataset
manhattan(gwasResults, chr="CHR", bp="BP", snp="SNP", p="P" )
# A list of SNP of interest is provided with the library:
snpsOfInterest
# Let's highlight them, with a bit of customization on the plot
manhattan(gwasResults, highlight = snpsOfInterest)
manhattan(gwasResults, annotatePval = 0.01)
qq(gwasResults$P)

don <- gwasResults %>% 
  
  # Compute chromosome size
  group_by(CHR) %>% 
  summarise(chr_len=max(BP)) %>% 
  
  # Calculate cumulative position of each chromosome
  mutate(tot=cumsum(chr_len)-chr_len) %>%
  select(-chr_len) %>%
  
  # Add this info to the initial dataset
  left_join(gwasResults, ., by=c("CHR"="CHR")) %>%
  
  # Add a cumulative position of each SNP
  arrange(CHR, BP) %>%
  mutate( BPcum=BP+tot)

axisdf = don %>% group_by(CHR) %>% summarize(center=( max(BPcum) + min(BPcum) ) / 2 )

ggplot(don, aes(x=BPcum, y=-log10(P))) +
  
  # Show all points
  geom_point( aes(color=as.factor(CHR)), alpha=0.8, size=1.3) +
  scale_color_manual(values = rep(c("grey", "skyblue"), 22 )) +
  
  # custom X axis:
  scale_x_continuous( label = axisdf$CHR, breaks= axisdf$center ) +
  scale_y_continuous(expand = c(0, 0) ) +     # remove space between plot area and x axis
  
  # Custom the theme:
  theme_bw() +
  theme( 
    legend.position="none",
    panel.border = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank()
  )

install.packages("qqrepel")
