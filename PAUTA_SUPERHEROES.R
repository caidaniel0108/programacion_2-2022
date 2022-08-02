library(readr)
super_heroes <- read_csv("~/Downloads/super heroes.csv", 
                         col_types = cols(Height = col_number(), 
                                          Weight = col_number()))
View(super_heroes)
# a. Describir la base de datos y sus variables ¿Qué significa cada variable?
# "...1" representa el número de fila de la observación.
# "name" es el nombre del superhéroe/villano.
# "Gender" es el género del superhéroe.
# "Eye color" representa el color de ojos del superhéroe.
# "Race" es el tipo de raza del superhéroe.
# "Hair color" es el color de pelo del superhéroe.
# "Height" es la altura en CENTÍMETROS del superhéroe.
# "Publisher" representa la editorial del superhéroe.
# "Skin color" es el color de piel del superhéroe.
# "Alignment" es el tipo de personaje: bueno o malo.
# "Weight" es el peso del superhéroe.


#   2. Identificar y interpretar los siguientes datos:

# a. El valor de la columna 5 fila 105.
super_heroes[105,5]
# b. Los primeros cincuenta valores de la columna "Race" y los últimos 50.
head(super_heroes,50) #primeros 50
tail(super_heroes,50) #últimos 50
# c. Los datos de la fila 125.
super_heroes[125,]
# d. Los datos de la columna "Publisher"
super_heroes[,8] #forma 1
super_heroes$Publisher #forma 2
# e. Los datos de la columna "Name" y "Gender" de las filas 55 a la 75.
super_heroes[55:75,c(2,3)]
# f. El más alto de los super heroes.
max(super_heroes$Height)
# g. El promedio de altura de los super heroes.
mean(super_heroes$Height)


# 3. Mediante sentencias lógicas encontrar:

# a. Los superhéroes únicamente mutantes.
super_heroes[super_heroes$Race=="Mutant",] #forma 1
super_heroes[super_heroes[,5]=="Mutant",] #forma 2
# b. Los superhéroes publicados por Marvel.
super_heroes[super_heroes$Publisher=="Marvel Comics",] #forma 1
super_heroes[super_heroes[,8]=="Marvel Comics",] #forma 2
# c. Los superhéroes hombres de sin cabello.
super_heroes[super_heroes$`Hair color`=="No Hair",] #forma 1
super_heroes[super_heroes[,6] =="No Hair",] #forma 2
# d. Las superheroínas mujeres de ojos rojos.
super_heroes[super_heroes$Gender=="Female",] #forma 1
super_heroes[super_heroes[,3] =="Female",] #forma 2
# e. Los y las heroínas de piel azul.
super_heroes[super_heroes$`Skin color`=="blue",] #forma 1
super_heroes[super_heroes[,9] =="blue",] #forma 2
# f. Las mujeres de cabellos café, ojos azules.
super_heroes[super_heroes$Gender=="Female" & super_heroes$`Eye color`=="blue",] #forma 1
super_heroes[super_heroes[,3] =="Female" & super_heroes[,4] =="blue",] #forma 2
# g. Los superhéroes hombres publicados por Image Comics que se pasaran al Mal.
super_heroes[super_heroes$Gender=="Male" & super_heroes$Publisher=="Image Comics" & super_heroes$Alignment=="bad",] #forma 1
super_heroes[super_heroes[,3] =="Male" & super_heroes[,8] =="Image Comics" & super_heroes[,10] =="bad",] #forma 2
# h. Las o los villanos de piel y ojos rojos.
super_heroes[super_heroes$Alignment=="bad" & super_heroes$`Skin color`=="red" & super_heroes$`Eye color`=="red",] #forma 1
super_heroes[super_heroes[,10]=="bad" & super_heroes[,9]=="red" & super_heroes[,4]=="red",] #forma 2
# i. La cantidad de superhéroes NO publicados ni por Marvel ni DC comics.
super_heroes[super_heroes$Publisher!="Marvel Comics" & super_heroes$Publisher!="DC comics",] #forma 1
super_heroes[super_heroes[,8]!="Marvel Comics" & super_heroes[,8]!="DC Comics",] #forma 2
sum(super_heroes[,8]!="Marvel Comics" & super_heroes[,8]!="DC Comics", na.rm = TRUE) #cantidad de héroes
table(super_heroes[,8]!="Marvel Comics" & super_heroes[,8]!="DC Comics") #forma 2 de contar la cantidad
