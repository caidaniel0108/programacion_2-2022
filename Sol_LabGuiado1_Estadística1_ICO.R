###############################################
##  Laboratorio Guiado 1 - Estadística I ICO
###############################################



# Ejercicio 1 -------------------------------------------

# Los resultados obtenidos en una prueba de 
# estadística se clasifican de acuerdo a las 
# categorías: Insuficiente, Regular, Medio y Alto.
# La variable resultados contiene los registros

resultados <- c("Alto","Alto", "Bajo", "Bajo", "Bajo",
                 "Bajo", "Bajo","Insuficiente","Insuficiente",
                 "Insuficiente","Regular","Insuficiente",
                 "Insuficiente","Insuficiente","Regular",
                 "Alto","Alto","Alto","Regular",
                 "Regular","Regular","Regular","Regular",
                 "Medio", "Medio", "Medio", "Medio", "Medio",
                 "Medio","Medio", "Alto", "Alto", "Alto",
                 "Medio", "Alto", "Alto","Alto","Alto",
                 "Bajo", "Alto")

# 1. ¿Cuántos estudiantes hay en el curso de
# estadística?

length(resultados)


# 2. Construya una tabla de frecuencias

table(resultados)

# 3. Construya un Diagrama de Barras para resultados

library(ggplot2)
resultados <- data.frame(resultados)
resultados %>% ggplot()+
    aes(x=resultados, fill=resultados)+
    geom_bar(alpha=0.8)+
    labs(title = "Diagrama de Barras",
         subtitle = "Resultados Examen Estadística")+
    theme_bw()+
    theme(legend.position = "none")


# 4. Construya un Diagrama de Circular para resultados

resultados %>% group_by(resultados) %>% 
    summarise(porcentaje=n()/40*100)%>% 
    ggplot()+
    aes(x="",y=porcentaje, fill=resultados)+
    geom_bar(stat = "identity",color="white")+
    geom_text(aes(label=paste0(porcentaje,"%")),
              position=position_stack(vjust=0.5),
              color="white",size=4)+
    coord_polar(theta = "y")


# Ejercicio 2 -----------------------------------------------------

# Se midió en 40 pacientes el tiempo de inicio de una 
# reacción alérgica a una picadura de abeja, y se 
# obtuvieron los siguientes datos (en minutos):

alergia <- c(10.5,11.2,9.9,15.0,11.4,12.7,16.5,10.1,12.7,11.4,11.6,6.2,7.9,
          8.3,10.9,8.1,3.8,10.5,11.7,8.4,12.5,11.2,9.1,10.4,9.1,13.4,12.3,5.9,11.4,
          8.8,7.4,8.6,13.6,14.7,11.5,11.5,10.9,9.8,12.9,9.9)

# 1.  Decida una cantidad de clases adecuada y la amplitud
# para agrupar los datos en tablas de frecuencias.

length(alergia)
# Como son 40 datos, usaremos 6 clases pues 2^6=64>=40

# 2. Cree una función que entregue una tabla de frecuencias

tabla_frecuencias <- function(x,k,A){
    L=min(x)+A*(0:k) # limites de las clases
    x_int <- cut(x, breaks=L, right=FALSE, 
                 include.lowest=TRUE)
    # right=False: extremo derecho abierto
    # include.lowest=TRUE: último int cerrado
    intervalos <- levels(x_int)
    marcas <- (L[1]+L[2])/2+A*(0:(k-1))
    f.abs <- as.vector(table(x_int))
    f.rel <- f.abs/length(x)
    f.abs.cum <- cumsum(f.abs)
    f.rel.cum <- cumsum(f.rel)
    tabla_x <- data.frame(intervalos, marcas, f.abs, 
                          f.abs.cum, f.rel, f.rel.cum)
    tabla_x
}

summary(alergia)
clases <- 6
amplitud <- (max(alergia)-min(alergia))/clases
amplitud

tabla <- tabla_frecuencias(alergia,clases, amplitud)
tabla


# 3. Construya un histograma de alergias usando ggplot
 
alergia %>%  data.frame(alergia) %>%
    ggplot()+
    aes(x=alergia)+
    geom_histogram(col='brown',fill="mistyrose",
                   bins = 6)+
    labs(title = "Histograma",
         subtitle = "Resultados de Alergia")+
    theme_bw()


# 4. Construya un Diagramo de Tallo y Hoja para
# alergia

stem(alergia)

# Ejercicio 3: ------------------------------------------------------------

# Considere la base de datos iris y realice un 
# análisis descriptivo.

# 1. Descripción de la base de datos utilizando
# la función glimpse()

head(iris)
glimpse(iris)

# 2. Diagrama Circular para Species.
iris %>% group_by(Species) %>% 
    summarise(porcentaje=round(n()/dim(iris)[1]*100,1))%>% 
    ggplot()+
    aes(x="",y=porcentaje, fill=Species)+
    geom_bar(stat = "identity",color="white")+
    geom_text(aes(label=paste0(porcentaje,"%")),
              position=position_stack(vjust=0.5),
              color="white",size=4)+
    coord_polar(theta = "y")

# Histograma para Sepal.Length diferenciado
# por Species

ggplot(data = iris)+
    aes(x = Sepal.Length,
        fill = Species, colour = Species) +
    geom_histogram(bins=30,alpha = 0.5,
                   position = "identity") +
    facet_grid(~ Species)+
    labs(title = "Histograma",
         subtitle = "Largo del Sépalo para cada especie",
         x="Largo del Sépalo",
         y="Frecuencia")+
    theme_bw()+
    theme(legend.position = "none")


# Diagrama de puntos para Largo y Ancho del sépalo
# diferenciado por Species


ggplot(data = iris)+
    aes(x = Sepal.Length, y=Sepal.Width,
        fill = Species, colour = Species) +
    geom_jitter(alpha = 0.5) +
    labs(title = "Diagrama de puntos",
         subtitle = "Largo y Ancho del Sépalo para cada especie",
         x="Largo del Sépalo",
         y="Ancho del Sépalo")+
    theme_bw()

# Uno para cada especie

ggplot(data = iris)+
    aes(x = Sepal.Length, y=Sepal.Width,
        fill = Species, colour = Species) +
    geom_jitter(alpha = 0.5) +
    facet_grid(~ Species)+
    labs(title = "Diagrama de puntos",
         subtitle = "Largo y Ancho del Sépalo para cada especie",
         x="Largo del Sépalo",
         y="Ancho del Sépalo")+
    theme_bw()+
    theme(legend.position = "none")

# Ejercicio 4 (Propuesto) -------------------------------------------------------------

# 1. Genere un data frame de 100 observaciones
# que contenga dos distribuciones normales 
# (50 datos para c/u) con diferente media y  
# misma varianza y una variable categórica que
# representa qué observaciones corresponden a 
# cada  distribución

# Indicaciones: 
# i). Fije una semilla con un punto inicial 2022
# ii). Para generar números pseudoaleatorios con distrib 
# normal use rnorm(x, mean= , sd= )

set.seed(2022)
var1 <- rnorm(50, mean=0, sd=1)
var2 <- rnorm(50, mean = 3, sd=1)
datos <- c(var1, var2)
grupo <- c(rep("N(0,1)", 50), rep("N(3,1)", 50))

base <- data.frame(datos, distribucion = grupo)

# Histograma
histo1 <- base %>% ggplot()+
     aes(x = datos, fill = grupo, colour=grupo,
         y=..density..) + 
    geom_histogram(bins=30,alpha = 0.5,
                   position = "identity")+
    labs(title = "Histograma",
     subtitle = "Comparación de Distribuciones Normales",
      x="datos (50 obs para c/u)",
      y="Frecuencia")+
    scale_color_discrete(labels = c("N(0,1)", "N(3,1)")) +
    scale_fill_discrete(labels = c("N(0,1)", "N(3,1)"))+
    guides(fill = guide_legend(title = "Distribuciones"),
           colour = guide_legend(title = "Distribuciones"))+
    theme_bw()
histo1

# 2. Ahora replique el ejercicio anterior para una base de datos
# de 2000 ¿Qué puede observar?
# Indicación: muestre los 2 histogramas en una misma ventana
# para esto utilice el paquete patchwork

set.seed(2022)
var1.2 <- rnorm(1000, mean=0, sd=1)
var2.2 <- rnorm(1000, mean = 3, sd=1)
datos2 <- c(var1.2, var2.2)
grupo2 <- c(rep("N(0,1)", 1000), rep("N(3,1)", 1000))
base2 <- data.frame(datos2, distribucion = grupo2)

# histogramas
histo2 <- base2 %>% ggplot()+
    aes(x = datos2, fill = grupo2, colour=grupo2,
        y=..density..) + 
    geom_histogram(bins=30,alpha = 0.5,
                   position = "identity")+
    labs(title = "Histograma",
         subtitle = "Comparación de Distribuciones Normales",
         x="datos (1000 obs para c/u)",
         y="Frecuencia")+
    scale_color_discrete(labels = c("N(0,1)", "N(3,1)")) +
    scale_fill_discrete(labels = c("N(0,1)", "N(3,1)"))+
    guides(fill = guide_legend(title = "Distribuciones"),
           colour = guide_legend(title = "Distribuciones"))+
    theme_bw()

# mostramos ambos gráficos en una misma ventana
library(patchwork)
histo1/histo2

# 3. Realice dos histogramas en la misma ventana para 
# la última muestra. Utilice facet_grid

ggplot(data = base2)+
    aes(x = datos2, y=..density..,fill = grupo2,
        colour=grupo2) +
    geom_histogram(bins=30,alpha = 0.5,
                   position = "identity") +
    facet_grid(~ distribucion)+
    labs(title = "Histograma",
         subtitle = "Comparación de Distribuciones Normales",
         x="datos (1000 obs para c/u)",
         y="Frecuencia")+
    theme_bw()+
    theme(legend.position = "none")



