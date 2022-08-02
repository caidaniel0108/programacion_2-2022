#Nombre: Daniela Ponce
View(gapminder)
#Instalaci?n de Tidyverse
#install.packages('tidyverse')

#Activar librerias
#Esta libreria es para la manipulaci?n de datos
library(dplyr)
#Esta libreria es para la visualizacion de datos
library(ggplot2)

#Cargar la base de datos iris de R 
df <- iris
#----Funci?n FILTER---------
#filter(df, condiciones)

#Actividad: Filtremos por la plata setosa
#Antes
df[df[,5]== 'setosa', ]
#Ahora
df %>% filter(Species == 'setosa')

#Utilizaci?n de y / ?
#Actividad: Filtrar las observaciones que tienen setosa ? virginica y 
#sepal.length > 5 ? petal.length > 5
 df %>% 
   filter((Species == 'setosa' | Species == 'virginica') & 
            (Petal.Length >5 | Sepal.Length >5))

 #------Funcion SELECT -----  
 
#Actividad Seleccionar la columna Species
df %>% select(Species)
#para selecionar dos columnas
df %>% select(Species,Petal.Length)
#Actividad: Seleccione la columa Species para aquellas plantas
#en las cuales sepal.Length sea un n?mero entre [4,5]
 
df %>% filter(Sepal.Length >= 4 |Sepal.Length<=5) %>% select(Species)

#---- Funcion Mutate
#Actividad: Crear una columna que se llame Length y tenga la suma de
# Petal.Legth y Sepal Length
df %>%  mutate(Length = Petal.Length + Sepal.Length)

#Actividad: Crear una nueva columna que contenga el promedio del 
#Ancho y largo del p?talo
 df %>% mutate(Promedio = (Petal.Length + Petal.Width)/2)
 
 #Ejercicio: Cree un dataframe que se llame data1 y contenga todas las 
 #           observaciones donde Petal.Length sea mayor ? igual 6y al 
#             dataframe agregue una columna llamada condici?n que sea 
 #            1 si es virginica, 2 si es setosa y 3 si es versicolor
 
