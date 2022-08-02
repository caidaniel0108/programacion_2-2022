# Actividad práctica
# Cargue el paquete "gapminder" y las librerías respectivas.
# 
# 1. ¿Qué es cada variable y de qué tipo?
?gapminder

# 2. Filtre los datos para el año 2007.
gapminder %>% 
  filter(year==2007)

# 3. Filtre la base para los datos de América en el año 1977.
gapminder %>% 
  filter((year==1977) & (continent=="Americas"))

# 4. Nombre los continenes que tenían más de 90 millones habitantes para 1997 (PISTA: son 3).
gapminder %>% 
  filter((pop>90000000) & (year==1997))  

# 5. Agregue una variable llamada "PIB" que sea la multiplicación del pib percápita y la población.
gapminder %>% 
  mutate(PIB=gdpPercap*pop)

# 6. Guarde lo anterior en una nueva base llamada "gapminder2"
gapminder2 <- gapminder %>% 
  mutate(PIB=gdpPercap*pop)

# 7. 

