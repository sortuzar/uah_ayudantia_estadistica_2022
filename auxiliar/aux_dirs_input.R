
# Directorios OneDrive ---------------------------------------------------------
### OneDrive ###################################################################
carpeta_usuario <- paste0("C:/Users/",
                         tolower(Sys.info()['user']))

### OneDrive ###################################################################
carpeta_onedrive_casa <- paste0(carpeta_usuario,"/OneDrive")

### Carpeta con bases de datos (estadística descriptiva) ########################
carpeta_data_descriptiva <- paste0(carpeta_onedrive_casa,"/Documentos/2022 Ayudantía UAH Estadística Descriptiva R/BBDD")

###### BBDD Consumo Cultural ######
archivo_data_consumo_cultural <- paste0(carpeta_data_descriptiva,"/consumo.cultural.Rdata")

### Carpeta con bases de datos (estadística inferencial) #######################
carpeta_data_inferencia <- paste0(carpeta_onedrive_casa,"/Documentos/2022 Ayudantía UAH A. González Estadística Inferencial en R/BBDD")

