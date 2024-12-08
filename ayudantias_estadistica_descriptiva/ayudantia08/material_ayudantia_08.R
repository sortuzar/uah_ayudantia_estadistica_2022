
####Ayudant?a 8####
####Repaso examen####
####Viernes 2 de junio de 2022####
####Ayudante Santiago Ort?zar####
####Estad?stica descriptiva-R, FEN-UAH####
####Prof. Alejandro Gonz?lez####

####Siempre limpiar el environment####
rm(list=ls())
####Buscar el directorio desde el que abrimos el script####
getwd()
####Fijar el directorio en el que queremos trabajar####
setwd("D:/SANTIAGO/OneDrive/Documentos/2022 Ayudantía UAH A. González Estadística R 1 Descriptiva")
####Desactivar notaci?n cient?fica####
options(scipen=999)


####Librer?as####
library(dplyr)
library(PASWR2)
library(ggplot2)
library(gridExtra)

####1####
data(starwars)

####1a####
hist(starwars$birth_year, 
     xlim=c(0,900),
     xaxp=c(0,900,5),
     ylim=c(0,40),
     main="Edad de los personajes de Star Wars",
     xlab="Edad (a?os)",
     ylab="Recuento de frecuencias")

ggplot(starwars, aes(x=birth_year)) + 
  geom_histogram(bins=7) + #ajustar los bins cambia la apariencia
  scale_x_continuous(breaks = seq(0, 900, by = 180)) +
  ylim(0,40) +
  labs(title="Edad de los personajes de Star Wars",
         x="Edad (a?os)",
         y="Recuento de frecuencias")

####1b####
cor(starwars$birth_year,starwars$mass,use="complete.obs")
#Coeficiente de correlaci?n = 0.48

ggplot(starwars, aes(x=birth_year,y=mass)) +
  geom_point() +
  scale_x_continuous(breaks=seq(0,900, 360)) +
  scale_y_continuous(breaks=seq(0,1400,240)) +
  theme_bw() +
  labs(title="Correlaci?n entre edad y peso de los personajes de Star Wars",
       x="Edad (a?os)",
       y="Peso (kilos)")

####1c####
histograma.edad <- ggplot(starwars, aes(x=birth_year)) + 
  geom_histogram(bins=7) + #ajustar los bins cambia la apariencia
  scale_x_continuous(breaks = seq(0, 900, by = 180)) +
  ylim(0,40) +
  labs(title="Edad de los personajes de Star Wars",
       x="Edad (a?os)",
       y="Recuento de frecuencias")

dispersion.edad.peso <- ggplot(starwars, aes(x=birth_year,y=mass)) +
  geom_point() +
  scale_x_continuous(breaks=seq(0,900, 360)) +
  scale_y_continuous(breaks=seq(0,1400,240)) +
  theme_bw() +
  labs(title="Correlaci?n entre edad y peso de los personajes de Star Wars",
       x="Edad (a?os)",
       y="Peso (kilos)")

graficos.starwars <- grid.arrange(histograma.edad, dispersion.edad.peso,
                                  nrow=1,ncol=2)

ggsave("material_ayudantia_08_graficos-starwars.jpg", graficos.starwars,
       width=7,
       height=7)

####2####
data(swiss)

####2a####
swiss.examination.fertility <- ggplot(swiss, aes(x=Examination,y=Fertility)) +
  geom_point() +
  scale_x_continuous(breaks=seq(0,40, 10)) +
  scale_y_continuous(breaks=seq(30,100,10)) +
  theme_bw() +
  labs(title="Correlaci?n entre puntaje m?ximo y fertilidad",
       x="Calificaci?n m?xima (porcentaje)",
       y="Fertilidad (tasa de nacimientos)") +
  geom_smooth(method="lm", se=FALSE)
swiss.examination.fertility

swiss.education.fertility <- ggplot(swiss, aes(x=Education,y=Fertility)) +
  geom_point() +
  scale_x_continuous(breaks=seq(0,60, 10)) +
  scale_y_continuous(breaks=seq(30,100,10)) +
  theme_bw() +
  labs(title="Correlaci?n entre proporci?n de la poblaci?n con b?sica completa y fertilidad",
       x="Educaci?n b?sica completa (porcentaje)",
       y="Fertilidad (tasa de nacimientos)") +
  geom_smooth(method="lm", se=FALSE)
swiss.education.fertility

swiss.education.examination <- ggplot(swiss, aes(x=Education,y=Examination)) +
  geom_point() +
  scale_x_continuous(breaks=seq(0,60, 10)) +
  scale_y_continuous(breaks=seq(0,40,10)) +
  theme_bw() +
  labs(title="Correlaci?n entre proporci?n de la poblaci?n con b?sica completa y calificaci?n m?xima",
       x="Educaci?n b?sica completa (porcentaje)",
       y="Calificaci?n m?xima (porcentaje)") +
  geom_smooth(method="lm", se=FALSE)
swiss.education.examination

####2b####
cor(swiss$Examination,swiss$Fertility,use="complete.obs")
#-0.65

cor(swiss$Education,swiss$Fertility,use="complete.obs")
#-0.66

cor(swiss$Education,swiss$Examination,use="complete.obs")
#0.70

####2c####
grid.arrange(swiss.education.examination,
             swiss.education.fertility,
             swiss.examination.fertility,
             nrow=3,
             ncol=1)

####3####
data(EPIDURALF)

####3a####
ease.treatment <- xtabs(~ease+treatment,data=EPIDURALF)
prop.table(ease.treatment, 1)

ease.doctor <- xtabs(~ease+doctor,data=EPIDURALF)
prop.table(ease.doctor, 1)

####3b####
ggplot(EPIDURALF, 
       aes(x = treatment, 
           fill = ease)) + 
  geom_bar(position = "stack")
#Versi?n transpuesta:
ggplot(EPIDURALF, 
       aes(x = ease, 
           fill = treatment)) + 
  geom_bar(position = "stack")


ggplot(EPIDURALF, 
       aes(x = doctor, 
           fill = ease)) + 
  geom_bar(position = "stack")
#Versi?n transpuesta:
ggplot(EPIDURALF, 
       aes(x = ease, 
           fill = doctor)) + 
  geom_bar(position = "stack")

####3c####
cor(EPIDURALF$cm,EPIDURALF$kg,use="complete.obs")
#0.37

####4####

#Media:
mean(starwars$birth_year, na.rm=TRUE)

#Mediana:
median(starwars$birth_year, na.rm=TRUE)

#Cuartiles:
quantile(starwars$birth_year, probs=seq(0,1,0.25), na.rm=TRUE)

#Deciles:
quantile(starwars$birth_year, probs=seq(0,1,0.10), na.rm=TRUE)

#Percentiles:
quantile(starwars$birth_year, probs=seq(0,1,0.01), na.rm=TRUE)

#Desviaci?n est?ndar:
sd(starwars$birth_year, na.rm=TRUE)

#Varianza:
var(starwars$birth_year, na.rm=TRUE)

##Recuerde: la ra?z cuadrada de la varianza es la desviaci?n est?ndar
sqrt(var(starwars$birth_year, na.rm=TRUE))==sd(starwars$birth_year, na.rm=TRUE)

#Que la Fuerza los acompa?e
