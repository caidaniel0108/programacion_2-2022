# Cargue la base de datos "census" del paquete "openintro"
datos <- openintro::census
datos <- datos[1:100,]


# 1. Explore la base con al menos 3 funciones.
head(datos)
colnames(datos)
rownames(datos)
length(datos)
glimpse(datos)

# 2. Calcule el promedio, la mediana, el máximo y el mínimo de las variables numéricas CORRESPONDIENTES.
tabla <- tibble(mean_ing_fam=mean(datos$total_family_income, na.rm = TRUE),
             median_ing_fam=median(datos$total_family_income, na.rm = TRUE),
             max_ing_fam=max(datos$total_family_income, na.rm = TRUE),
             min_ing_fam=min(datos$total_family_income, na.rm = TRUE),
             mean_age=mean(datos$age, na.rm = TRUE),
             median_age=median(datos$age, na.rm = TRUE),
             max_age=max(datos$age, na.rm = TRUE),
             min_age=min(datos$age, na.rm = TRUE),
             mean_ing_per=mean(datos$total_personal_income, na.rm = TRUE),
             median_ing_per=median(datos$total_personal_income, na.rm = TRUE),
             max_ing_per=max(datos$total_personal_income, na.rm = TRUE),
             min_ing_per=min(datos$total_personal_income, na.rm = TRUE))
View(tabla)


# 3. Encuentre el sexo de la persona censada número 10.
datos[10,5]

# 4. Cree un dataframe llamado "alabama" con los datos para las personas
#    del estado de "Alabama". PISTA: debe poner la condición "Alabama" en
#    la variable "state_fips_code".
alabama <- base_censo[base_censo$state_fips_code=="Alabama",]


# 5. Cree un data.frame llamado "first_10" que contenga las primeras 10 filas
#    de las variables "sex" y "total_personal_income"
first_10 <- datos[1:10,c(5,8)]

