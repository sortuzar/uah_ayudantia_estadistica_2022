
####Ayudantía 7####
####Visualización####
####Viernes 27 de mayo de 2022####
####Ayudante Santiago Ortúzar####
####Estadística descriptiva-R, FEN-UAH####
####Prof. Alejandro González####

####Ayudantías que nos quedan:

########Ayudantía 8: Viernes 3 de junio (cápsula).

########MÁS: Ayudantías particulares que agendemos



####Siempre limpiar el environment####
rm(list=ls())
####Buscar el directorio desde el que abrimos el script####
getwd()
####Fijar el directorio en el que queremos trabajar####
#setwd("D:/SANTIAGO/OneDrive/Documentos/2022 Ayudantía UAH A. González Estadística R")
setwd("D:/SANTIAGO/Gráficos Ayudantía 6")
####Desactivar notación científica####
options(scipen=999)


####1: Librerías####
#install.packages("PASWR2")
library(PASWR2)
#install.packages("ggplot2")
library(ggplot2)

####2: Datos####
data(NC2010DMG)

####3: Depuración de los datos####
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

####4####
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

####5####
#Ejemplo correlación:
cor(voto$medage, voto$obama08, use="complete.obs")

datos <- c(cor(voto$pop2010, voto$obama08, use="complete.obs"),
           cor(voto$medage, voto$obama08, use="complete.obs"),
           cor(voto$pctrural, voto$obama08, use="complete.obs"),
           cor(voto$medinc, voto$obama08, use="complete.obs"),
           cor(voto$evanrate, voto$obama08, use="complete.obs"))

datos1 <- round(datos, digits=2)

nombres <- c("Correlación entre población y % votación por Obama",
             "Correlación entre edad mediana y % votación por Obama",
             "Correlación entre % de habitantes rurales y % votación por Obama",
             "Correlación entre ingreso mediano y % votación por Obama",
             "Correlación entre tasa de evangélicos y % votación por Obama")

correlaciones <- rbind(nombres, datos1)

correlaciones

####6####
#En plot:
plot(voto$medage, voto$obama08)

plot(voto$medage, voto$obama08,
     ylim=c(0,100),
     xlim=c(25,50),
     xlab="Edad mediana de la población del condado",
     ylab="% de votación por Obama",
     main="% de votación por Obama según edad mediana de la población")

####7####
#En ggplot:
ggplot(voto, aes(x=medage, y=obama08)) +
  geom_point()

ggplot(voto, aes(x=medage, y=obama08)) +
  geom_point() +
  ylim(0,100) +
  xlim(25,50) +
  labs(x="Edad mediana de la población del condado",
       y="% de votación por Obama",
       title="% de votación por Obama según edad mediana de la población")

####8####
#Guardar gráfico completo en un objeto
grafico.edad <- ggplot(voto, aes(x=medage, y=obama08)) +
  geom_point() +
  ylim(0,100) +
  xlim(25,50) +
  labs(x="Edad mediana de la población del condado",
       y="% de votación por Obama",
       title="% de votación por Obama según edad mediana de la población")

#Guardar por "capas" en distintos objetos
edad1 <- ggplot(voto, aes(x=medage, y=obama08))

edad2 <- edad1 + geom_point()

edad3 <- edad2 + ylim(0,100) + xlim(25,50) #sumar más de una condición por objeto

edad4 <- edad3 + labs(x="Edad mediana de la población del condado",
                      y="% de votación por Obama",
                      title="% de votación por Obama según edad mediana de la población")

####9####
####9.a####
grafico.poblacion <- ggplot(voto, aes(x=pop2010, y=obama08)) +
  geom_point() +
  ylim(0,100) +
  xlim(3000,1000000) + #ajustar eje X según escala de la variable (usar range(voto$pop2010))
  labs(x="Número de habitantes del condado",
       y="% de votación por Obama",
       title="% de votación por Obama según población del condado")

####9.b####
grafico.rural <- ggplot(voto, aes(x=pctrural, y=obama08)) +
  geom_point() +
  ylim(0,100) +
  xlim(0,100) + #ajustar eje X según escala de la variable
  labs(x="Porcentaje de personas que viven en zonas rurales por condado",
       y="% de votación por Obama",
       title="% de votación por Obama según población rural del condado")

####9.c####
grafico.ingreso <- ggplot(voto, aes(x=medinc, y=obama08)) +
  geom_point() +
  ylim(0,100) +
  xlim(25000,65000) + #ajustar eje X según escala de la variable
  labs(x="Ingreso mediano de los hogares del condado",
       y="% de votación por Obama",
       title="% de votación por Obama según ingresos del hogar en Carolina del Norte")

####9.d####
grafico.evangelicos <- ggplot(voto, aes(x=evanrate, y=obama08)) +
  geom_point() +
  ylim(0,100) +
  xlim(55,800) + #ajustar eje X según escala de la variable
  labs(x="Tasa de evangélicos cada 100.000 habitantes por condado",
       y="% de votación por Obama",
       title="% de votación por Obama según religiosidad del condado")

####10####
#install.packages("gridExtra")
library(gridExtra)

grid.arrange(grafico.rural, grafico.ingreso, grafico.evangelicos,
             nrow=1,
             ncol=3)

grid.arrange(grafico.rural, grafico.ingreso, grafico.evangelicos,
             nrow=3,
             ncol=1)

####11####
grafico.rural1 <- grafico.rural + geom_smooth(method="lm", se=FALSE)
grafico.ingreso1 <- grafico.ingreso + geom_smooth(method="lm", se=FALSE)
grafico.evangelicos1 <- grafico.evangelicos + geom_smooth(method="lm", se=FALSE)

grid.arrange(grafico.rural1, grafico.ingreso1, grafico.evangelicos1,
             nrow=3,
             ncol=1)

####12####
graficos.obama <- grid.arrange(grafico.rural1, grafico.ingreso1, grafico.evangelicos1,
                               nrow=3,
                               ncol=1)

ggsave("graficos.jpg", graficos.obama)

ggsave("graficos1.jpg", graficos.obama,
       width=6,
       height=9)

