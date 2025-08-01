
####Ayudant�a 3####
####Repaso y ejercicios####
####Viernes 22 de abril de 2022####
####Ayudante Santiago Ort�zar####
####Estad�stica descriptiva-R, FEN-UAH####
####Prof. Alejandro Gonz�lez####


####Siempre limpiar el environment####
rm(list=ls())


####Buscar el directorio desde el que abrimos el script####
getwd()


####Fijar el directorio en el que queremos trabajar####
#setwd()


####Librer�as####
#install.packages("dplyr")
library(dplyr)

####Base de datos####
data(starwars)

####Reducir dataframe####
#Tome el dataframe, pero s�lo conserve informaci�n para los siguientes personajes:
#C-3PO; Chewbacca; Darth Vader; 
#Jabba Desilijic Tiure; Luke Skywalker
#Obi-Wan Kenobi; R2-D2; Yoda
#Los personajes est�n identificados en la variable "name".
#Jabba Desilijic Tiure es el nombre completo de Jabba The Hutt.
#Llame al dataframe "starwars1"

starwars1 <- starwars[starwars$name=="C-3PO"|
                        starwars$name=="Chewbacca"|
                        starwars$name=="Darth Vader"|
                        starwars$name=="Jabba Desilijic Tiure"|
                        starwars$name=="Luke Skywalker"|
                        starwars$name=="Obi-Wan Kenobi"|
                        starwars$name=="R2-D2"|
                        starwars$name=="Yoda", ]

#Cree un nuevo dataframe donde los personajes est�n ordenados
#de acuerdo a su altura, en forma descendente. Llame al dataframe "starwars2"

starwars2 <- starwars1[order(starwars1$height,decreasing = TRUE), ] 

#Elimine los dataframes starwars y starwars1 de su environment
rm(starwars)
rm(starwars1)

#La variable "height" (altura) est� en cent�metros. Cree un nuevo dataframe, starwars3,
#donde s�lo est�n los personajes que miden m�s de 2 metros

#Opci�n 1
starwars3 <- starwars2[starwars2$height>199, ]

#Opci�n 2
starwars3 <- starwars2[starwars2$height>=200, ]

#Opci�n 3
starwars3 <- starwars2[1:2, ]

#Cree un dataframe donde se conserven todos los personajes de starwars2,
#pero s�lo las siguientes variables:
#name, height, mass, birth_year, sex, homeworld
#Llame al dataframe starwars 4

starwars4 <- starwars2[ , c("name","height","mass","birth_year",
                            "sex", "homeworld")]

#Elimine el dataframe starwars2

rm(starwars2)

#Utilizando el dataframe starwars4...

#�Cu�l es la edad de Yoda? Cree un dataframe que contenga s�lo 
#el nombre y edad de Yoda y el planeta en que naci� (homeworld). Llame "yoda" al dataframe.

yoda <- starwars4[starwars4$name=="Yoda" , c("name","birth_year", "homeworld")]

#ESO ES UN CASO PERDIDO

#�Cu�nto mide Darth Vader? Cree un dataframe que contenga s�lo
#el nombre y la altura de Darth Vader. Llame "vader" al dataframe

vader <- starwars4[starwars4$name=="Darth Vader", c("name", "height")]

#Cu�l es el sexo, la edad y el peso de Jabba Desilijic Tiure (m�s conocido como
#Jabba the Hutt)? Cree un dataframe que contenga s�lo el nombre, el sexo y el peso
#de Jabba, en un dataframe llamado jabba.

jabba <- starwars4[starwars4$name=="Jabba Desilijic Tiure", c("name", "sex", "birth_year", "mass")]

#A partir del dataframe starwars4, cree un nuevo dataframe que s�lo tenga la informaci�n
#sobre los personajes que nacieron en el planeta Tatooine. Llame a
#este dataframe "tatooine".

tatooine <- starwars4[starwars4$homeworld=="Tatooine", ]

#�Cu�l es la diferencia de edad entre Obi-Wan Kenobi y Darth Vader?
#Para esto, almacene la edad de Obi-Wan Kenobi y Darth Vader como objetos,
#llamados edad_obiwan y edad_vader
#Luego, reste ambos objetos utilizando el comando que usted prefiera

edad_obiwan <- starwars4$birth_year[starwars4$name=="Obi-Wan Kenobi"]
edad_vader <- starwars4$birth_year[starwars4$name=="Darth Vader"]
edad_obiwan-edad_vader


####Siempre limpiar el environment####
rm(list=ls())


####Buscar el directorio desde el que abrimos el script####
getwd()


####Fijar el directorio en el que queremos trabajar####
setwd("D:/SANTIAGO/OneDrive/Documentos/2022 Ayudant�a UAH A. Gonz�lez Estad�stica R")

data(swiss)
View(swiss)

#Usando el comando help(swiss), describa con sus palabras en qu� consiste
#el data frame swiss: de d�nde proviene la informaci�n, qu� significa cada variable,
#cu�ntas observaciones tiene, c�mo est� medida cada variable, etc.

#Grafique el histograma para la variable Fertility, utilizando breaks=10.

hist(swiss$Fertility, breaks=10)

#Indique la media, la mediana y la moda de Fertility. Para la moda, 
#puede utilizar una funci�n obtenida de una librer�a de R o 
#usar el c�digo entregado en clases.
mean(swiss$Fertility) #70,1
median(swiss$Fertility) #70,4
#install.packages("DescTools")
library(DescTools)
Mode(swiss$Fertility) #65

#Calcule el rango de Fertility
range(swiss$Fertility)
#�Qu� indica el rango?

#Divida la distribuci�n en cuartiles.

quantile(swiss$Fertility, probs = c(0.25, 0.50, 0.75, 1.0))

quantile(swiss$Fertility, probs = seq(from = 0.25, to = 1.0, by = 0.25))

library(Hmisc)
Hmisc::describe(swiss$Fertility)

#Describa lo que observa en el histograma.
####Distribuci�n que en algunos aspectos se asemeja a la normal, pero
####Tiene un sesgo a la izquierda 
####El grueso de la masa de datos se concentra en entre 70 y 80.
####Esto �ltimo lo podemos ver tanto en el histograma como en los cuartiles.

#Grafique el histograma con 5 breaks, 10 breaks y 25 breaks
hist(swiss$Fertility, breaks=5)
hist(swiss$Fertility, breaks=10)
hist(swiss$Fertility, breaks=25)

#Ahora grafique el density plot sin histograma
plot(density(swiss$Fertility))

#Ahora agregue la curva de densidad a los tres histogramas de antes
#Recuerde que ahora al c�digo del histograma debe agregar el comando 
#freq=FALSE

hist(swiss$Fertility, breaks=5, freq=FALSE)
lines(density(swiss$Fertility), col="red", lwd=2)

hist(swiss$Fertility, breaks=10, freq=FALSE)
lines(density(swiss$Fertility), col="red", lwd=2)

hist(swiss$Fertility, breaks=25, freq=FALSE)
lines(density(swiss$Fertility), col="red", lwd=2)

#Para la variable education, grafique el histograma (con curva de densidad),
#utilizando 8 breaks

hist(swiss$Education, breaks=8, freq=FALSE)
lines(density(swiss$Education), col="red", lwd=2)

#Utilizando el rango, la media, la mediana, la moda, cuartiles y/o deciles, y cualquier otro
#estad�stico que usted considere pertinente,
#adem�s del histograma del ejercicio anterior
#�qu� dir�a usted sobre la distribuci�n de educaci�n
#en las regiones francesas?

#Repita el ejercicio anterior para la variable Catholic.
#Grafique el histograma con breaks=14

hist(swiss$Catholic, breaks=14, freq=FALSE)
lines(density(swiss$Catholic), col="red", lwd=2)
