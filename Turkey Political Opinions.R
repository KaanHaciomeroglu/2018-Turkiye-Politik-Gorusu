#TURKIYE 2018 MAYIS SIYASI GORUS VERILERI

#################################
####  VERIYI ANLAMA  ############
#################################

library(readr)
data <- read_csv("yonelimfinal.csv")
View(data)
data <- data [-1] # VERIDEN TARIH SUTUNUNU SILMEK
 
install.packages("dplyr")
library(dplyr)
data <- mutate_if(data, is.character, as.factor) # TUM VERI SETINI FACTORE CEVIRMEK
str(data) # VERI SETININ TIPLERININ KONTROLU


#################################
####  VERIYI HAZIRLAMA  #########
#################################


str(data$parti) # PARTI SUTUNUNUN LEVEL DEGERII KONTROLUS
# PARTI ISIMLERININ ANONIME CEVRILMESI
levels(data$parti) <- c("Parti1","Parti2","Parti3","Parti4","Parti5","Parti6")

summary(data) #VERILERIN OZETI

round(prop.table(table(data$parti)) * 100, digits = 1) #YUZDELIK OLARAK PARTI OYLARI

is.na(data) #VERI EKSIK DEGER SORGULAMASI
summary(is.na(data))

#SUTUNLARA GORE EN COK TEKRAR EDEN VERI
encok_bolge <- table(data$Bolge)
encok_deger_bolge <- names(encok_bolge[which.max(encok_bolge)]) 
summary(data$Bolge)
encok_deger_bolge #HANGI BOLGENIN COGUNLUK OLDUGUNU GOSTERIR

encok_yas <- table(data$Yas)
encok_deger_yas <- names(encok_yas[which.max(encok_yas)])
summary(data$Yas)
encok_deger_yas #HANGI YAS GRUBUNUN COGUNLUK OLDUGUNU GOSTERIR

encok_egitim <- table(data$Egitim)
encok_deger_egitim <- names(encok_egitim[which.max(encok_egitim)])
summary(data$Egitim)
encok_deger_egitim #HANGI EGITIM DURUMUNUN COGUNLUK OLDUGUNU GOSTERIR

parti <- table(data$parti)
encok_deger_parti <- names(parti[which.max(parti)]) 
summary(data$parti)
encok_deger_parti #HANGI PARTININ COGUNLUK OLDUGUNU GOSTERIR


#################################
####  VERIYI GORSELLESTIRME  ####
#################################

#*****************************************************
#SORU GRAFIKLERI
install.packages("ggplot")
library(ggplot2)

#Soru1
ggplot(data) + 
  geom_bar(mapping = aes(x =parti , fill = soru1, ), position = "dodge") +
  labs(title = "Sizce Ekonomik Durumumuz Ýyi Mi?")

#Soru2
ggplot(data) + 
  geom_bar(mapping = aes(x =parti , fill = soru2, ), position = "dodge") +
  labs(title = "Eðitimde Reforma Ýhtiyaç Var Mý?")

#Soru3
ggplot(data) + 
  geom_bar(mapping = aes(x =parti , fill = soru3, ), position = "dodge") +
  labs(title = "Destek Kurumlarýnýn Özelleþtirilmesini Destekliyor Musunuz?")

#Soru4
ggplot(data) + 
  geom_bar(mapping = aes(x =parti , fill = soru4, ), position = "dodge") +
    labs(title = "Devlet Belli Suçlar Ýçin Ýdam Cezasý Getirmeli Mi?")

#Soru5
ggplot(data) + 
  geom_bar(mapping = aes(x =parti , fill = soru5, ), position = "dodge") +
  labs(title = "Gazetecileri Yeterince Tarafsýz Buluyor Musunuz?")

#Soru6
ggplot(data) + 
  geom_bar(mapping = aes(x =parti , fill = soru6, ), position = "dodge") +
  labs(title = "Saat 22:00'den Sonra Ýçki Alma Yasaðýný Destekliyor Musunuz?")

#Soru7
ggplot(data) + 
  geom_bar(mapping = aes(x =parti , fill = soru7, ), position = "dodge") +
  labs(title = "Laik Bir Devlette Yaþamak Ýster Misiniz?")

#Soru8
ggplot(data) + 
  geom_bar(mapping = aes(x =parti , fill = soru8, ), position = "dodge") +
  labs(title = "Kürtaj Yasaðýný Destekliyor Musunuz?")

#Soru9
ggplot(data) + 
  geom_bar(mapping = aes(x =parti , fill = soru9, ), position = "dodge") +
  labs(title = "Olaðanüstü Halin (Ohal) Özgürlükleri Kýsýtladýðýný Düþünüyor Musunuz?")

#Soru10
ggplot(data) + 
  geom_bar(mapping = aes(x =parti , fill = soru10, ), position = "dodge") +
  labs(title = "Meclise Yeni Bir Partinin Katýlmasýný Ýster Misiniz?")
#*****************************************************

#******************************************************
egitim_bolge <- ggplot(data, aes(Bolge, fill = Egitim))
egitim_bolge + geom_bar(position = "dodge") + 
  labs(title = "Bölgelere Göre Eðitim Durumu Grafiði")

bolge <- ggplot(data, aes(Bolge, fill = parti))
bolge + geom_bar(position = "dodge") + 
  labs(title = "Bölgelere Göre Partilere Verilen Destek Grafiði")

yas <- ggplot(data, aes(parti, fill = Yas))
yas + geom_bar(position = "dodge") + 
  labs(title = "Partilerin Destek Aldýðý Yas Gruplarý")

egitim <- ggplot(data, aes(Egitim, fill = parti))
egitim + geom_bar(position = "dodge") + 
  labs(title = "Eðitim Durumuna Göre Partilere Verilen Destek Grafiði")
#******************************************************

#************************************************************************
# PASTA GRAFIGI
#install.packages("plotrix")
library(plotrix)
frekanslar2 <- table(data$parti)
etiketler <- paste(names(frekanslar2), frekanslar2, sep=" =  ")
pie3D(frekanslar2, labels = etiketler,main="Partilere Verilen Destek Sayisi",
      col = rainbow(9),explode = 0.3)
#************************************************************************

#################################
####  VERIYI MODELLEME  #########
#################################

# VERI SETININ RASTGELE BICIMDE EGITIM VE TEST VERI SETI OLARAK AYIRMA

#install.packages("caret")
library(caret)
set.seed(27)
egitimIndisleri <- createDataPartition(y = data$parti, p = .75, list = FALSE) 
egitim <- data[egitimIndisleri,]
test <- data[-egitimIndisleri,]

# EGITIM VE TEST VERI SETLERINDE TAHMINDE KULLANILACAK NITELIKLER VE HEDEF NITELIGIN AYRI NESNELERE ATANMASI
testNitelikleri <- test[, -15]
testHedefNitelik <- test[[15]]

egitimNitelikleri <- egitim[, -15]
egitimHedefNitelik <- egitim[[15]]

# BASIT (NAIVE) BAYES ALGORITMASININ UYGULANMASI
# NAIVE BAYES MODELI OLUSTURMA

#install.packages("e1071")
library(e1071)
naiveBayes_modeli <- naiveBayes(egitimNitelikleri, egitimHedefNitelik) 
naiveBayes_modeli

# NAIVE BAYES MODELI ILE TEST NITELIKLERINDEN TAHMINI SINIF OLUSTURMA
(tahminiSiniflar <- 
    predict(naiveBayes_modeli,testNitelikleri)) 
summary(tahminiSiniflar)

# Performans degerlendirmesi
confusionMatrix(data = tahminiSiniflar, reference = testHedefNitelik)


#Karar Aðacý Modeli

#install.packages("DMwR2")
library(DMwR2)#Karar aðacý kütüphanesini yüklemek için
set.seed(27)
n=NROW(data)#veri setindeki satýr sayýsý
SRS <- sample(sample(1:n, size = round(0.75*n), replace=FALSE))
#veri setinden örneklem çekilerek eðitilecek veri seti ve test setine ayýrmak için
training <- data[SRS, ]#eðitilecek veri seti
test_ <- data[-SRS, ]#test edilecek veri seti

library(rpart)
fit <- rpart(parti ~., data = training, method = 'class')

(tahmin<-
  predict(fit,test_,type = "class"))


# Performans degerlendirmesi
library(caret)
confusionMatrix(data = tahmin, reference = test_$parti)

#install.packages("rpart.plot")
#library(rpart.plot)#karar aðacýnýn görselleþtirilmesi için

prp(fit ,type =4 , extra = 9, branch.lty = 3 , box.palette = "auto" ,fallen.leaves = TRUE , varlen = 0 ,faclen = 0)


#K-Means Kümeleme

data_k <- as.data.frame(data)
data_k <- data.matrix(data_k)
head(data_k)

#sorular 1=Evet 2=Hayýr

# Loading package
install.packages("ClusterR")
library(ClusterR)
library(cluster)

# Fitting K-Means clustering Model 
# to training dataset

desc_stats<-data.frame(
  Min=apply(data_k, 2, min), # minimum
  Med=apply(data_k, 2, median), # median
  Mean=apply(data_k, 2, mean), # mean
  SD=apply(data_k, 2, sd), # Standard deviation
  Max=apply(data_k, 2, max)# Maximum
) 
desc_stats<-round(desc_stats, 1)# Yuvarlama
desc_stats

data_k_scale<-scale(data_k)
head(data_k_scale)


library(factoextra)
fviz_nbclust(data_k_scale, kmeans, method="wss")


library(ggthemes)
tma<-theme_igray()
fviz_nbclust(data_k_scale, kmeans, method="wss")+
  geom_vline(xintercept=2, linetype=2)+tma

set.seed(27)
km.res<-kmeans(data_k_scale, 2, nstart=1)
print(km.res)

fviz_cluster(km.res, data=data_k_scale)+ tma


km.res.data <- km.res[["cluster"]]
km.res.data <- as.factor(km.res.data)
str(km.res.data)
summary(km.res.data)

aa<- data.frame(kumeler=c(km.res.data),
                parti=c(data$parti),
                stringsAsFactors = FALSE)

View(aa)
summary(aa)

karsilastirma <- ggplot(aa, aes(kumeler, fill = parti))
karsilastirma + geom_bar(position = "dodge") + 
  labs(title = "Partilerin Hangi Kümede Olduðunu Gösteren Grafik")



