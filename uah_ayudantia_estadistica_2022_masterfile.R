
# Limpiar environment ----------------------------------------------------------
rm(list=ls())

# Cargar librerías -------------------------------------------------------------
library(rprojroot)
library(knitr)
library(rmarkdown)
library(tinytex)
tinytex::tlmgr_install(
  pkgs=
    c("babel",
      "caption",
      "hyperref",
      "float",
      "adjustbox",
      "xcolor"))
tinytex::tlmgr_update(
  all=TRUE,
  self=TRUE)
library(quarto)

# Generar material estadística descriptiva -------------------------------------
### Crear objetos auxiliares ###################################################
source(paste0(rprojroot::find_rstudio_root_file(),"/ayudantias_estadistica_descriptiva/crear_objetos_auxiliares.R"))

### Correr tutorial instalación R ##############################################
for(rmd in list.files(path=paste0(rprojroot::find_rstudio_root_file(),"/ayudantias_estadistica_descriptiva"),
                      pattern="^tutorial\\_instalacion\\_R\\.Rmd$",
                      full.names=TRUE,
                      recursive=FALSE))
{
  rmarkdown::render(input=rmd) # sin especificar output_dir cada archivo se crea donde está su propio RMD
}

rm(list=ls())

### Correr diapositivas ########################################################
for(rmd in list.files(path=paste0(rprojroot::find_rstudio_root_file(),"/ayudantias_estadistica_descriptiva"),
                      pattern="^presentacion\\_ayudantia\\_[0-1]{2}\\.Rmd$",
                      full.names=TRUE,
                      recursive=TRUE))
  {
  rmarkdown::render(input=rmd) # sin especificar output_dir cada archivo se crea donde está su propio RMD
  }

rm(list=ls())

### Correr archivos de recursos complementarios ################################
quarto::quarto_render(
  input=
    paste0(
      rprojroot::find_rstudio_root_file(),
      "/ayudantias_estadistica_descriptiva/recursos_adicionales_para_r/Recursos R.qmd"))
