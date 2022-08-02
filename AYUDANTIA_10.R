#### FUNCIONES ####
# Estructura de una función #
nombre_de_funcion <- function(parametro1,parametro2){
  parametro1+parametro2 #podria ser cualquier operacion matematica
}

# Actividades #
# 1. Cree una función que sume 3 números.
suma <- function(a,b,c){
  a+b+c
}
suma(2,3,1)
# 2. Cree una función que calcule la raíz cuadrada de un número.
raiz <- function(x){
  sqrt(x)
}
raiz(4)

# 3. Cree una función para calcular el IMC.
#    (El IMC se calcula dividiendo los kg por la estatura al cuadrado (m2)).
IMC <- function(peso,altura){
  peso/(altura)^2
}

IMC(50,1.60)
# 4. Si para aprobar un ramo usted necesita un 6.3, pero obtuvo un 2.4:
#    cree una función para saber si aprobó o reprobó el ramo.
situacion <- function(nota){
  if(nota>=6.3){
    print("aprobado")
  }
  else{
    print("reprobado")
  }
}
situacion(2.4)
# 5. Cree una función que reciba 2 números reales y diga cuál de los dos
#    es mayor (asumiendo que son numeros distintos).
funcion5 <- function(a,b){
  if(a>b){
    print("a es mayor que b")
  }
  else{
    print("b es mayor que a")
  }
}
funcion5(5,6)
# 6. En una disco, la entrada a mujeres es gratis hasta las 10 de la noche y
#    a los hombres se les cobra 5 mil pesos. Además, sólo hay promo
#    de pisco a 15 mil pesos, cerveza a 4 mil pesos, energética a 5 mil pesos
#    y botellas de agua a 2 mil pesos.
#    Cree una función para calcular cuánto gastaría un cliente en una noche
#    si se sabe que es hombre y consumió 4 cervezas y 2 aguas, asumiendo
#    que entró a las 9 p.m.



# matias abreu 0.2
# BONUS DÉCIMAS.