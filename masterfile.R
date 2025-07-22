# 1. Limpiar environment -------------------------------------------------------
rm(list = ls())

# 2. Cargar librerías ----------------------------------------------------------
library(rprojroot)
library(knitr)
library(rmarkdown)
library(quarto)
library(reshape)
library(tinytex)
# tinytex::install_tinytex()
# tinytex::tlmgr_install(
#  pkgs=
#    c("babel",
#      "babel-spanish",
#      "caption",
#      "hyperref",
#      "float",
#      "adjustbox",
#      "xcolor"))
tinytex::tlmgr_update(
  all = TRUE,
  self = TRUE
)

# 3. Generar material estadística descriptiva ----------------------------------
### 3.1 Crear objetos auxiliares ###############################################
source(
  paste(
    rprojroot::find_rstudio_root_file(),
    "ayudantias_estadistica_descriptiva",
    "crear_objetos_auxiliares.R",
    sep = "/"
  )
)
### 3.2 Correr tutorial instalación R ##########################################
rmarkdown::render(
  input =
    paste(
      rprojroot::find_rstudio_root_file(),
      "ayudantias_estadistica_descriptiva",
      "ayudantia00_tutorial_instalacion_R",
      "tutorial_instalacion_R.Rmd",
      sep = "/"
    )
)

### 3.3 Correr ayudantía 1 #####################################################
rmarkdown::render(
  input =
    paste(
      rprojroot::find_rstudio_root_file(),
      "ayudantias_estadistica_descriptiva",
      "ayudantia01",
      "presentacion_ayudantia_01.Rmd",
      sep = "/"
    )
)

### 3.4 Correr ayudantía 2 #####################################################
rmarkdown::render(
  input =
    paste(
      rprojroot::find_rstudio_root_file(),
      "ayudantias_estadistica_descriptiva",
      "ayudantia02",
      "presentacion_ayudantia_02.Rmd",
      sep = "/"
    )
)

### 3.5 Correr ayudantía 3 #####################################################


### 3.6 Correr archivos de recursos complementarios ############################
quarto::quarto_render(
  input =
    paste0(
      rprojroot::find_rstudio_root_file(),
      "/ayudantias_estadistica_descriptiva/recursos_adicionales_para_r/Recursos R.qmd"
    )
)

# 4. Generar material estadística inferencial ----------------------------------
