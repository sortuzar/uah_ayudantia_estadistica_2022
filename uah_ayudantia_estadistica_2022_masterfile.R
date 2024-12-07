
# Limpiar environment ----------------------------------------------------------
rm(list=ls())

# Cargar librerías -------------------------------------------------------------
library(knitr)
library(tinytex)
library(rprojroot)
tinytex::tlmgr_install(
  pkgs=
    c("babel",
      "caption",
      "hyperref",
      "float",
      "adjustbox",
      "xcolor"))
library(knitr)
library(rmarkdown)

# Fijar directorios ------------------------------------------------------------
folder_project <- rprojroot::find_rstudio_root_file()
folder_here <- paste0(folder_project)

# Correr diapositivas estadística descriptiva ----------------------------------
### Correr diapositivas en loop ################################################
for(rmd in list.files(path=paste0(rprojroot::find_rstudio_root_file(),"/ayudantias_estadistica_descriptiva"),
                      pattern="^presentacion\\_ayudantia\\_[0-1]{2}\\.Rmd$",
                      full.names=TRUE,
                      recursive=FALSE))
  {
  rmarkdown::render(input=rmd,
                    output_dir=paste0(rprojroot::find_rstudio_root_file(),"/ayudantias_estadistica_descriptiva"))
  }
