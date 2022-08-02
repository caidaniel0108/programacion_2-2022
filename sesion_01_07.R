library(tidyverse)
library(skimr)
library(datos)
df <- datos::vuelos

# Escribe bucles for para:

# Calcular la media de cada columna en datos::flores.

medias <- c()  # vector vacio
for (i in seq_along(df)) {            
  medias[[i]] <- mean(df[[i]])
}

medias

# Determinar el tipo de cada columna en datos::vuelos.
max_col <- c()
for(i in seq_along(datos::vuelos)){
  max_col[[i]] <- max(datos::vuelos[[i]])
}
max_col

skim(df) # skimr()

# Calcular el número de valores únicos unique() en cada columna de datos::flores.
valores <- c()
for(i in seq_along(datos::flores)){
  valores[[i]] <- unique(datos::flores[[i]]) 
}
valores

# Calcular el número más pequeño de cada columna de datos::diamantes
maximos <- c()
for(i in seq_along(datos::diamantes)){
  maximos[[i]] <- max(datos::diamantes[[i]]) 
}
maximos


