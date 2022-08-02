# 1.1
vector <- seq(0,1500,3)
# 1.2
vector.ejercicio.1 <- vector[vector<1000]
sum(vector<1000)
# 1.3
vector.ejercicio.2 <- vector[vector>=100 & vector<=200 & vector%%7==0]
# 1.4 
resultado.1 <- sum(vector>=670 & vector<=900 & vector%%3==0)

# 2.1
df <- swiss
# 2.2
head(df)
# Son todas numéricas

# 2.3
df.ejercicio.1 <- df[(df[,4]==2 | df[,4]==3) & (df[,3]==3 | df[,3]==7),]

#2.4
df.ejercicio.2 <- df[df[,3]==16 | df[,6]>=22,]

#2.5
resultado.2 <- mean(df[(df[,4]==2 | df[,4]==3) & (df[,3]==3 | df[,3]==7),]$Fertility)
resultado.3 <- mean(df[df[,3]==16 | df[,6]>=22,]$Fertility)
