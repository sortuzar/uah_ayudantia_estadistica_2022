# Limpiar environment ----------------------------------------------------------
rm(list = ls())

# Cargar librerías -------------------------------------------------------------
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

# Generar material estadística descriptiva -------------------------------------
### Crear objetos auxiliares ###################################################
source(
  paste(
    rprojroot::find_rstudio_root_file(),
    "ayudantias_estadistica_descriptiva",
    "crear_objetos_auxiliares.R",
    sep = "/"
  )
)
### Correr tutorial instalación R ##############################################
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

### Correr presentaciones (diapositivas) #######################################
###### Diapositiva 1 ###########################################################
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

###### Diapositiva 2 ###########################################################
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

### Correr archivos de recursos complementarios ################################
quarto::quarto_render(
  input =
    paste0(
      rprojroot::find_rstudio_root_file(),
      "/ayudantias_estadistica_descriptiva/recursos_adicionales_para_r/Recursos R.qmd"
    )
)

# Generar material estadística inferencial -------------------------------------
