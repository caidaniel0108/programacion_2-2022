#Ayudantia semana 27-06
# Tony Soprano lo ha invitado a usted a jugar a los dados. Las reglas del juego son muy simples. Se lanza
# un dado. Si sale par, gana la casa (Tony). En caso contrario, gana la visita (usted). Inicialmente, el
# juego le parecía bastante parejo. A veces ganaba Tony, otras ganaba usted. Sin embargo, de cuando
# en cuando, la fortuna parecía sonreírle mucho más a la casa. Tony tenía dos dados para jugar, uno
# azul y uno rojo, que alternaba con frecuencia. Usted sospechaba que había algo raro, pero claro, no es
# conveniente para la salud acusar a Tony de hacer trampa en su propia casa.
# En el archivo ”Dados.xlsx”, se encuentra el resultado de 100 lanzamientos para cada uno de
# los dados. En base a esta información, ¿existe evidencia de que alguno de los dados esté trucado?

install.packages("dplyr")
library(dplyr)
library(tidyverse)
library(tidyr)
library(dslabs)
library(dslabs)
library(ggplot2)
library(readxl)

library(readxl)
Dados <- read_excel("Magister/Ayudant�a progra/Dados.xlsx")
View(Dados)


dadoazul <- select(Dados, Lanzamiento, `Dado Azul`)
dadoazul <- dadoazul %>% mutate(subgruop = "Dado Azul")
names(dadoazul) <- c("Lanzamiento", "Numero", "Dado")

dadorojo <- select(Dados, Lanzamiento, `Dado Rojo`)
dadorojo <- dadorojo %>% mutate(subgruop = "Dado Rojo")
names(dadorojo) <- c("Lanzamiento", "Numero", "Dado")

dados2 <- rbind(dadoazul,dadorojo)


# 1.Realice un histograma de los resultados de los lanzamientos para cada uno de los dados.
#recuerde que:
#Un histograma es similar en apariencia a un diagrama de barras, 
#pero en lugar de comparar categor�as o buscar tendencias a lo largo del tiempo,
#cada barra representa c�mo se distribuyen los datos en una �nica categor�a.
ggplot(data = dados2,
       mapping = aes(x = Numero, fill = Dado)) +
  geom_histogram(binwidth=0.5, position = 'dodge') +
  scale_x_continuous(breaks=seq(1,6,1)) +
  scale_y_continuous(breaks=seq(0,30,5)) +
  scale_fill_manual(name = "Dado", values = c("Blue", "Red"),
                    labels = c("Dado Azul", "Dado Rojo")) +
  labs(title = 'Dados Azul y Rojo',
       x = 'Numero del Dado',
       y = 'Lanzamientos',)


# 2. Superponga a este histograma la distribución teórica de este ”experimento”. Si el dado no está
# trucado, los resultados deberían ser consistente con una distribución uniforme, con cada una de
# las caras con la misma probabilidad (1/6) de ocurrencia.
#Tenga en cuenta que:
#Una distribuci�n te�rica de probabilidad describe el reparto de 
#los valores de una variable aleatoria en una poblaci�n
#esta puede ser simetrica, asimetrica a la izquierda y asimetrica a la derecha

ggplot(data = dados2,
       mapping = aes(x = Numero, fill = Dado)) +
  geom_histogram(binwidth=0.5, position = 'dodge') +
  geom_line(aes(y = 100/6, color = "Tendencia", group = 1)) +
  scale_colour_manual(name = "", values = "Green", labels = "Distribuci�n Teorica") +
  scale_x_continuous(breaks=seq(1,6,1)) +
  scale_y_continuous(breaks=seq(0,30,5)) +
  scale_fill_manual(name = "Dado", values = c("Blue", "Red"),
                    labels = c("Dado Azul", "Dado Rojo")) +
  labs(title = 'Dados Azul y Rojo',
       x = 'Numero del Dado',
       y = 'Lanzamientos',)




# 3. Realice un gráfico ggplot de los resultados de los lanzamientos para cada uno de los dados. No
# puede utilizar una rutina pre-programada en R. Por ejemplo, no puede utilizar la función genérica ggplot u otra 
# similar. Usted debe codificar su propio gráfico. ¿Cómo esperaría usted que fuesen los gráficos ggplot para un dado 
# ”justo” y un dado ”trucado”?

ggplot(data = dados2,
       mapping = aes(x = Numero, fill = Dado)) +
  geom_histogram(binwidth=0.5, position = 'dodge') +
  geom_line(aes(y = 100/6, color = "Tendencia", group = 1)) +
  scale_colour_manual(name = "", values = "Green", labels = "Distribuci�n Teorica") +
  scale_x_continuous(breaks=seq(1,6,1)) +
  scale_y_continuous(breaks=seq(0,30,5)) +
  scale_fill_manual(name = "Dado", values = c("Blue", "Red"),
                    labels = c("Dado Azul", "Dado Rojo")) +
  labs(title = 'Dados Azul y Rojo',
       x = 'Numero del Dado',
       y = 'Lanzamientos',)

#Dado trucado vs Ajustado
dados2 %>% group_by(Numero) %>% count() %>%
  ggplot(aes(x = Numero, y = n)) + 
  geom_line(aes(colour = "Trucado")) +
  geom_line(aes(y = 200/6, color = "Ajustado (Teorico)", group = 1)) +
  scale_x_continuous(breaks=seq(1,6,1)) +
  scale_y_continuous(breaks=seq(0,50,5)) +
  labs(title = 'Dados Trucados vs Ajustado',
       x = 'Numero del Dado',
       colour = "Dados",
       y = 'Lanzamientos',)


# Para llevar a cabo su informe, imagine que tiene que convencer a un jurado, a través de gráficos, que
# Tony hace trampa. ¡Buena suerte!


#Ejercicio 2
library(readxl)
Df1 <- read_excel("Magister/Ayudant�a progra/Ayudantia semana 27-06.xlsx")
View(Df1)

#Graficos de barra
    
tabla <- table(Df1$Categoria)     
barp <- barplot(tabla, 
                col = c("royalblue", "seagreen", "yellow", "grey", "black"), 
                main = 'Categoria', 
                xlab = 'Tipo de categoria', 
                ylab = 'cantidad', 
                ylim = c(0,70))
text(barp, tabla + 0.8, label = tabla)

#Grafico de torta
pie(tabla, 
    col= c("royalblue", "seagreen", "yellow", "grey", "black"),
    main = 't�tulo', 
    labels = c('bronce', 'diamante', 'oro', 'plata', 'platino'))

#Leyendas
barplot(tabla,  main = "Categoria",
        xlab = "Tipo de categoria", ylab = "Proporci�n",  ylim = c(0,70),
        col = c("royalblue", "seagreen", "yellow", "grey", "black"))
legend(x = "topright", legend = c('bronce', 'diamante', 'oro', 'plata', 'platino'),
       fill = c("royalblue", "seagreen", "yellow", "grey", "black"), cex = 0.5, 
       title = "leyenda")


