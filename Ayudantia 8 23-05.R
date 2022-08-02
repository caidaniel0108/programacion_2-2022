#https://swcarpentry.github.io/r-novice-gapminder-es/13-dplyr/
install.packages("tidyverse")
install.packages("gapminder")
library(dplyr)
library(gapminder)

View(gapminder)


# ¿CÓMO SE HACE LA PIPA " %>% "?

#%>% pipe (ctrl + shift + m)


# ¿CÓMO SE USA LA FUNCIÓN FILTER() Y LA PIPA?

# nuestradata %>%
#  filter(condicion)

# la condición podría ser por ejemplo: (edad < 18).


#Funciones:
mutate() #Crea nuevas variables a partir de las existentes
select() #Selecciona algunas columnas específicas
filter() #Selecciona variables por alguna condición
summarise() #Resume la información de muchos valores.
arrange() #Cambia el orden de los datos según algún criterio
group_by() #Operaciones por grupo

#1.- Select()
#    Cree un nuevo dataframe llamado "df" con las variables
#    "country", "year", "gdpPercap" y "continent"

df <- gapminder %>% 
  select(country,continent, year, gdpPercap)


# Agregue a df una variable que se llame PIB y que sea la multiplicación
# de el pib percápita (gdp) y la población (pop)

df <- df %>% 
  mutate(PIB=gdpPercap*pop)

# Ordene de menor a mayor según el año.
df %>% 
  arrange(year) # por defecto, el arrange ordena de MENOR a MAYOR


# Ordene de mayor a menor según el año.
df <- df %>% 
  arrange(desc(year))

# Ordene de menor a mayor según el país.
df <- df %>% 
  arrange(country) # por defecto, me ordena de A-Z
df <- df %>% 
  arrange(desc(country)) # con variable cualitativa me ordena de Z-A


#2.- Filter()
#    Muestre los datos para España y Francia.

df1 <- df %>% 
  filter(country=="Spain" | country=="France")



#    Muestre los datos para aquellos países que tienen un PIB percápita
#    menor o igual a 400.
# ANTES

df2 <- df %>% 
  filter(gdpPercap<=400)

# Agrupe por país y muestre sus promedios del pib pc.
df3 <- df %>% 
  group_by(country) %>% 
  summarise(promedio_pib_pc=mean(gdpPercap))

# Agrupar por año y mostrar el máximo del pib pc.
df4 <- df %>% 
  group_by(year) %>% 
  summarise(max_pib_pc=max(gdpPercap),
            prom_pib_pc=mean(gdpPercap),
            minimo_pib_pc=min(gdpPercap))

#    Muestre los datos de Chile entre los años 1980 y 2007.

df5 <- df %>% 
  filter(country=="Chile" & year>=1980 & year<=2007)


#3.- Filter() y select()

#    Muestre los países, años y PIB p-c para Europa.

df6 <- df %>% 
  filter(continent=="Europe") %>% 
  select(country, year, gdpPercap)


#4.- summarise()
#    Muestre el año más reciente.
df7 <- df %>%
  summarise(max_year = max(year)) #se guarda como una "tabla" o dataframe 
df7 <- max(df$year)  # se guarda como un número

#    Muestre la expectativa de vida más pequeña.
gapminder %>%
  summarise(min_lifeExp = min(lifeExp))


##### Combinación de funciones ####

#    Agrupe por país, cuente cuántas veces se repite cada país y visualice.
gapminder %>% #seleccionamos la base o dataframe
  group_by(country) %>% # agrupamos por país
  summarise(conteo = n()) %>% # contamos cuántas veces se repite el país
  View() # visualizamos
# de arriba, cada país se repite 12 veces y son 142 países en total.


# Cree una base/data frame que se llame "base" y que contenga las variables
# country, continent, pop, pdgpercap de la data gapminder. Además, filtre
# los datos para los países de América y agregue la variable PIB que sea 
# la multiplicacion del pib pc por la población dividido en 100.

# Luego, muestre
# el promedio de los pib.

base <- gapminder %>% 
  filter(continent=="Americas") %>% 
  select(country, continent, pop, gdpPercap) %>% 
  mutate(PIB=(gdpPercap*pop)/100) %>% 
  arrange(desc(PIB))

prom_pib <- base %>% 
  summarise(promedio_pib=mean(PIB))

mean(base$PIB) 
#  el promedio de los PIB es 3792623502 dólares.


# Saque el promedio de los PIB por continente
promedio_pib_continente <- gapminder %>% 
  mutate(PIB=(gdpPercap*pop)/100) %>% 
  group_by(continent) %>% 
  summarise(promedio=mean(PIB))

