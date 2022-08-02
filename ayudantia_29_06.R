library(gapminder)
library(dplyr)
library(ggplot2)

# Actividad 1
impares <- function(x){
  impar <- x[(x+1)%%2==0]
  impar
}
impares(1:100)
imp <- function(x){
  impar <- 2*x - 1
  impar
}
imp(1:100)
# Actividad 2
# Cargue la base de datos "mtcars" con el nombre de "df".
# Escriba una función que le permita cambiar todas las
# observaciones de la variable "vs" de la siguiente forma:
# 0= VShaped, 1=Straight.

df <- mtcars
for(i in 1:length(df$vs)){
  if(df$vs[i]=="0"){
    df$vs[i]="VShaped"
  }
  else{
    df$vs[i]="Straight"
  }
}

# Actividad 3
# Cargue el paquete "gapminder" y la base de datos "gapminder".

# 1) Agregue, dentro de la misma base, una variable llamada "Gdp"
#    que sea la multiplicación de la población y el pib percápita.
# 2) Filtre los datos para todos los continentes menos para
#    AMERICA (sin crear una nueva data).
# 3) ¿Cuál es el país que tiene más PIB ACUMULADO
#    a lo largo de los años?
# 4) ¿Cuál es el país más pobre al año 2007?
# 5) Haga un gráfico de puntos para x= gdpPercap e y= lifeExp
#    en el año 2007.
# 6) Haga un gráfico de barras de la población para los
#    países asiáticos.
df <- gapminder
df %>% 
  filter(continent=="Asia") %>% 
  ggplot(aes(country,pop)) + 
  geom_col() +
  theme(axis.text.x = )


# 1.
df <- df %>% 
  mutate(Gdp=gdpPercap*pop)

# 2.
df <- df %>% 
  filter(continent!="Americas")

# 3.
df %>% 
  group_by(country) %>% 
  summarise(PIB_acumulado=sum(Gdp)) %>% 
  arrange(desc(PIB_acumulado))

# 4.
df %>% 
  filter(year==2007) %>% 
  group_by(country) %>% 
  summarise(pib=min(Gdp)) %>% 
  arrange(pib)

# 5. 
df %>% 
  filter(year==2007) %>% 
  ggplot(aes(gdpPercap,lifeExp)) +
  geom_point() + 
  labs(
    y = "expectativa",
    x = "pib pc",
    title = "relación pib pc - expectativa"
  )


