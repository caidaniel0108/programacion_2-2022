# 1. PRIMOS
primo <- function(numero) {
  contador <- 0
  
  for (i in 0:numero) {
    if (numero %% (i+1) != 0) {
      next
    } else {
      contador <- contador + 1
    }
  }
  if (contador == 2) {
    print('Es primo')
  } else {
    print('No es primo')
  }
}


run <- function() {
  numero <- as.integer(readline('Ingrese un número: '))
  primo(numero)
}
 
run()
primo(3)




# 2. AREA
# forma 1
area <- function(figura,base,altura){
  if(figura=="cuadrado"){
    area=base^2
    cat("el area es", area)
  }
  else if(figura=="triangulo"){
    area=(base*altura)/2
    cat("el area es", area)
  }
  else if(figura=="rectangulo"){
    area=base*altura
    cat("el area es", area)
  }
}
area("cuadrado",2,2)
area("rectangulo",2,4)
area("triangulo",2,4)

# forma 2
area <- function(lados,base,altura){
  if(lados==4 & base!=altura){
    area=base*altura
    cat("la figura es un rectángulo y su área es",area)
  }
  else if(lados==4 & base==altura){
    area=base*altura
    cat("la figura es un cuadrado y su área es",area)
  }
  else if(lados==3){
    area=((base*altura)/2)
    cat("la figura es un triangulo y su área es",area)
  }
}

area(4,2,4)







# Los trabajadores de una empresa necesitan saber cuál es su pago final luego
# de impuestos y bonos. Cree una función que permita ingresar el sueldo
# de un trabajador y entregue lo que finalmente obtendrá.
# Se tienen los siguientes datos:
#   
# - El sueldo base es de $230.000 pesos.
# - El impuesto es de un 10% para todos los empleados.
# - Para aquellos empleados que ganen $400 mil pesos o menos (sueldo+sueldo base), el bono es de $250.000 pesos.
# - Para aquellos empleados que ganen más de $400 mil pesos y menos de $800.000 pesos, el bono es el 30% del sueldo.
# - Para aquellos trabajadores que ganen $800.000 pesos o más, el bono es del 20% de su sueldo.



sueldo <- function(sueldo_trabajador){
  sueldo_trabajador = sueldo_trabajador + 230000
  sueldo_despues_imp = sueldo_trabajador - sueldo_trabajador*0.1
  if(sueldo_despues_imp <=400000){
    sueldo_final = sueldo_despues_imp + 250000
    cat("Su salario final es", sueldo_final)
  }
  else if(sueldo_despues_imp>400000 & sueldo_despues_imp<=800000){
    sueldo_final = sueldo_despues_imp + sueldo_despues_imp*0.3
    cat("Su salario final es", sueldo_final)
  }
  else if(sueldo_despues_imp > 800000){
    sueldo_final = sueldo_despues_imp + sueldo_despues_imp*0.2
    cat("Su salario final es", sueldo_final)
  }
}

sueldo(100000)






sueldo <- function(x){
  x <- x + 230000
  x_si <- x - x*0.1
  if(x_si<=400000){
    sueldo_final = x_si + 250000
    print(paste("Su sueldo final es de", sueldo_final))
  }
  else if(x_si > 400000 & x_si <= 800000){
    sueldo_final = x_si + x_si*0.3
    print(paste("Su sueldo final es de", sueldo_final))
  }
  else{
    sueldo_final = x_si + x_si*0.2
    print(paste("Su sueldo final es de", sueldo_final))
  }
}

sueldo(300000)








sueldo_final <- function(x){
  sueldo <- x + 230000
  if(sueldo<=400000){
    sueldo_final= sueldo + 250000
    cat("EL sueldo final es", sueldo_final)
  }
  else if(sueldo>400000 & sueldo<800000){
    sueldo_final= sueldo + sueldo*0.3
    cat("El sueldo final es", sueldo_final)
  }
  else{
    sueldo_final= sueldo + sueldo*0.2
    cat("El sueldo final es", sueldo_final)
  }
}
sueldo_final(800000)
