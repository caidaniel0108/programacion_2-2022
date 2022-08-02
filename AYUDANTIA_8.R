# 1. Importe la base de datos "autos.csv" con el nombre de "base".
library(readr)
autos <- read_delim("autos.csv", delim = ";", 
                    escape_double = FALSE, trim_ws = TRUE)
View(autos)
# 2. Explore y/o visualice la base de datos con al menos 3 funciones.
glimpse(autos)
# 3. ¿Qué vehículos tienen un precio igual o mayor a 20 mil dólares?
autos[autos[,3]>=20,]
# 4. Cuente cuántos vehículos son de tipo "small".
sum(autos[,2]=="small")
# 5. Calcule el promedio de precios.
mean(autos$price)
# 6. Saque el promedio de la capacidad de pasajeros que
# tienen los vehículos.
mean(autos$passengers)
# 7. Muestre los datos sólo del vehículo que cuesta 8 mil dólares.
autos[autos[,3]==8,]
# 8. ¿Qué autos son pequeños y tienen capacidad de 5 personas?
#    ¿cuántos son?
autos[autos[,2]=="small" & autos[,6]==5,]
sum(autos[,2]=="small" & autos[,6]==5)
# 9. ¿Cuánto vale el vehículo más barato? ¿y el más caro?
min(autos$price)
min(autos[,3])

max(autos$price)
max(autos[,3])

# 10. Calcule el promedio de los precios que tienen los autos que
#     pesan igual o menos de 3 mil libras.

# 11. Muestre los vehículos que tengan un kilometraje de entre
#     25 y 30 k/L y que sean pequeños.
autos[autos[,4]>=25 & autos[,4]<=30 & autos[,2]=="small",]
# 12. ¿Qué autos NO son medianos y valen más de 31 mil dólares?
autos[autos[,2]!="midsize" & autos[,3]>31,]
autos[autos[,2]!="midsize" | autos[,3]>31,]
# 13. ¿Cuántos autos tienen un precio mayor a 20 mil dólares o son de tamaño grande?
# 14. Por la inflación, los precios aumentaron en un 10%, agregue una nueva columna que
#    represente los precios nuevos.
# 15. Cree un dataframe llamado "autos_l" sólo con los vehículos grandes y haga un
#    resumen estadístico de las variables que correspondan.



