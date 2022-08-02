library(readr)
library(dplyr)
df <- read.csv("~/Desktop/UDP/AYUDANTÍA_PROGRA/airline_passenger_satisfaction.csv")


# Seleccionamos las variables y renombramos
df <- df %>% 
  select(Gender,
         Age, Customer.Type,
         Class,
         Flight.Distance,
         Departure.Delay,
         Arrival.Delay) %>% rename(genero=Gender,
                                     edad=Age,
                                     tipo.cliente=Customer.Type,
                                     clase=Class,
                                     distancia.vuelo= Flight.Distance,
                                     demora.salida=Departure.Delay,
                                     demora.llegada=Arrival.Delay)

# 2. Agregue una nueva variable llamada "demora.total"
# como la suma de las variables "demora.salida" y "demora.llegada".

df <- df %>% 
  mutate(demora.total=demora.salida+demora.llegada)


# 3. Mostrar en una tabla el promedio de la demora total
# y la demora total máxima.

df %>%
  summarise(promedio=mean(demora.total),
            maxima=max(demora.total))


# 4. Usando dplyr, genere una nueva tabla con la cantidad,
# el promedio de la demora total, el máxima demora total
# para cada clase de los pasajeros de entre 35 y 40 años.
# Además, los datos deben estar ordenados por el promedio de
# demora total de forma decreciente.

df %>% 
  group_by(clase) %>% 
  filter(edad>=35 & edad<=40) %>% 
  summarise(cantidad=n(),
            promedio=mean(demora.total),
            maximo=max(demora.total)) %>% 
  arrange(desc(promedio))


# 5. Determine si existe diferencia entre el promedio
# de distancia recorrida entre hombres y mujeres considerando
# aquellos vuelos que hayan tenido una demora máxima de 800 minutos.

df %>% 
  group_by(genero) %>% 
  filter(demora.total<=800) %>% 
  summarise(promedio.distancia.recorrida=mean(distancia.vuelo))
