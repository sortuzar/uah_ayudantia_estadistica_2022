
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
library(quarto)

# Correr diapositivas estadística descriptiva ----------------------------------
### Correr tutoria instalación R ###############################################
for(rmd in list.files(path=paste0(rprojroot::find_rstudio_root_file(),"/ayudantias_estadistica_descriptiva"),
                      pattern="^tutorial\\_instalacion\\_R\\.Rmd$",
                      full.names=TRUE,
                      recursive=FALSE))
{
  rmarkdown::render(input=rmd) # sin especificar output_dir cada archivo se crea donde está su propio RMD
}

rm(list=ls())

### Correr diapositivas en loop ################################################
for(rmd in list.files(path=paste0(rprojroot::find_rstudio_root_file(),"/ayudantias_estadistica_descriptiva"),
                      pattern="^presentacion\\_ayudantia\\_[0-1]{2}\\.Rmd$",
                      full.names=TRUE,
                      recursive=TRUE))
  {
  rmarkdown::render(input=rmd) # sin especificar output_dir cada archivo se crea donde está su propio RMD
  }
