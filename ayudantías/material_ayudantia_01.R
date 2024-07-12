
####Ayudantía 1####
####Manipulación de objetos en R####
####Viernes 1 de abril de 2022####
####Ayudante Santiago Ortúzar####
####Estadística descriptiva-R, FEN-UAH####
####Prof. Alejandro González####




####Usando la función de comentarios

55+45 #"55+45" es código de R, pero esto no

#Esta función es útil para comentar nuestro código

#Ayuda a quien lo lea a entenderlo mejor 
#(muchas veces nosotros mismos)




####Creando objetos en R

objeto1 <- 1

objeto2 <- 1 + 1

objeto3 <- 2-1




####"Llamando" los objetos que creamos

objeto1

objeto2

objeto3




####Objetos que contienen texto (valores alfabéticos)

objeto4 <- "texto"

objeto4

objeto5 <- "abcd"

objeto5




####Los vectores
vector1 <- c(1, 2, 3, 4, 5)

vector1

vector2 <- c("a", "b", "c", "d", "e")

vector2




####Sumando vectores
vector3 <- c(6, 7, 8, 9, 10)

vector3

vector1 + vector3




####Almacenando la suma de vectores... en un nuevo vector
vector1 + vector3

vector4 <- vector1 + vector3

vector4




####No podemos sumar caracteres y números
#vector1 + vector2




####Viendo a qué clase pertenece cada vector
class(vector1)

class(vector2)




####Los números pueden ser interpretados como caracteres
vector5 <- c("1", "2", "3", "4", "5")

vector5

class(vector5)

str(vector5)




####La función str() ("structure")
str(vector5)




####Ejercicio
#Cree un vector que contenga los valores 
#5, 8, 3, 2 y 10, en ese orden. 
#Llame al vector "ejercicio".
#Luego, realice las siguientes operaciones con el vector:
#- Sume 9 a "ejercicio".
#- Multiplique "ejercicio" por 2.
#- Multiplique "ejercicio" por 5/7.
#- Eleve "ejercicio" al cuadrado.




####Las matrices en R
matriz1 <- matrix(1:25,nrow=5,ncol=5)

matriz1




####Suma de matrices
matriz1+matriz1




####Filas y columnas de las matrices
matriz1[4,5]

matriz1




####Data frames: una base de datos sobre consumo cultural

####¿En qué directorio estamos trabajando?
getwd() #para BUSCAR el directorio

setwd() #para FIJAR el directorio

load("BBDD/cc1.Rdata")




####Examinando nuestro dataframe
head(cc1a)

tail(cc1a)

str(cc1a)

dim(cc1a)




####Examinando variables con categorías (dicotómicas y categóricas)
####Frecuencias:
table(cc1a$SEL_Sexo)

table(cc1a$libros_dummy)




####Proporciones:
prop.table(table(cc1a$SEL_Sexo))

prop.table(table(cc1a$libros_dummy))




####¿Qué tan seguido lees? (conteo de frecuencias)
table(cc1a$libros_frecuencia)




####¿Qué tan seguido lees? (proporciones)
prop.table(table(cc1a$libros_frecuencia))




####Como los porcentajes aparecen como decimales...
100*prop.table(table(cc1a$libros_frecuencia))

round(100*prop.table(table(cc1a$libros_frecuencia)),1)




####Examinando variables numéricas
mean(cc1a$libros_numero)

median(cc1a$libros_numero)




####Filas y columnas en el dataframe
cc1a[100,"libros_frecuencia"]

cc1a[150,c("libros_dummy","libros_numero","libros_frecuencia")]

cc1a[251,c("libros_dummy","libros_numero","libros_frecuencia")]




####Descriptivos bivariados: medias de libros
####según nivel educativo####
tapply(cc1a$libros_numero, cc1a$SEL_NEduc, mean)
#media de libros leídos por año según nivel educativo

####según sexo####
tapply(cc1a$libros_numero, cc1a$SEL_Sexo, mean)
#media de libros leídos por año según sexo




####Descriptivos bivariados: tablas de contingencia####
table(cc1a$libros_frecuencia,cc1a$SEL_NEduc)
#frecuencia de lectura según nivel educativo

#guardemos esto como objeto para mayor simplicidad:
lectura_NEduc <- table(cc1a$libros_frecuencia,cc1a$SEL_NEduc)

#lo mismo de otra manera:
xtabs(~libros_frecuencia+SEL_NEduc, data=cc1a)

#proporciones
round(100*prop.table(lectura_NEduc),2)




####Tablas de contingencia: porcentaje de columna####
round(100*prop.table(lectura_NEduc, margin=2),2)
#el porcentaje de columna se especifica con margin=2

####porcentaje de fila####
round(100*prop.table(lectura_NEduc, margin=1),2)
