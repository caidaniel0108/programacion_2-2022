# 1. Cargue la base de datos "cars93" con el nombre de "base".
library(readr)
autos <- read_delim("autos.csv", delim = ";", 
                    escape_double = FALSE, trim_ws = TRUE)
View(autos)
# 2. Muestre las primeras 5 observaciones de la base de datos.
head(base,5)
# 3. ¿Cuántos vehículos tienen un precio igual o mayor a 20 mil dólares?
sum(base[,2]<=20)
# 4. Cuente cuántos vehículos son de tipo "small".
sum(base[,1]=="small")
# 5. Calcule el promedio de precios.
mean(base$price)
# 6. Saque el promedio de de la capacidad de pasajeros que tienen los vehículos.
mean(base$passengers)
# 7. Muestre los datos sólo del vehículo que cuesta 8 mil dólares.
autos[autos[,3]==8,]
# 8. ¿Qué autos son pequeños y tienen capacidad de 5 personas? ¿cuántos son?
base[base[,1]=="small" & base[,5]==5,]
sum(base[,1]=="small" & base[,5]==5)
# 9. ¿Cuánto vale el vehículo más barato? ¿y el más caro?
min(base$price)
min(base[,2])
max(base$price)
max(base[,2])
# 10. Calcule el promedio de los precios que tienen los autos que pesan 3 mil
#     libras o menos.
mean(autos[autos[,7]<=3000, 3]$price)

# 11. Muestre los vehículos que tengan un kilometraje de entre 25 y 30 k/L y que sean grandes.
base[base[,3]>=25 & base[,3]<=30,]
sum(base[,3]>=25 & base[,3]<=30)
length(base[base[,3]>=25 & base[,3]<=30,])
# 12. ¿Qué autos NO son medianos y valen más de 31 mil dólares?
base[base[,1]!="midsize" & base[,2]>=31,]
sum(base[,1]!="midsize" & base[,2]>=31) # cuantos son
# 13. ¿Cuántos autos tienen un precio mayor a 20 mil dólares o son de tamaño grande?
base[base[,2]>=20 | base[,1]=="large",]
sum(base[,2]>=20 | base[,1]=="large")
# 14. Por la inflación, los precios aumentaron en un 10%, agregue una nueva columna que
#    represente los precios nuevos.
base$price2 = base$price + base$price*0.1
# 15. Cree un dataframe llamado "autos_l" sólo con los vehículos grandes y haga un
#    resumen estadístico de las variables que correspondan.
autos_l <- base[base[,1]=="large",]
mean(autos_l$price)
min(autos_l$price)
max(autos_l$price)

mean(autos_l$mpg_city)
min(autos_l$mpg_city)
max(autos_l$mpg_city)

mean(autos_l$passengers)
min(autos_l$passengers)
max(autos_l$passengers)
