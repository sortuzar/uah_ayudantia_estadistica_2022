
# Directorios OneDrive ---------------------------------------------------------
### OneDrive ###################################################################
folder_usuario <- paste0("C:/Users/",
                         tolower(Sys.info()['user']))

### OneDrive ###################################################################
folder_onedrive_casa <- paste0(folder_usuario,"/OneDrive")

### Carpeta con bases de datos (estadística descriptiva) ########################
folder_data_descriptiva <- paste0(folder_onedrive_casa,"/Documentos/2022 Ayudantía UAH Estadística Descriptiva R/BBDD")

###### BBDD Consumo Cultural ######
file_data_consumo_cultural <- paste0(folder_data_descriptiva,"/consumo.cultural.Rdata")

### Carpeta con bases de datos (estadística inferencial) #######################
folder_data_inferencia <- paste0(folder_onedrive_casa,"/Documentos/2022 Ayudantía UAH A. González Estadística Inferencial en R/BBDD")

