#Nombre: Daniela Ponce

#Ciclo while
variable <- 1
while(variable< 10){
  print(paste('La variable es:',variable))
  variable <- variable + 1
}

#Ciclo for
for(i in 1:10){
  print(paste('La variable es:',i))
}

a = c(19,3, 5, 6)
for(i in 1:4){ # desde 1 a 4
  if(a[i]%% 3 == 0){ # si los numeros son divisibles en 3
    print(paste(a[i],'es divisible por 3'))
  }
  else{
    print(paste(a[i],'no es divisible por 3'))
  }
}

i = 1
count <-  0
while(count == 0 ){
  if(a[i] %% 3 == 0){
    print(paste(a[i],'es divisible por 3'))
    count <- 100
  }
  else{
    i = i+ 1
  }
}

#Actividad 1
df = iris
for(x in iris$Petal.Length){
  if(x < 1.3){
    print(paste('encontramos uno!:',x ))
  }
}

#Actividad 2
list.files("~/Desktop")
archivos <- list.files('~/Desktop/UDP/AYUDANTÍA_PROGRA/Clase23')

library(readxl)

for(ar in archivos){
  nombre_completo <- paste0("~/Desktop/UDP/AYUDANTÍA_PROGRA/Clase23",ar)
  este_df <- read_excel(nombre_completo)
  print(pase0("las primeras 6 filas del archivo son", head(este_df)))
}
