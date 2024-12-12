
# Directorios OneDrive ---------------------------------------------------------
### OneDrive ###################################################################
carpeta_usuario <- paste0("C:/Users/",
                         tolower(Sys.info()['user']))

### OneDrive ###################################################################
carpeta_onedrive_casa <- paste0(carpeta_usuario,"/OneDrive")

### Carpeta Estadística Descriptiva #############################################
carpeta_onedrive_descriptiva <- paste0(carpeta_onedrive_casa,"/Documentos/2022 Ayudantía UAH Estadística Descriptiva R")
###### Carpeta con bases de datos ##############################################
carpeta_data_descriptiva <- paste0(carpeta_onedrive_descriptiva,"/BBDD")
###### BBDD Consumo Cultural
archivo_data_consumo_cultural <- paste0(carpeta_data_descriptiva,"/consumo.cultural.Rdata")
######

### Carpeta Estadística Inferencial ############################################
carpeta_onedrive_inferencia <- paste0(carpeta_onedrive_casa,"/Documentos/2022 Ayudantía UAH Estadística Inferencial R")
