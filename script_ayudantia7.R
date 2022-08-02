library(readr)
base_censo <- read_csv("base_censo.csv")
View(base_censo)
# EXPLORAR BASE DE DATOS
colnames(base_censo)
rownames(base_censo)

#install.packages("dplyr") para usar GLIMPSE se necesita el paquete dplyr 
library(dplyr)

glimpse(base_censo) #informacion sobre base: n filas, n columnas, tipo de variables, muestra
str(base_censo) #lo mismo de arriba
length(base_censo) #largo de la base, es decir, cuantas columnas
# VISUALIZAR BASE
print(base_censo)
head(base_censo) #por defecto son 6 observaciones
head(base_censo,10) #muestra 10 observaciones. si son +10, mostrara un mensaje tipo "te quedan 20 filas por mostrar"

View(base_censo)
base_censo #es lo mismo que print()
print(base_censo) 
# otra forma de ver mi base, es en ENVIRONMENT y apretar la flecha azul o el cuadrito blanco.

base_censo[c(4,100), c(2,8)] #dato coordenada 64,3
base_censo[1:64,3] #desde 1 a la observacion 64 de la columna 3
base_censo[,5] #me muestra todas las filas de la columna 5


# ENCONTRAR 2 DATOS
#4, columna 2 y el dato de la columna 8, fila 100.
base_censo[4,2] ; base_censo[100,8] #funciona


# ENCONTRAR SEXO DE PERSONA NUMERO 10
base_censo[10,6]






alabama <- base_censo[base_censo$state_fips_code=="Alabama",]
