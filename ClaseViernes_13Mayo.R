#Nombre: Daniela Ponce

#Cargar Base de datos desde R
tipos_ojos <- data.frame(HairEyeColor)
                         
#Función y = &
#Pregunta: ?Quienes tienen hair Red y eye blue?
tipos_ojos[,1] == 'Red' & tipos_ojos[,2] == 'Blue'
tipos_ojos[tipos_ojos[,1] == 'Red' & tipos_ojos[,2] == 'Blue', ]

#Funci?n ? = |
#Pregunta: ?Qu? observaciones cumplen con sex Male ? Hair red?
tipos_ojos[ ,3] == 'Male' | tipos_ojos[,1] == 'Red'
tipos_ojos[tipos_ojos[,3] == 'Male' | tipos_ojos[,1] == 'Red', ]

#Negaci?n: !=
#Pregunta: ?Qu? observaciones tienen Eye distinto de Blue?
tipos_ojos[ ,2] != 'Blue'
tipos_ojos[tipos_ojos[ ,2] != 'Blue', ]

#Actividad: Calcular el promedio de personas que tienen 
#           Eye Hazel
#???Recordar que el promedio se calcula con mean()???
#Selecciono a las personas que cumplen la condici?n
tipos_ojos[,2] == 'Hazel'
#En la base de datos selecciono a las personas
tipos_ojos[tipos_ojos[,2] == 'Hazel',4]
#Calculo el promedio
mean(tipos_ojos[tipos_ojos[,2] == 'Hazel',4])

#Indexaci?n con variables num?ricas
#Pregunta: ?Qu? observciones tienes frecuencia mayor a 50?
tipos_ojos[tipos_ojos[,4] > 50, ]

#Como agregar una columna modificada en R
#Agregar? la columna de nombre Triple_Freq
tipos_ojos$Triple_Freq = 3*tipos_ojos$Freq
head(tipos_ojos)

tipos_ojos$Hair = 1
head(tipos_ojos)

tipos_ojos$Hoy = 'Viernes 11 mayo'
head(tipos_ojos)

#-----Actividad-----
arbol <- data.frame(trees)

#Pregunta 1: 
arbol[arbol[,3]>25, 2]
#Pregunta 2:
mean(arbol[arbol[,3]>25, 2])
#Pregunta 3:
length(arbol[arbol[,1]<13 & arbol[,3]>20,2])
