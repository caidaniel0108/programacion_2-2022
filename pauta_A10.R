# 1. 
suma <- function(x,y,z){
  x+y+z
}

# 2.
raiz <- function(x){
  sqrt(x)
}

# 3.
IMC <- function(altura,peso){
  peso/(altura)^2
}

# 4.
condicion <- function(x){
  if(x >= 6.3){
    print("Aprobó el curso")
  }
  else{
    print("Reprobó el curso")
  }
}
condicion(2.4)

# 5.
mayor <- function(x,y){
  if(x>y){
    cat(x,"es mayor que",y)
  }
  else{
    cat(y,"es mayor que",x)
  }
}

# 6.
mis_ahorros <- function(sexo,promo,cerveza,energetica, agua){
  if(sexo=="MUJER"){
    entrada=0
    total=entrada+promo*15000+cerveza*4000+energetica*5000+agua*2000
  }
  else{
    entrada=5000
    total=entrada+promo*15000+cerveza*4000+energetica*5000+agua*2000
  }
  cat("El cliente consumió","$",total)
}
mis_ahorros("HOMBRE",0,4,0,2)