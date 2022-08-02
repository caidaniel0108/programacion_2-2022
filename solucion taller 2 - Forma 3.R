# 1.1 Genere un vector con la siguiente serie de números: 0,3,6,9,12,15,…,1500. Guárdelo con el nombre “vector” (6 puntos)
vector <- 0:500*3
# 1.2 Encuentre los números que son menores a 1000 y guárdelos en el elemento “vector.ejercicio.1”. Calcule además la cantidad de elementos que cumplen la condición solicitada (7 puntos)
vector.ejercicio.1 <- vector[vector<1000]
sum(vector<1000)
# 1.3 Encuentre los números que son divisibles por 7 y que se encuentran entre 100 y 200. El resultado de los números que cumplen las condiciones debe guardarse en un vector llamado “vector.ejercicio.2” (8 puntos)
vector.ejercicio.2 <- vector[vector%%7==0&vector>=100&vector<=200]
# 1.4 Calcule la suma de elementos que cumplen la condición solicitada anteriormente y guarde el resultado en la variable “resultado.1” (4 puntos)
resultado.1 <- sum(vector%%7==0&vector>=100&vector<=200)
# 2.1 Cargue el dataframe de nombre “swiss”, el cual se encuentra ya cargado en R. Asígnele una nueva variable que se llame “df” (3 puntos)
df <- swiss
# 2.2 
head(df)
# Las variables Fertility, Agriculture, Catholic y Infant.Mortalityson de tipo decimal
# Las variables Examination y Education son de tipo entero
# 2.3 Genere un dataframe que tenga los registros cuya variable “Education” sea “2” o “3”, y que la variable “Examination” sea “3” o “7”. Guarde sus resultados en una variable de nombre “df.ejercicio.1” (9 puntos)
df.ejercicio.1 <- df[(df$Education %in% c(2,3))&(df$Examination %in% c(3,7)),]
# 2.4 Genere un dataframe que tenga los registros cuya variable “Examination” sea “16” o que la variable “Infant.Mortality” sea mayor a 22. Guarde sus resultados en una variable de nombre “df.ejercicio.2” (9 puntos)
df.ejercicio.2 <- df[(df$Examination==16)|(df$Infant.Mortality>22),]
# 2.5 Calcule el promedio de la variable “Fertility” de aquellos registros que cumplen la condición solicitada en las dos preguntas anteriores, y guárdelos en las variables “resultado.2” y “resultado.3” (7 puntos)
mean(df.ejercicio.1$Fertility)
mean(df.ejercicio.2$Fertility)
