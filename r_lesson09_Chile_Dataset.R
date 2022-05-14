# Chile 데이터셋 : 1988년 칠레 대통령 선거에 대한 여론조사 결과를 저장
# carData 패키지
install.packages("carData")
library(carData)

# Chile 데이터셋
data(Chile)
? Chile
str(Chile)
head(Chile)
table(Chile$vote)

# 결측값이 있는지 확인하고, 결측값을 제거한 후 ch에 저장
is.na(Chile)
sum(is.na(Chile))
Chile[!complete.cases(Chile),]
ch <- Chile[complete.cases(Chile),]
ch

# 지역별 인구를 내림차순으로 정렬
# C(Central), M(수도권 산티아고 지역), N(북부), S(남부), SA(산티아고시)
agg <- aggregate(ch[,'population'], by=list(지역=ch$region), sum)
order(agg$x, decreasing= T)
agg[order(agg$x,decreasing=T),]
agg

#여론조사 응답결과(vote) 확인(A: 기권, N: 현대통령 반대, U:미정, Y: 현대통령 찬성)
table(ch$vote)

# 성별(sex)별로 현 대통령에 대한 찬성 비율에 차이가 있는지 알아봄
no.people <- table(ch$sex)
tmp <- subset(ch, vote=='Y')
agg <- aggregate(tmp[,'vote'], by=list(성별=tmp$sex), length)
yes.ratio <- agg$x/no.people
yes.ratio

# 지역별(region)별로 현 대통령에 대한 찬성 비율에 차이가 있는지 알아봄
no.region <- table(ch$region)
no.region
tmp <- subset(ch, vote=='Y')
tmp
agg <- aggregate(tmp[,'vote'],by=list(지역=tmp$region), length)
yes.ratio <- agg$x/no.region
yes.ratio
agg[order(agg$x,decreasing=T),]
