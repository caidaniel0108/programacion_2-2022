#Nombre: Daniela Ponce

install.packages('tidyverse')
#Libreria para la manipulacion de los datos
library(dplyr)

#Carga de base de datos desde R
data <- mtcars

#---- Arrange()
#La función arrange() ordena los datos
#En este caso los ordena según cilindradas
data %>% arrange(cyl)

#Podemos ordenar por varios criterios separándolos por comas
data %>% arrange(cyl, mpg)

#Para ordenar en forma descendente(mayor a menor)
data %>% arrange(desc(cyl))

#Actividad: Ordene su dataframe por cyl de manera ascendente y 
#luego por mpg de manera descendente y guardelo en un data frame 
#Llamado df. 

df <- data %>% arrange(cyl,desc(mpg))


#---- summarise()

#La función summarise me entrega un resumen de información
data %>% summarise(mean = mean(disp), n = n())

data %>% summarise(mean_hp = mean(hp), suma_vs = sum(vs))

#---- group_by
data %>% group_by(cyl) %>% summarise(mean = mean(disp), n = n())

#----Actividad
#Importar desde Excel la base de datos Formula1.xlsx y asignarla a un 
#dataframe. Esta tabla contiene los datos de los campeones de formula 1 
#desde 1950 al 2019

library(readxl)
Formula1 <- read_excel("C:/Users/Profesor/Downloads/Formula1.xlsx")

#1.- Visualice la tabla de datos y vea cuáles son las variables que tiene
head(Formula1)
#2.- ¿Cuántos pilotos Australianos han sido campeones 
#     utilizando neumáticos Gooyear?
Formula1 %>% filter(Nacionality == 'Australia' & Tyres == 'Goodyear') %>% 
  summarise(Cantidad= n())
#3.- ¿A qué edad salió campeon el piloto Australiano más joven?
Formula1 %>% filter(Nacionality == 'Australia') %>% 
  summarise(edad_minima = min(Age))
#4.- ¿Cuál es el promedio de edad a la que han salido campeones 
#    los pilotos ingleses en escuderias no inlgesas?
Formula1 %>% 
  filter(Nacionality == 'United Kingdom' & Chassis_Nac != 'United Kingdom') %>% 
  summarise(Promedio = mean(Age))
#5.- Muestre en una tabla el número de veces que ha salido campeón un 
#    piloto de cada escudería
Formula1 %>% group_by(Chassis) %>% summarise(Cantidad = n())
