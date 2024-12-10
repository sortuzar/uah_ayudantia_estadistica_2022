
# Limpiar environment ----------------------------------------------------------
rm(list=ls())

# Cargar librerías -------------------------------------------------------------
library(rprojroot)

# Fijar directorios ------------------------------------------------------------
carpeta_proyecto <- rprojroot::find_rstudio_root_file()
carpeta_curso_descriptiva <- paste0(carpeta_proyecto,"/ayudantias_estadistica_descriptiva")
carpeta_img <- paste0(carpeta_curso_descriptiva,"/input/img")
carpeta_ayudantia01 <- paste0(carpeta_curso_descriptiva,"/ayudantia01")
source(paste0(carpeta_proyecto,"/auxiliar/aux_dirs_input.R"))

# Ayudantía 1 ------------------------------------------------------------------
### Cargar librerías ###########################################################
library(dplyr)
library(tidyr)
library(reshape)

### Crear base 'cc1.RData ######################################################
load(archivo_data_consumo_cultural)

cc <- as.data.frame(consumo.cultural[ ,c("folio",
                                         "SEL_Sexo","SEL_Edad",
                                         "SEL_NEduc",
                                         "m6_64", "m6_66", 
                                         "m6_67")])

set.seed(0325)

cc1 <- cc[sample(nrow(cc), size=400), ]

cc1$SEL_Sexo[cc1$SEL_Sexo == 1] <- "Hombre"
cc1$SEL_Sexo[cc1$SEL_Sexo == 2] <- "Mujer"

cc1$SEL_NEduc[cc1$SEL_NEduc == 1] <- 1 #"Preescolar"
cc1$SEL_NEduc[cc1$SEL_NEduc == 2] <- 1 #"Preescolar"
cc1$SEL_NEduc[cc1$SEL_NEduc == 3] <- 1 #"Primaria"
cc1$SEL_NEduc[cc1$SEL_NEduc == 4] <- 2 #"Secundaria"
cc1$SEL_NEduc[cc1$SEL_NEduc == 5] <- 2 #"Secundaria"
cc1$SEL_NEduc[cc1$SEL_NEduc == 6] <- 2 #"Secundaria"
cc1$SEL_NEduc[cc1$SEL_NEduc == 7] <- 2 #"Secundaria"
cc1$SEL_NEduc[cc1$SEL_NEduc == 8] <- 3 #"Superior"
cc1$SEL_NEduc[cc1$SEL_NEduc == 9] <- 3 #"Superior"
cc1$SEL_NEduc[cc1$SEL_NEduc == 10] <- 3 #"Superior"
cc1$SEL_NEduc[cc1$SEL_NEduc == 11] <- 3 #"Superior"
cc1$SEL_NEduc[cc1$SEL_NEduc == 12] <- NA
cc1$SEL_NEduc[cc1$SEL_NEduc == 99] <- NA

cc1 <- reshape::rename(cc1, c(m6_64 = "libros_dummy", 
                              m6_66 = "libros_numero", 
                              m6_67 = "libros_frecuencia"))

cc1$libros_dummy[cc1$libros_dummy==1] <- "Sí"
cc1$libros_dummy[cc1$libros_dummy==2] <- "No"
cc1$libros_dummy[cc1$libros_dummy==3] <- NA
cc1$libros_dummy <- as.character(cc1$libros_dummy)
cc1$libros_numero[cc1$libros_numero==99] <- NA

cc1$libros_frecuencia <- as.numeric(cc1$libros_frecuencia)
cc1$libros_frecuencia[cc1$libros_frecuencia==2] <- 1
cc1$libros_frecuencia[cc1$libros_frecuencia==3] <- 2
cc1$libros_frecuencia[cc1$libros_frecuencia==4] <- 2
cc1$libros_frecuencia[cc1$libros_frecuencia==5] <- 2
cc1$libros_frecuencia[cc1$libros_frecuencia==6] <- 3
cc1$libros_frecuencia[cc1$libros_frecuencia==7] <- 3
cc1$libros_frecuencia[cc1$libros_frecuencia==8] <- 3

cc1 <- cc1 %>% 
  dplyr::mutate(libros_numero=ifelse(libros_dummy=='No', replace_na(libros_numero, 0), libros_numero))

cc1 <- cc1 %>% 
  dplyr::mutate(libros_frecuencia=ifelse(libros_dummy=='No', replace_na(libros_frecuencia, 4), libros_frecuencia))

cc1$libros_frecuencia <- factor(cc1$libros_frecuencia,
                                levels = c(1,2,3, 4),
                                labels = c("Todos o casi todos los días",
                                           "1 día por semana - 1 día al mes",
                                           "Menos de una vez al mes",
                                           "Menos de una vez al año"))

cc1$SEL_NEduc <- factor(cc1$SEL_NEduc,
                        levels = c(1,2,3),
                        labels = c("Primaria",
                                   "Secundaria",
                                   "Superior"))

cc1a <- na.omit(cc1)

save(cc1a, file = paste0(carpeta_ayudantia01,"/cc1.RData"))

rm(consumo.cultural)
rm(cc)
rm(cc1)
rm(cc1a)
