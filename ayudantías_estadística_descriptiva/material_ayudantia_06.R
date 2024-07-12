
####Ayudantía 6####
####Repaso y ejercicios####
####Viernes 20 de mayo de 2022####
####Ayudante Santiago Ortúzar####
####Estadística descriptiva-R, FEN-UAH####
####Prof. Alejandro González####

####Ayudantías que nos quedan:

########Ayudantía 7: Viernes 27 de mayo, 19.00-20.20 (sincrónica).****

########Ayudantía 8: Viernes 3 de junio (cápsula).

########MÁS: Ayudantías particulares que agendemos



####Siempre limpiar el environment####
rm(list=ls())
####Buscar el directorio desde el que abrimos el script####
getwd()
####Fijar el directorio en el que queremos trabajar####
setwd("D:/SANTIAGO/Gráficos Ayudantía 6")
####Desactivar notación científica####
options(scipen=999)


####1: Librerías####
#install.packages("PASWR2")
library(PASWR2)

####2: Datos####
data(NC2010DMG)

####3: Depuración de los datos####
help("NC2010DMG")

####3.a####
variables <- c("countyName",
               "pop2010",
               "medage", 
               "pctrural", 
               "medinc", 
               "evanrate", 
               "turnout", 
               "obama08", 
               "mccain08")

#Podemos ver qué contiene este vector alfabético
variables

####3.b####
voto <- NC2010DMG[ , variables]

####3.c####
rm(NC2010DMG)

####4: Reportar información básica de los datos####
####4.a####
dim(voto)

####4.b####
help("NC2010DMG")
#North Carolina county demographics for 2010 
#and county voter information 
#for the North Carolina Amendment 1 ballot initiative 
#which took place May 8, 2012, are stored in the data frame NC2010DMG.

#"countyName": #(Name of North Carolina county)
#"pop2010": #(Total population of the county in 2010)
#"medage": #(Median age of the county in 2010)
#"pctrural": #(The percent of the population that lived in a rural area of the county in 2010)
#"medinc": #(The median household income adjusted for inflation in 2010)
#"evanrate": #(Evangelical rates of adherence per 1,000 population in 2010)
#"turnout": #(The percent of registered voters who voted May 8, 2012)
#"obama08": #(The percent of voters who voted for Barrack Obama in the 2008 presidential election)
#"mccain08": #(The percent of voters who voted for John McCain in the 2008 presidential election)

#Es decir, cada fila (observación) es un condado de Carolina del Norte
#en Estados Unidos.
#Tenemos información sociodemográfica (población, edad, 
#áreas rurales, ingreso de los hogares, religiosidad)
#y de comportamiento electoral.

####4.c####
str(voto)

####4.d#### 
#Para las variables numéricas, reporte:
#4.c.i: La media (el "promedio").
#4.c.ii: La mediana.
#4.c.iii: El rango (el valor mínimo y el valor máximo).
#4.c.iv: La desviación estándar.
#MUY IMPORTANTE: No confundir estos estadísticos entre sí.
#Si todavía tiene dudas al respecto, por favor avísele 
#al profesor o al ayudante.

#Recomendación: pruebe el comando "view_df()" de la librería "sjPlot"
#install.packages("sjPlot")
library(sjPlot)
view_df(voto)
#Con frecuencias:
view_df(voto, show.frq = T)
#Con porcentajes:
view_df(voto, show.prc = T)
#Con casos perdidos:
view_df(voto, show.na = T)

####5: Configure su visor de gráficos####
####5.a####
origpar <- par(no.readonly = TRUE)   

####5.b####
par(mfrow=c(3, 2))

####5.c####
par(origpar)

####6: Histogramas para: población, edad mediana, porcentaje rural, ingreso mediano, tasa religiosidad####
par(mfrow=c(3, 2))

hist(voto$pop2010, 
     breaks = "Sturges", 
     main = "Población de los condados de NC", 
     xlab = "Habitantes", 
     ylab = "Recuento de frecuencias", 
     col = "blue")

hist(voto$medage, 
     breaks = "Sturges", 
     main = "Edad mediana de los condados de NC", 
     xlab = "Edad (años)", 
     ylab = "Recuento de frecuencias", 
     col = "blue")

hist(voto$pctrural, 
     breaks = "Sturges", 
     main = "Porcentaje de habitantes en zonas rurales por condado de NC", 
     xlab = "Porcentaje de habitantes en zonas rurales", 
     ylab = "Recuento de frecuencias", 
     col = "blue",
     xlim=c(0,100)) #es un porcentaje

hist(voto$medinc, 
     breaks = "Sturges", 
     main = "Ingreso mediano de los hogares en cada condado de NC", 
     xlab = "Ingreso mediano de los hogares", 
     ylab = "Recuento de frecuencias", 
     col = "blue")

hist(voto$evanrate, 
     breaks = "Sturges", 
     main = "Tasa de religiosidad cada 100.000 habitantes en los condados de NC", 
     xlab = "Tasa de religiosidad", 
     ylab = "Recuento de frecuencias", 
     col = "blue")

#Restauramos la configuración original
par(origpar)

####7: Cree los MISMOS histogramas del ejemplo anterior, pero usando distintos comandos####
####7.a: "with()"####
par(mfrow=c(3, 2))

with(data = voto, hist(pop2010, 
                       breaks = "Sturges", 
                       main = "Población de los condados de NC", 
                       xlab = "Habitantes", 
                       ylab = "Recuento de frecuencias", 
                       col = "red"))

with(data = voto, hist(medage, 
                       breaks = "Sturges", 
                       main = "Edad mediana de los condados de NC", 
                       xlab = "Edad (años)", 
                       ylab = "Recuento de frecuencias", 
                       col = "red"))

with(data = voto, hist(pctrural, 
                       breaks = "Sturges", 
                       main = "Porcentaje de habitantes en zonas rurales por condado de NC", 
                       xlab = "Porcentaje de habitantes en zonas rurales", 
                       ylab = "Recuento de frecuencias", 
                       col = "red",
                       xlim=c(0,100))) #es un porcentaje

with(data = voto, hist(medinc, 
                       breaks = "Sturges", 
                       main = "Ingreso mediano de los hogares en cada condado de NC", 
                       xlab = "Ingreso mediano de los hogares", 
                       ylab = "Recuento de frecuencias", 
                       col = "red"))

with(data = voto, hist(evanrate, 
                       breaks = "Sturges", 
                       main = "Tasa de religiosidad cada 100.000 habitantes en los condados de NC", 
                       xlab = "Tasa de religiosidad", 
                       ylab = "Recuento de frecuencias", 
                       col = "red"))

#Restauramos la configuración original
par(origpar)

####7.b: "attach()" y "detach()"####

par(mfrow=c(3, 2))

attach(voto) #fijamos una BBDD

hist(pop2010, 
     breaks = "Sturges", 
     main = "Población de los condados de NC", 
     xlab = "Habitantes", 
     ylab = "Recuento de frecuencias", 
     col = "pink")

hist(medage, 
     breaks = "Sturges",
     main = "Edad mediana de los condados de NC",
     xlab = "Edad (años)",
     ylab = "Recuento de frecuencias",
     col = "pink")

hist(pctrural, 
     breaks = "Sturges",
     main = "Porcentaje de habitantes en zonas rurales por condado de NC",
     xlab = "Porcentaje de habitantes en zonas rurales",
     ylab = "Recuento de frecuencias",
     col = "pink",
     xlim=c(0,100)) #es un porcentaje

hist(medinc,
     breaks = "Sturges",
     main = "Ingreso mediano de los hogares en cada condado de NC",
     xlab = "Ingreso mediano de los hogares",
     ylab = "Recuento de frecuencias",
     col = "pink")

hist(evanrate,
     breaks = "Sturges",
     main = "Tasa de religiosidad cada 100.000 habitantes en los condados de NC",
     xlab = "Tasa de religiosidad",
     ylab = "Recuento de frecuencias",
     col = "pink")

detach(voto) #quitamos la BBDD fijada

#Restauramos la configuración original
par(origpar)

####8: Histograma de porcentaje de habitantes en zonas rurales codificado de tres formas####

#Configuración de una fila y tres columnas:
par(mfrow=c(1, 3))

#Método "tradicional"
hist(voto$pctrural, 
     breaks = "Sturges", 
     main = "% habitantes en zonas rurales por condado de NC", 
     xlab = "Porcentaje de habitantes en zonas rurales", 
     ylab = "Proporción de casos", 
     col = "blue",
     xlim=c(0,100),
     freq=FALSE)
lines(density(voto$pctrural),
      col="red",
      lwd=2)

#Usando "with()"
with(data = voto, hist(pctrural, 
                       breaks = "Sturges", 
                       main = "% de habitantes en zonas rurales por condado de NC", 
                       xlab = "Porcentaje de habitantes en zonas rurales", 
                       ylab = "Recuento de frecuencias", 
                       col = "red",
                       xlim=c(0,100),
                       freq=FALSE))
with(data = voto, lines(density(pctrural),
                        col="blue",
                        lwd=2))

#Usando "attach()" y "detach()"
attach(voto) #fijamos una BBDD

hist(pctrural, 
     breaks = "Sturges",
     main = "% de habitantes en zonas rurales por condado de NC",
     xlab = "Porcentaje de habitantes en zonas rurales",
     ylab = "Recuento de frecuencias",
     col = "pink",
     xlim=c(0,100),
     freq=FALSE)

lines(density(pctrural),
      col="brown",
      lwd=2)

detach(voto) #quitamos la BBDD fijada

#Restauramos la configuración original
par(origpar)

####9: Guarde en PDF los archivos creados en los ejercicios 6, 7 y 8####

#Al código de cada ejercicio, se debe anteponer
#pdf("Nombre del archivo.pdf", width = 8, height = 12)

#y al final agregar
#dev.off()

####9.a: Gráficos del ejercicio 6####

pdf("materia_ayudantia_06_ejercicio 6.pdf", 
    width = 10, 
    height = 12)

par(mfrow=c(3, 2))

hist(voto$pop2010, 
     breaks = "Sturges", 
     main = "Población de los condados de NC", 
     xlab = "Habitantes", 
     ylab = "Recuento de frecuencias", 
     col = "blue")

hist(voto$medage, 
     breaks = "Sturges", 
     main = "Edad mediana de los condados de NC", 
     xlab = "Edad (años)", 
     ylab = "Recuento de frecuencias", 
     col = "blue")

hist(voto$pctrural, 
     breaks = "Sturges", 
     main = "Porcentaje de habitantes en zonas rurales por condado de NC", 
     xlab = "Porcentaje de habitantes en zonas rurales", 
     ylab = "Recuento de frecuencias", 
     col = "blue",
     xlim=c(0,100)) #es un porcentaje

hist(voto$medinc, 
     breaks = "Sturges", 
     main = "Ingreso mediano de los hogares en cada condado de NC", 
     xlab = "Ingreso mediano de los hogares", 
     ylab = "Recuento de frecuencias", 
     col = "blue")

hist(voto$evanrate, 
     breaks = "Sturges", 
     main = "Tasa de religiosidad cada 100.000 habitantes en los condados de NC", 
     xlab = "Tasa de religiosidad", 
     ylab = "Recuento de frecuencias", 
     col = "blue")

dev.off() #para indicarle a R que el PDF se cierra aquí

#Restauramos la configuración original
par(origpar)

####9.b: Gráficos del ejercicio 7.a####
pdf("materia_ayudantia_06_ejercicio 7a.pdf", 
    width = 10, 
    height = 12)

par(mfrow=c(3, 2))

with(data = voto, hist(pop2010, 
                       breaks = "Sturges", 
                       main = "Población de los condados de NC", 
                       xlab = "Habitantes", 
                       ylab = "Recuento de frecuencias", 
                       col = "red"))

with(data = voto, hist(medage, 
                       breaks = "Sturges", 
                       main = "Edad mediana de los condados de NC", 
                       xlab = "Edad (años)", 
                       ylab = "Recuento de frecuencias", 
                       col = "red"))

with(data = voto, hist(pctrural, 
                       breaks = "Sturges", 
                       main = "Porcentaje de habitantes en zonas rurales por condado de NC", 
                       xlab = "Porcentaje de habitantes en zonas rurales", 
                       ylab = "Recuento de frecuencias", 
                       col = "red",
                       xlim=c(0,100))) #es un porcentaje

with(data = voto, hist(medinc, 
                       breaks = "Sturges", 
                       main = "Ingreso mediano de los hogares en cada condado de NC", 
                       xlab = "Ingreso mediano de los hogares", 
                       ylab = "Recuento de frecuencias", 
                       col = "red"))

with(data = voto, hist(evanrate, 
                       breaks = "Sturges", 
                       main = "Tasa de religiosidad cada 100.000 habitantes en los condados de NC", 
                       xlab = "Tasa de religiosidad", 
                       ylab = "Recuento de frecuencias", 
                       col = "red"))

dev.off() #para indicarle a R que el PDF se cierra aquí

#Restauramos la configuración original
par(origpar)

####9.c: Gráficos del ejercicio 7.b####
pdf("materia_ayudantia_06_ejercicio 7b.pdf", 
    width = 10, 
    height = 12)

par(mfrow=c(3, 2))

attach(voto) #fijamos una BBDD

hist(pop2010, 
     breaks = "Sturges", 
     main = "Población de los condados de NC", 
     xlab = "Habitantes", 
     ylab = "Recuento de frecuencias", 
     col = "pink")

hist(medage, 
     breaks = "Sturges",
     main = "Edad mediana de los condados de NC",
     xlab = "Edad (años)",
     ylab = "Recuento de frecuencias",
     col = "pink")

hist(pctrural, 
     breaks = "Sturges",
     main = "Porcentaje de habitantes en zonas rurales por condado de NC",
     xlab = "Porcentaje de habitantes en zonas rurales",
     ylab = "Recuento de frecuencias",
     col = "pink",
     xlim=c(0,100)) #es un porcentaje

hist(medinc,
     breaks = "Sturges",
     main = "Ingreso mediano de los hogares en cada condado de NC",
     xlab = "Ingreso mediano de los hogares",
     ylab = "Recuento de frecuencias",
     col = "pink")

hist(evanrate,
     breaks = "Sturges",
     main = "Tasa de religiosidad cada 100.000 habitantes en los condados de NC",
     xlab = "Tasa de religiosidad",
     ylab = "Recuento de frecuencias",
     col = "pink")

detach(voto) #quitamos la BBDD fijada

dev.off() #para indicarle a R que el PDF se cierra aquí

#Restauramos la configuración original
par(origpar)

####9.d: Gráficos del ejercicio 8####
pdf("materia_ayudantia_06_ejercicio 8.pdf", 
    width = 12, 
    height = 10)

#Configuración de una fila y tres columnas:
par(mfrow=c(1, 3))

#Método "tradicional"
hist(voto$pctrural, 
     breaks = "Sturges", 
     main = "% habitantes en zonas rurales por condado de NC", 
     xlab = "Porcentaje de habitantes en zonas rurales", 
     ylab = "Proporción de casos", 
     col = "blue",
     xlim=c(0,100),
     freq=FALSE)
lines(density(voto$pctrural),
      col="red",
      lwd=2)

#Usando "with()"
with(data = voto, hist(pctrural, 
                       breaks = "Sturges", 
                       main = "% de habitantes en zonas rurales por condado de NC", 
                       xlab = "Porcentaje de habitantes en zonas rurales", 
                       ylab = "Recuento de frecuencias", 
                       col = "red",
                       xlim=c(0,100),
                       freq=FALSE))
with(data = voto, lines(density(pctrural),
                        col="blue",
                        lwd=2))

#Usando "attach()" y "detach()"
attach(voto) #fijamos una BBDD

hist(pctrural, 
     breaks = "Sturges",
     main = "% de habitantes en zonas rurales por condado de NC",
     xlab = "Porcentaje de habitantes en zonas rurales",
     ylab = "Recuento de frecuencias",
     col = "pink",
     xlim=c(0,100),
     freq=FALSE)

lines(density(pctrural),
      col="brown",
      lwd=2)

detach(voto) #quitamos la BBDD fijada

dev.off() #para indicarle a R que el PDF se cierra aquí

#Restauramos la configuración original
par(origpar)
