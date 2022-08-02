library(dplyr)
library(selectr)


# Actividades en Rstudio

#### 1. Se le pide lo siguiente: ####
  
#  a. Genere un vector "a" que contenga la secuencia numérica del 1 al 100.
a <- 1:100 #FORMA 1
a <- seq(1,100, by= 1) #FORMA 2
a


#  b. Genere un vector "b" que contenga sólo los números par de la secuencia anterior.
b <- seq(2, 100, 2)
b


#  c. Genere un vector "c" que repita la letra A cinco veces y la letra B dos veces.
c <- rep(c("A","B"), c(5,2))
c


#  d. Genere un vector "d" que repita 9 veces la secuencia del 1 al 5.
d <- rep(1:5,9)
d


#### 2. Cargue el paquete "openintro" y llame la librería del paquete.                 #####
####    Luego, copie, pegue y ejecute el siguiente comando: datos <- openintro::evals  #####

#install.packages("openintro") (yo lo tengo en comentario porque ya lo instalé)

library(openintro) #llamamos a la librería
datos <- openintro::evals #a la base de datos "evals" del paquete "openintro" le pusimos el nombre de "datos"


# Se le pide lo siguiente:
  
#  a. Investigue sobre la base de datos "evals"

?evals


#  b. Muestre las primeras 10 filas de la base de datos
head(datos,10) #el argumento es head(base de datos, numero de filas a mostrar)


#  c. Muestre los nombres de las variables que tiene la base "datos".
colnames(datos)


# d. Calcule el **PROMEDIO** de la variable *score*.
mean(datos$score) #el argumento es mean(base de datos$variable a sacar el promedio)


#  e. Calcule el **MÁXIMO** de la variable "age".
max(datos$score)


#  f. Muestre las evaluaciones sólo de LAS profesoras. PISTA: tiene que ver con la variable "gender".
datos[datos$gender=="female",]


#  g. Muestre las evaluaciones que tienen puntaje (score) igual o mayor a 4.
datos[datos$score>=4,]





