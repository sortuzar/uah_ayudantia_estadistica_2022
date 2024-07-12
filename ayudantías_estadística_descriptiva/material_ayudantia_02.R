
####Ayudantía 2####
####Tipos de variables en R y repaso de visualización de datos####
####Viernes 8 de abril de 2022####
####Ayudante Santiago Ortúzar####
####Estadística descriptiva-R, FEN-UAH####
####Prof. Alejandro González####


####Siempre limpiar el environment####
rm(list=ls())


####Buscar el directorio desde el que abrimos el script####
getwd()


####Fijar el directorio en el que queremos trabajar####
#setwd()


####Diapositivas 13-17####
#Para un vector creado manualmente por nosotros
vector1 <- c(1, 2, 3)
vector2 <- c("a", "b", "c")

class(vector1)
class(vector2)


#Para un vector dentro de una base de datos
#Usaremos la base de datos 
#"ToothGrowth" 
#disponible en R base

data(ToothGrowth) #carga la base 
#(ahora está en nuestro environment)

help(ToothGrowth) 
#para ver información de la base


str(ToothGrowth) #3 variables

class(ToothGrowth$len) #largo de los dientes 
#de los conejillos de indias

#Ahora ejemplos con la base "BABERUTH" del paquete "PASWR2"
#install.packages("PASWR2")
#deben instalar el paquete si no lo han hecho

library(PASWR2)
data(BABERUTH) #carga los datos a nuestro environment

class(BABERUTH$team) #el equipo se trabaja como factor, aunque
#en teoría sea una variable nominal

levels(BABERUTH$team) #ver las categorías de un factor


####Diapositivas 19-28####
#Borramos objetos del environment
rm(list=ls())

#Dado que borramos todo del environment,
#es necesario fijar nuevamente el directorio.
#Por eso, es recomendable usar "rm(list=ls())"
#siempre al inicio de sesión, pero sólo una vez por script.

#Buscamos nuestro propio directorio
getwd()

#Fijamos nuestro directorio
#setwd()

load("cc2.Rdata")
#o la dirección de la carpeta donde hayan guardado esta base de datos

#Variables a revisar:
class(cc2$libros_numero) #debería ser un vector numérico, 
#pero es un carácter

class(cc2$SEL_NEduc) #debería ser un factor, 
#pero es numérico

class(cc2$libros_frecuencia) #debería ser un factor, 
#pero es numérico


#Conversión de vectores alfabéticos a numéricos
cc2$libros_numero <- as.numeric(cc2$libros_numero)

class(cc2$libros_numero)


#Conversión de vectores numéricos a factores
cc2$SEL_NEduc <- factor(cc2$SEL_NEduc,
                        levels = c(1,2,3),
                        labels = c("Primaria",
                                   "Secundaria",
                                   "Superior"))
#Recordar que una cosa son los "niveles" que fijamos ("levels")
#y otra cosa distinta son las "etiquetas" ("labels")

cc2$libros_frecuencia <- factor(cc2$libros_frecuencia,
                                levels = c(1,2,3, 4),
                                labels = c("Todos o casi todos los días",
                                           "1 día por semana - 1 día al mes",
                                           "Menos de una vez al mes",
                                           "Menos de una vez al año"))

#Ahora revisamos cada variable
class(cc2$SEL_NEduc)

class(cc2$libros_frecuencia)

table(cc2$SEL_NEduc) #también sirve "levels"

table(cc2$libros_frecuencia)


#De vectores numéricos a alfabéticos
cc2$libros_numero <- as.character(cc2$libros_numero)

class(cc2$libros_numero)

cc2$libros_numero <- as.numeric(cc2$libros_numero) #lo corregimos nuevamente

class(cc2$libros_numero)


####Diapositivas 32-41####
#Borramos objetos del environment
rm(list=ls())

#Buscamos nuestro propio directorio
getwd()

#Fijamos nuestro directorio
#setwd()

#Librería y base de datos
library(PASWR2)
data(BABERUTH) #los mismos que usamos en la clase 2

#Subconjunto de datos que vamos a usar:
x <- BABERUTH$hr[7:21]

#Histograma 1: usando configuración de "Sturges" para el ancho de columna
hist(x, breaks = "Sturges", main = "Sturges", 
     xlab = "HR", 
     col = "blue")

#Histograma 2: usando #FD" para el ancho de columna
hist(x, breaks = "FD", main = "FD", 
     xlab = "HR", 
     col = "red")

#Histograma 3: usando "Scott" para el ancho de columna
#breaks = "Scott"
hist(x, breaks = "Scott", main = "Scott", 
     xlab = "HR", 
     col = "yellow")


#Histogramas 4-7: cuando el ancho de columnna genera confusión
#install.packages("MASS") 
#en caso de que no lo hayamos instalado

library(MASS)

data(geyser) #la base "geyser" es de la librería "MASS"

with(data = geyser, hist(duration, breaks=3, #ancho de columna
                         freq = FALSE, 
                         ylim = c(0, 1), 
                         col = "pink")) 

with(data = geyser, hist(duration, breaks=6, #ancho de columna
                         freq = FALSE, 
                         ylim = c(0, 1), 
                         col = "pink")) 

with(data = geyser, hist(duration, breaks=12, #ancho de columna 
                         freq = FALSE, 
                         ylim = c(0, 1), 
                         col = "pink"))

with(data = geyser, hist(duration, breaks=24, #ancho de columna 
                         freq = FALSE, 
                         ylim = c(0, 1), 
                         col = "pink")) 

#Histogramas 8-11: aplicando una curva de densidad encima
with(data = geyser, hist(duration, breaks=3, #ancho de columna
                         freq = FALSE, ylim = c(0, 1), 
                         col = "pink")) 
with(data = geyser, lines(density(duration), col="red", 
                          lwd=2))

with(data = geyser, hist(duration, breaks=6, #ancho de columna
                         freq = FALSE, ylim = c(0, 1), 
                         col = "pink")) 
with(data = geyser, lines(density(duration), col="red", 
                          lwd=2))

with(data = geyser, hist(duration, breaks=12, #ancho de columna 
                         freq = FALSE, ylim = c(0, 1), 
                         col = "pink"))
with(data = geyser, lines(density(duration), col="red", 
                          lwd=2))

with(data = geyser, hist(duration, breaks=24, #ancho de columna 
                         freq = FALSE, ylim = c(0, 1), 
                         col = "pink")) 
with(data = geyser, lines(density(duration), col="red", 
                          lwd=2))


#Histograma 12: gráfico de densidad sin usar histograma
with(data = geyser, 
     plot(density(duration), 
          col="red", lwd=2, main="Densidad de 'duration'"))
