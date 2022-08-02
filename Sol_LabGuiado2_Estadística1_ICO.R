###############################################
##  Laboratorio Guiado 2 - Estadística I ICO
###############################################



# Ejercicio 1 -------------------------------------------

# Considere el siguiente conjunto de datos, que fue recogido
# aplicando una encuesta a una muestra de estudiantes
# universitarios. 
### La descripción de la base de datos podemos verla en el
### siguiente enlace:
# https://github.com/hllinas/DatosPublicos/blob/main/Estudiantes(Descripcion).pdf


url.Datos<- "http://bit.ly/Database-Estudiantes"
Datos <- read.delim(url.Datos)
View(Datos)

# 1.1 Realice un resumen numérico de la base de datos utilizando 
# la función skim() del paquete skimr y responda

skimr:: skim(Datos)

# a) ¿Cuántos estudiantes fueron encuestados?

# 400 estudiantes, pues los estudiantes corresponden a 
# la cantidad de observaciones

# b) ¿Cuántas variables de cada tipo tiene la base de datos?

# Existen 46 variables, pues las variables corresponden a
# cantidad de columnas
# tipo caracter: 26
# tipo numérica: 20

# 1.2 Construya una nueva base de datos llamada base_new
# a partir de la original de modo que contenga las 
# siguientes variables:
# Sexo, Edad, Fuma, Estatura, Colegio, Financiacion, Gastos,
# Ingreso , Clases y Puntaje (porcentaje de acierto en 
# una determinada prueba)
# redondee la columna Edad usando round()
# Finalmente utilice la función cleannames() del paquete janitor para
# cambiar los nombres de las variables a letras minúsculas


base_new <- Datos %>% select(Sexo,Edad,Fuma, Estatura,Colegio,
                             Financiacion,Gastos,Ingreso, 
                             Clases,Puntaje) %>% 
  mutate(Edad = round(Edad,0)) %>% 
  janitor::clean_names()

# 1.3 Utilice la función summarise() para construir una 
# tabla resumen con la media, var, sd, cv para la variable
# ingreso de acuerdo al tipo de colegio de la base_new

resumen_ingresoXcolegio <- base_new %>% group_by(colegio) %>% 
  summarise(media = mean(ingreso),
            varianza=var(ingreso),
            desviacion=sd(ingreso),
            cv= desviacion/media*100)
resumen_ingresoXcolegio

# 1. 4 Repita el ejercicio anterior para la variable numérica
# puntaje 

resumen_puntajeXcolegio <- base_new %>% group_by(colegio) %>% 
  summarise(media = mean(puntaje),
            varianza=var(puntaje),
            desviacion=sd(puntaje),
            cv= desviacion/media*100)
resumen_puntajeXcolegio

# 1.5 Realice un boxplot para ingreso 
# según tipo de colegio. Comente

library(ggplot2)
library(tidyverse)
base_new %>% ggplot()+
  aes(x=ingreso,y=colegio, fill=colegio, col=colegio)+
  geom_boxplot(alpha=0.7)+
  labs(title = "Boxplot",
       subtitle = "Ingreso diferenciado según tipo de colegio",
       x="Ingreso mensual del padre (en mill)", y= "Tipo de Colegio")+
  theme_bw()+
  theme(legend.position = "none")

  
# Podemos notar que no es mucha la diferencia entre ambos tipos
# de colegio, en el caso de colegio público la mayoría
# de los padres de esos estudiantes tienen un ingreso 
# ligeramente mayor que el de los padres de estudiantes
# provenientes de colegios privados. Ambos tienen una
# asimetría positiva moderada


# 1.6  Realice un boxplot y un histograma para Puntaje
library(patchwork)
g1 <- base_new %>% ggplot()+
  aes(x=puntaje)+
  geom_boxplot(alpha=0.7, fill="lightblue")+
  labs(title = "Boxplot",
       subtitle = "Puntaje",
       x="Puntaje obtenido en la prueba (%)", 
       y= "")+
  theme_bw()+
  theme(legend.position = "none",
        axis.text.y = element_blank())
g2 <- base_new %>% ggplot()+
  aes(x=puntaje, y = ..density..)+
  geom_histogram(alpha=0.7, bins=30,
                 fill="lightblue",
                 col="black")+
  labs(title = "Histograma",
       subtitle = "Puntaje",
       x="Puntaje obtenido en la prueba (%)", 
       y= "Frecuencia Relativa")+
  theme_bw()+
  theme()

g1/g2

# Podemos notar que existen muchos datos atípicos,
# aquellos valores extremos afectan al promedio.
# Existe una asimetría positiva marcada

# 1.7 Realice un boxplot usando la función facet_wrap
# de acuerdo a sexo y tipo de colegio

base_new %>% 
  ggplot()+
  aes(x=puntaje, fill=sexo)+
  geom_boxplot(alpha=0.7)+
  labs(title = "Boxplot",
       subtitle = "Puntaje",
       x="Puntaje obtenido en la prueba (%)", 
       y= "")+
  facet_wrap(~sexo+colegio)+
  theme_bw()+
  theme(legend.position = "none",
        axis.text.y = element_blank())


# 1.7 Realice histogramas para puntaje de acuerdo 
# diferenciando por distintas variables categóricas

base_new %>% 
  ggplot()+
  aes(x=puntaje, fill=sexo, col=sexo)+
  geom_histogram(alpha=0.7, bins = 30)+
  labs(title = "Histograma",
       subtitle = "Puntaje",
       x="Puntaje obtenido en la prueba (%)", 
       y= "Frecuencia Relativa")+
  facet_wrap(~sexo+financiacion)+
  theme_bw()+
  theme(legend.position = "none")

base_new %>% 
  ggplot()+
  aes(x=puntaje, fill=sexo, col=sexo)+
  geom_histogram(alpha=0.7, bins = 30)+
  labs(title = "Histograma",
       subtitle = "Puntaje",
       x="Puntaje obtenido en la prueba (%)", 
       y= "Frecuencia")+
  facet_grid(sexo~financiacion)+
  theme_bw()+
  theme(legend.position = "none")

base_new %>% 
  ggplot()+
  aes(x=puntaje,y= edad, fill=colegio, col=colegio)+
  geom_jitter(alpha=0.7)+
  labs(title = "Gráfico de Dispersión",
       subtitle = "Puntaje",
       x="Puntaje obtenido en la prueba (%)", 
       y= "Ingreso mensual del padre")+
  facet_grid(colegio~sexo)+
  theme_bw()+
  theme(legend.position = "none")

