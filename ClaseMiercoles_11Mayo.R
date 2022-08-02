#Nombre: Daniela Ponce

#Library es para activar la libreria readxl
library(readxl)
dir_file = "C:/Users/Profesor/Downloads/laboral.xlsx"
laboral <- read_excel(dir_file)
#Para visualizar la base de datos
print(laboral)
head(laboral)

#Para referenciar una columna
laboral$nombre
#Para hacer referencia a un elemnto
laboral[2,4]
#Para seleccionar un fila completa
laboral[5, 1:4]
laboral[5, ]
laboral[5,seq(from = 1, to = 4, by = 1)]
#Para seleccionar una columa
laboral[1:5, 2]
laboral[ , 2]
#Para seleccionar un estracto de columa
laboral[1:2, 1]
#Para selecionar estractos no continuos
laboral[c(1,3,4),3]
#Para extraer elementos que cumplen una condición
laboral[ , 3] == 'asistente'
laboral[laboral[ , 3] == 'asistente', ]
#Estraigan el salario de juanín
laboral[ ,1] == 'juanín'
laboral[laboral[ ,1] == 'juanín', 4]
##----- CAMBIEMOS LA BASE DE DATOS-------

#cARGE BASE DE DATOS QUE ESTÁ EN R
TIPOS_OJOS <- data.frame(HairEyeColor)
#EXTRAER LAS OBSERVACIONES QEU TIENE PELO RED
#Y SEXO MALE
#función y = &
TIPOS_OJOS[ ,1] == 'Red' & TIPOS_OJOS[ ,3] =='Male'
TIPOS_OJOS[ TIPOS_OJOS[ ,1] == 'Red' & TIPOS_OJOS[ ,3] =='Male', ]
#función ó = |
TIPOS_OJOS[ , 1] == 'Red' | TIPOS_OJOS[ , 1] == 'Blond'
TIPOS_OJOS[TIPOS_OJOS[ , 1] == 'Red' | TIPOS_OJOS[ , 1] == 'Blond', ]
#Distinto
TIPOS_OJOS[ ,1] !='Blond'
TIPOS_OJOS[TIPOS_OJOS[ ,1] !='Blond', ]

