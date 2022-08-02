#Nombre:Daniela Ponce


x <- c(1,2,4)
y <- c(2,4,3)

plot(x,y, pch = c(1,1,16), cex = c(1,1,2))
#pch: Selecciona la forma del gráfico
#cex: aumenta el tamaño del elemento a graficar
plot(x,y, col = 'aquamarine4', type = 'l',lwd = 6,
     main = 'Título', xlab = 'Eje X', ylab = 'Ejey')
points(4,4, col = 'darkred', pch = 20, cex = 5)
lines(c(2,3), c(3,4), lwd = 9)


#Actividad 1: 

df <- mtcars
plot(df$wt, df$mpg, col = 'purple', pch = 3, 
     main = 'Peso v/s rendimiento', xlab = 'Peso', ylab = 'Rendimiento')

#---- GRAFICO DE TORTA

count <- c(7,25,16,12,10,30)
pie(count, labels = c('categoria 1', 'Categoria 2', 'Categoria 3', '
                      Categoria 4', 'Categoría 5', 'Categoría 6'),
    col = 1:6, lty = 2)

#---- GRAFICO DE BARRA

#Crea una tabla de frecuencia
mi_tabla <- table(df$cyl)
mi_tabla
barp <- barplot(mi_tabla, col = c('darkred', 'red', 'pink'), 
        main = 'Título', xlab = 'Eje X', ylab = 'Eje Y',
        ylim= c(0,16))
text(barp, mi_tabla+1, labels= mi_tabla)

#Actividad 2:
#Cree un gráfico de torta que muestre la cantidad 
#de especies de cada planta de iris

df1 <- iris
count <- table(df1$Species)
pie(count)

# Otra forma
library(dplyr)
tabla <- df1 %>% group_by(Species) %>% summarize(n = n())

