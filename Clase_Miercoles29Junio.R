#Nombre: Daniela Ponce
library(ggplot2)
library(tidyverse)

#Carga la base de datos
df <- read.csv2("C:/Users/Profesor/Downloads/OFICIAL_WEB_PROCESO_MAT_2021_29_06_2021.csv")

#Pregunta 5a) Rango etario de cada universidad

UDP <-  df %>% filter(NOMBRE.INSTITUCIÓN == 'UNIVERSIDAD DIEGO PORTALES' |  
                        NOMBRE.INSTITUCIÓN == 'UNIVERSIDAD GABRIELA MISTRAL')
#Cambiar los NA por 0
UDP[is.na(UDP) == TRUE] = 0
UDP %>% group_by(NOMBRE.INSTITUCIÓN) %>% 
  summarize(edad19 = sum(RANGO.DE.EDAD.15.A.19.AÑOS), 
            edad24 = sum(RANGO.DE.EDAD.20.A.24.AÑOS),
            edad29 = sum(RANGO.DE.EDAD.25.A.29.AÑOS), 
            edad34 = sum(RANGO.DE.EDAD.30.A.34.AÑOS), 
            edad39 = sum(RANGO.DE.EDAD.35.A.39.AÑOS), 
            edad40 = sum(RANGO.DE.EDAD.40.Y.MÁS.AÑOS), 
            si = sum(RANGO.DE.EDAD.SIN.INFORMACIÓN))

ggplot(data = UDP, mapping = aes(x = PROMEDIO.EDAD.CARRERA)) +
  geom_histogram(bins = 14, fill = 'red', col = 'darkred') +
  facet_wrap( ~ NOMBRE.INSTITUCIÓN)

#Pregunta 5b)

ggplot(data = UDP, mapping = aes(x = JORNADA, 
                                 fill = NOMBRE.INSTITUCIÓN)) + 
  geom_bar()

ggplot(data = UDP, mapping = aes(x = JORNADA)) + 
  geom_bar(fill = 'darkred') + 
  facet_wrap( ~ NOMBRE.INSTITUCIÓN)
  
# Actividad: 
#Graficar de la librería gapminder la esperanza 
#de vida según continente para los años pesteriores
#a 1975

install.packages('gapminder')
library(gapminder)

df <- gapminder

df2 = df %>% filter(year >= 1975)
ggplot(data = df2, mapping = aes(x = continent)) +
  geom_bar(fill = 'darkblue') +
  labs(title = 'Esperanza de vida por continente', 
       x = 'Continente', 
       y = 'Cantidad')

# Graficar funciones, supongamos y = x^2

ggplot() + 
  xlim(-10, 10) +
  geom_function(fun = ~ .x^2)

#Actividad: Graficar la función y = 3x-2

ggplot() + 
  xlim(-10, 10) +
  geom_function(fun = ~ 3*.x -2)

