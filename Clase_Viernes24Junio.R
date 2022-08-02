#nOMBRE: dANIELA pONCE

#installed.packages('ggplot2')
library(ggplot2)

df <- mtcars 
df$cyl <- as.factor(df$cyl)

ggplot(data = df, mapping = aes(x = mpg, y = hp, col = cyl)) +
  geom_point() + 
  labs(title = 'Título',
       x = 'Eje X', 
       y = 'Eje Y', 
       col = 'Leyenda') +
  theme_bw() + 
  theme(legend.position = 'bottom', 
        plot.title.position = 'center') 

df1 <- iris
ggplot(data = df1, mapping = aes(x = Petal.Length, y = Sepal.Length, col= Species)) + 
  geom_point() +
  labs(title = 'Pétalo versus Sepal')


ggplot(data = df, mapping = aes(x= wt, y = mpg , col = cyl)) +
  geom_point()
