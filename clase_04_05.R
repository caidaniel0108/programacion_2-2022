datos <- iris

colnames(datos)

mean(datos$Sepal.Length)
length(datos$Species)
cumsum(datos$Sepal.Length)
sum(datos$Sepal.Length)
max(datos$Sepal.Length)
min(datos$Sepal.Length)
datos[datos$Sepal.Length==5.1,]

#install.packages("readxl")
library(readxl)
# las librerias UTILS son de R como tal
#Obtener información del directorio de trabajo 
getwd()
dir_file <- "~/Downloads/laboral.xlsx"
df <- read_excel(dir_file)

#Cargar archivos por botnonera
library(readxl)
datos3 <- read_excel("~/Downloads/laboral.xlsx")
head(datos3)


