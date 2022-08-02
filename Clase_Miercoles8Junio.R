#Nombre: Daniela 

#Crear funcion
suma <- function(x,y){
  x+y
  }
#Utilizo la función
suma(2,3)

#Crear  función condicional 
condicion <- function(x){
  if(x >= 4){
    print('Aprobó el curso de programación')
  }
  else{
    print('Reprobó el curso de programación')
  }
}

condicion(4.1)
condicion(3.1)

#Funcion Actividad 1
trozos <- function(x){
  if(x<4){
    print(2*x+1)
  }
  else{
    x*x-2
  }
}

#Función con palabras
g <- function(Sexo, Edad, Altura, Peso){
  if(Sexo == 'mujer'){
    655 +(9.6*Peso) + (1.8*Altura) - (4.7*Edad)
  }
  else{
    66 + (13.7*Peso) + (5* Altura) - (6.8*Edad)
  }
}

#Usar la función
g('mujer', 21, 1.5, 62.4)


#Función para calcular promedio 

situacion <- function(T1, T2, S1, S2, E){
  promedio = T1*0.15 + T2*0.15 + S1*0.2 + S2*0.2 + E*0.3
  if(promedio >= 4){
    print('Aprobado')
  }
  else{
    print('Reprobado')
  }
}
situacion(1, 6.5, 4.2, 5, 3)
