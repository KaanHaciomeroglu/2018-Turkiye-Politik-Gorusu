# 2018 Turkiye Politik Görüşü Veri İncelemesi

Veri setimizde sorular, cinsiyet, bölgeler ve yaş aralığına bağlı olarak 
desteklenen partileri görebilmekteyiz. Bu kategorilere göre veriyi sırasıyla Veriyi 
Anlama, Veriyi Hazırlama, Veriyi Görselleştirme ve Veriyi Modelleme başlıkları 
içerisinde çalışmalarını yaptık. 
Veriyi Anlama evresinde kullanacağımız veri setini okutup ilerideki evreler
için verinin anlamını yükseltmeye çalıştık.
Veriyi Hazırlama evresinde görselleştirme ve modelleri daha rahat 
uygulayabilmek adına çalışmaları gerçekleştirdik.
Veriyi Görselleştirme evresinde veri başlıkları arasında grafiklerle 
karşılaştırma ve incelemesini yaptık.
Veriyi Modelleme evresinde Naive Bayes, Karar Ağacı ve K-Means
modelleriyle inceledik.

Büyük veri, geleneksel veri tabanı tekniklerinin kullanılması suretiyle 
işlenmesi mümkün olmayan, farklı hacimlerdeki heterojen veriyi tanımlayan yeni bir 
kavramdır ve çeşitli dijital içeriklerden oluşmaktadır.(AKTAN,2018,s3)
Kullandığımız “Türkiye Politik Görüşü” veri seti 2018 Mayıs ayında dijital 
anket yoluyla oluşturulmuştur.
Rstudio üzerinden seçtiğimiz veri setini incelemeye başlayacağız. Gerekli
kütüphaneler kullanılarak Veriyi Anlama ve Veriyi Hazırlama başlıklarından 
geçirdikten sonra veri setini görselleştirip gerekli karşılaştırmaları yaparak anlatımını 
kolaylaştıracağız. Veri seti üzerinde grafik yardımı ile anlatım ve modelleme 
sonucunda modelimizin doğruluk oranını tespit etmeye çalışacağız. Modelleme için 
Naive Bayes, Karar Ağacı ve K-Means modellerini kullanacağız modellemeler 
sonucunda model performans değerlendirmesini inceleyeceğiz

Kullandığımız “Türkiye Politik Görüşü” veri setine göre sorular, yaşanılan 
bölge, yaş ve eğitim durumuna bağlı olarak kişilerin desteklediği partileri incelemiş 
olduk. İncelediğimiz veriyi grafiklerle yorumladık ve karşılaştırmalarını yaptık.
Karşılaştırmalar sonucunda Şekil 42’de en fazla eğitim durumunun Marmara 
bölgesinde, Şekil 44’de en fazla partilere verilen desteğin Marmara bölgesinde, Şekil 
46’da en çok partilere destek veren yaş aralığı 0-18 olarak, Şekil 48’de en fazla 
partilere destek veren eğitim durumu ise Lise olarak çıkmıştır. Bu sonuçlara bakıldığı 
zaman katılımcıların çoğunun Marmara bölgesinde, 0-18 yaş aralığında, eğitim 
durumunun ise Lise olduğu gözlemlenmiştir. Şekil 50’de partiler arasında en çok 
desteklenen Parti 5 olduğu görülmektedir. 
Naive Bayes ve Karar Ağacı modellerini kullanarak veri setinin performansını 
değerlendirdik çıkan sonuçlara göre Naive Bayes modelinde 0,45’lik bir doğruluk 
oranı alırken Karar Ağacı modelinde 0,43’lük bir oran aldık. Bu oranlara bakıldığı 
zaman veri setimizin ortalama 0,44’lük bir doğruluk oranı aldığını görmekteyiz, 
doğruluk oranımız 1 e uzak olduğunda dolayı güvenilir bir veri olmadığını 
gözlemlenmiştir. Doğruluk oranları düşük olduğundan dolayı K-Means Algoritması 
kullanarak veriyi tekrardan inceledik. K-Means incelemesi sonucunda 1.kümede 196 
kişinin çoğunu parti 1’in oluşturduğunu görebiliyoruz. 2.Kümede ise 689 kişinin diğer 
partilerin çoğunluğunun oluşturduğunu görebilmekteyiz. Kümeler karşılaştırıldığı 
zaman Parti 1’in diğer partilerden ayrıldığını gözlemleyebiliriz.
Seçtiğimiz veri seti için iki adet sınıflandırma modeli, bir adet ise kümele 
modeli oluşturarak inceledik. Veri setimiz için model olarak kümelemenin 
kullanılması daha doğru olduğunu tespit ettik.
