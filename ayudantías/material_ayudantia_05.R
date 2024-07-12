
####Ayudantía 5####
####Repaso y ejercicios####
####Viernes 13 de mayo de 2022####
####Ayudante Santiago Ortúzar####
####Estadística descriptiva-R, FEN-UAH####
####Prof. Alejandro González####

####Ayudantías que nos quedan:

########Ayudantía 6: Viernes 20 de mayo (cápsula).

########Ayudantía 7: Viernes 27 de mayo, 19.00-20.20 (sincrónica).****

########Ayudantía 8: Viernes 3 de junio (cápsula).

########MÁS: Ayudantías particulares que agendemos



####Siempre limpiar el environment####
rm(list=ls())
####Buscar el directorio desde el que abrimos el script####
getwd()
####Fijar el directorio en el que queremos trabajar####
setwd("D:/SANTIAGO/OneDrive/Documentos/2022 Ayudantía UAH A. González Estadística R")

#Datos
data(swiss)

####1####
ayudantia5 <- swiss[ , c("Fertility", "Examination", 
                         "Education", "Catholic")]

####2####
rm(swiss)

####2####
#Primer paso: crear una columna "vacía" (todas las filas = 0)
ayudantia5$religion <- rep(0,nrow(ayudantia5))

#Segundo paso: 
ayudantia5$religion[ayudantia5$Catholic<20] <- 1
ayudantia5$religion[ayudantia5$Catholic>=20&ayudantia5$Catholic<=80] <- 2
ayudantia5$religion[ayudantia5$Catholic>80] <- 3

#Tercer paso: factor
ayudantia5$religion <- factor(ayudantia5$religion, 
                              levels=c(1,2,3),
                              labels=c("Provincia protestante",
                                       "Provincia integrada",
                                       "Provincia católica"))

####3####
#¿Cuántas provincias hay de cada tipo? Tabla de frecuencias y de proporciones
table(ayudantia5$religion)

prop.table(table(ayudantia5$religion))
100*prop.table(table(ayudantia5$religion)) #de proporciones a porcentajes
round(100*prop.table(table(ayudantia5$religion)), digits=1) #redondear porcentaje

####4####
#Courtelary, fila 1:
(15+12)/2
(ayudantia5$Examination[1]+ayudantia5$Education[1])/2

#Delemont, fila 2:
(6+9)/2
(ayudantia5$Examination[2]+ayudantia5$Education[2])/2

#Para todas las filas
#Primer paso: crear una columna "vacía" (todas las filas = 0)
ayudantia5$nivel.educativo <- rep(0,nrow(ayudantia5))

ayudantia5$nivel.educativo <- (ayudantia5$Examination+ayudantia5$Education)/2

####5####
ayudantia5.reducido <- ayudantia5[ , c("Fertility", "nivel.educativo",
                                       "religion")]

####6####
rm(ayudantia5)

####7####
mean(ayudantia5.reducido$Fertility)
tapply(ayudantia5.reducido$Fertility,
       ayudantia5.reducido$religion,
       mean)

mean(ayudantia5.reducido$nivel.educativo)
tapply(ayudantia5.reducido$nivel.educativo,
       ayudantia5.reducido$religion,
       mean)

####8A: Fertilidad####
#boxplot para cada grupo
#mediana para cada grupo

boxplot(ayudantia5.reducido$Fertility ~ 
          ayudantia5.reducido$religion)

tapply(ayudantia5.reducido$Fertility, 
       ayudantia5.reducido$religion,
       median)

####8B: Nivel educativo####
boxplot(ayudantia5.reducido$nivel.educativo ~ 
          ayudantia5.reducido$religion)

tapply(ayudantia5.reducido$Fertility, 
       ayudantia5.reducido$religion,
       median)

