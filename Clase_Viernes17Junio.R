#Nombre: Daniela Ponce

#Calcular el primer numero que al cuadrado excede 4000. 
x <- 1
while(x^2 < 4000){ # mientras x^2 sea menor que 4000
  x <- x+1         # asignar a x el valor para x^2 + 1
}
print(paste('El valor es:', x))

#Calcular los primeros 100 números de la serie de fibonacci
x <- c(0,1) # x toma los valores 0 y 1.
for(i in 1:98){ # de 1 a 98
  x[i+2] = x[i] + x[i+1] # de 2 a 100
}
x

