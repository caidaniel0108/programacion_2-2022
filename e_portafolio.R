
# CARGAR BASE DE DATOS ####
library(readxl)
original <- read_excel("~/Downloads/OFICIAL_WEB_PROCESO_MAT_2021_29_06_2021.xlsx")
owpm$`A—O`=NULL
# RENOMBRAR VARIABLES ####
library(dplyr)
owpm <- original %>% 
  rename(total_matriculados_pp=`TOTAL MATRICULADOS`,
         mujeres_matriculadas_pp=`MATRICULADOS MUJERES POR PROGRAMA`,
         hombres_matriculados_pp=`MATRICULADOS HOMBRES POR PROGRAMA`,
         total_matriculados_pa=`TOTAL MATRICULADOS PRIMER A—O`,
         mujeres_matriculadas_pa=`MATRICULADOS MUJERES PRIMER A—O`,
         hombres_matriculados_pa=`MATRICULADOS HOMBRES PRIMER A—O`,
         institucion= `NOMBRE INSTITUCI”N`,
         region= `REGI”N`,
         provincia= PROVINCIA,
         comuna= COMUNA,
         nombre_carrera= `NOMBRE CARRERA`,
         area_conocimiento =`¡REA DEL CONOCIMIENTO`,
         jornada=JORNADA,
         edad_15_19=`RANGO DE EDAD 15 A 19 A—OS`,
         "edad_20_24"=`RANGO DE EDAD 20 A 24 A—OS`,
         "edad_25_29"=`RANGO DE EDAD 25 A 29 A—OS`,
         "edad_30_34"=`RANGO DE EDAD 30 A 34 A—OS`,
         "edad_35_39"=`RANGO DE EDAD 35 A 39 A—OS`,
         "edad_40_mas"=`RANGO DE EDAD 40 Y M¡S A—OS`,
         tipo_carrera=`NIVEL GLOBAL`,
         duracion=`DURACI”N ESTUDIO CARRERA`,
         municipal=`TES MUNICIPAL`,
         subvencionado = `TES PARTICULAR SUBVENCIONADO`,
         particular = `TES PARTICULAR PAGADO`,
         tecnico = `TIPO ESTABLECIMIENTO TP`,
         humanista_cientifico = `TIPO ESTABLECIMIENTO HC`,
         acreditacion = `ACREDITACI”N CARRERA`)
# matriculados primer año hombres y mujeres
# rangos etarios
# jornada: diurna o vespertina
# nombre carrera 
# institucion
# area de conocimiento

# SELECCIONAR VARIABLES ####
owpm <- owpm %>% 
  select(total_matriculados_pp,
         mujeres_matriculadas_pp,
         total_matriculados_pa,
         hombres_matriculados_pp,
         hombres_matriculados_pa,
         mujeres_matriculadas_pa,
         edad_15_19, edad_20_24, edad_25_29, edad_30_34,
         edad_35_39, edad_40_mas,
         institucion,
         nombre_carrera,
         area_conocimiento,
         jornada,
         tipo_carrera,
         duracion,
         municipal,
         subvencionado,
         particular,
         tecnico,
         humanista_cientifico,
         acreditacion)

# FILTRAMOS para: 

# CFT Los lagos
# IP Los Lagos
# Universidad Ándres Bello
# Universidad de las Américas
# Universidad San Sebastián 

# FILTRAMOS PARA LAS INSTITUCIONES ASIGNADAS ####
owpm <- owpm %>% 
  filter(institucion=="CFT SANTO TOMAS" |
           institucion== "IP IPG" |
           institucion=="UNIVERSIDAD CATOLICA DEL NORTE"|
           institucion=="UNIVERSIDAD ARTURO PRAT"|
           institucion=="UNIVERSIDAD AUTONOMA DE CHILE")

# QUITAMOS NA's ####
owpm[is.na(owpm)] <- 0 # NA's = 0

# 5. PERFIL DEL ESTUDIANTE ####
# a) Rango etario de los estudiantes matriculados ----
owpm %>%
  group_by(institucion) %>% 
  summarise("De 15 a 19 años" = sum(edad_15_19),
            "De 20 a 24 años" = sum(edad_20_24),
            "De 25 a 29 años" = sum(edad_25_29),
            "De 30 a 34 años" = sum(edad_30_34),
            "De 35 a 39 años" = sum(edad_35_39),
            "De 40 o más años" = sum(edad_40_mas)) %>% 
  kable() %>% 
  kable_styling()


# b) ¿Se estudian más las carreras vespertinas o diurnas? ----
owpm %>% 
  group_by(jornada) %>% 
  summarise(total_matr=sum(total_matriculados_pa)) %>%
  arrange(desc(total_matr)) %>% 
  kable() %>% 
  kable_styling()

# En GENERAL, hay más matriculados para carreras diurnas que
# para carreras vespertinas.

# Ahora para cada institucion
owpm %>% 
  group_by(jornada) %>%
  filter(institucion=="CFT SANTO TOMAS") %>% 
  summarise(total_matr=sum(total_matriculados_pa)) %>%
  arrange(desc(total_matr)) %>% 
  kable() %>% 
  kable_styling()

owpm %>% 
  group_by(jornada) %>%
  filter(institucion=="IP IPG") %>% 
  summarise(total_matr=sum(total_matriculados_pa)) %>%
  arrange(desc(total_matr))

owpm %>% 
  group_by(jornada) %>%
  filter(institucion=="UNIVERSIDAD ARTURO PRAT") %>% 
  summarise(total_matr=sum(total_matriculados_pa)) %>%
  arrange(desc(total_matr))

owpm %>% 
  group_by(jornada) %>%
  filter(institucion=="UNIVERSIDAD AUTONOMA DE CHILE") %>% 
  summarise(total_matr=sum(total_matriculados_pa)) %>%
  arrange(desc(total_matr))

owpm %>% 
  group_by(jornada) %>%
  filter(institucion=="UNIVERSIDAD CATOLICA DEL NORTE") %>% 
  summarise(total_matr=sum(total_matriculados_pa)) %>%
  arrange(desc(total_matr)) 

# c) ¿Qué carrera es la más estudiada por las mujeres? ####
owpm %>% 
  group_by(nombre_carrera) %>% 
  summarise(mujeres=sum(mujeres_matriculadas_pa)) %>% 
  arrange(desc(mujeres))
# PSICOLGIA en general

#Carrera más estudiada por mujeres para cada institucion
owpm %>% 
  filter(institucion=="CFT LOS LAGOS") %>% 
  group_by(nombre_carrera) %>% 
  summarise(mujeres=sum(mujeres_matriculadas_pa)) %>% 
  arrange(desc(mujeres)) # Tec. Educacion Parvularia

owpm %>% 
  filter(institucion=="IP LOS LAGOS") %>% 
  group_by(nombre_carrera) %>% 
  summarise(mujeres=sum(mujeres_matriculadas_pa)) %>% 
  arrange(desc(mujeres)) # Psicopedagogia

owpm %>% 
  filter(institucion=="UNIVERSIDAD ANDRES BELLO") %>% 
  group_by(nombre_carrera) %>% 
  summarise(mujeres=sum(mujeres_matriculadas_pa)) %>% 
  arrange(desc(mujeres)) # Psciologia

owpm %>% 
  filter(institucion=="UNIVERSIDAD DE LAS AMERICAS") %>% 
  group_by(nombre_carrera) %>% 
  summarise(mujeres=sum(mujeres_matriculadas_pa)) %>% 
  arrange(desc(mujeres)) # Enfermeria

owpm %>% 
  filter(institucion=="UNIVERSIDAD SAN SEBASTIAN") %>% 
  group_by(nombre_carrera) %>% 
  summarise(mujeres=sum(mujeres_matriculadas_pa)) %>% 
  arrange(desc(mujeres)) # Ped. Educacion Diferencial

# c.2) Qué carrera es la más estudiada por los hombres? ----
owpm %>% 
  group_by(nombre_carrera) %>% 
  summarise(hombres=sum(hombres_matriculados_pa)) %>% 
  arrange(desc(hombres))
# ING CIVIL INDUSTRIAL en general

### Carrera más estudiada por hombres para cada institucion
owpm %>% 
  filter(institucion=="CFT LOS LAGOS") %>% 
  group_by(nombre_carrera) %>% 
  summarise(hombres=sum(hombres_matriculados_pa)) %>% 
  arrange(desc(hombres)) # Tec. Topografia

owpm %>% 
  filter(institucion=="IP LOS LAGOS") %>% 
  group_by(nombre_carrera) %>% 
  summarise(hombres=sum(hombres_matriculados_pa)) %>% 
  arrange(desc(hombres)) # Tec. Construccion

owpm %>% 
  filter(institucion=="UNIVERSIDAD ANDRES BELLO") %>% 
  group_by(nombre_carrera) %>% 
  summarise(hombres=sum(hombres_matriculados_pa)) %>% 
  arrange(desc(hombres)) # Ing. Civil Industrial

owpm %>% 
  filter(institucion=="UNIVERSIDAD DE LAS AMERICAS") %>% 
  group_by(nombre_carrera) %>% 
  summarise(hombres=sum(hombres_matriculados_pa)) %>% 
  arrange(desc(hombres)) # Derecho

owpm %>% 
  filter(institucion=="UNIVERSIDAD SAN SEBASTIAN") %>% 
  group_by(nombre_carrera) %>% 
  summarise(hombres=sum(hombres_matriculados_pa)) %>% 
  arrange(desc(hombres)) # Psicologia


# 6. PREGUNTAS AGREGADAS ####

# 1. ¿Cual es el area de conocimiento que mas se estudia? ----
owpm %>% 
  group_by(area_conocimiento) %>% 
  summarise(total_matr=sum(total_matriculados_pa)) %>% 
  arrange(desc(total_matr)) # salud por lejos

owpm %>% 
  group_by(area_conocimiento) %>% 
  filter(institucion=="CFT LOS LAGOS") %>% 
  summarise(total_matr=sum(total_matriculados_pa)) %>% 
  arrange(desc(total_matr)) # EDUCACION

owpm %>% 
  group_by(area_conocimiento) %>% 
  filter(institucion=="IP LOS LAGOS") %>% 
  summarise(total_matr=sum(total_matriculados_pa)) %>% 
  arrange(desc(total_matr)) # TECNOLOGIA

owpm %>% 
  group_by(area_conocimiento) %>% 
  filter(institucion=="UNIVERSIDAD ANDRES BELLO") %>% 
  summarise(total_matr=sum(total_matriculados_pa)) %>% 
  arrange(desc(total_matr)) # SALUD

owpm %>% 
  group_by(area_conocimiento) %>% 
  filter(institucion=="UNIVERSIDAD DE LAS AMERICAS") %>% 
  summarise(total_matr=sum(total_matriculados_pa)) %>% 
  arrange(desc(total_matr)) # SALUD

owpm %>% 
  group_by(area_conocimiento) %>% 
  filter(institucion=="UNIVERSIDAD SAN SEBASTIAN") %>% 
  summarise(total_matr=sum(total_matriculados_pa)) %>% 
  arrange(desc(total_matr)) # SALUD

# 2. Cantidad de personas que vinieron de colegios municipales, subvencionados, particulares ####
owpm %>% 
  group_by(institucion) %>% 
  summarise(municipal = sum(municipal),
            subvencionado = sum(subvencionado),
            particular = sum(particular)) %>% 
  arrange(desc(municipal))

# 3. Cantidad de hombres y mujeres que ingresan a post grado ----
owpm$tipo_carrera= as.factor(owpm$tipo_carrera)

unique(owpm$tipo_carrera) # niveles unicos de la variable de caracter

owpm %>% 
  group_by(institucion) %>% 
  filter(tipo_carrera=="Postgrado") %>% 
  summarise(hombres=sum(hombres_matriculados_pa),
            mujeres=sum(mujeres_matriculadas_pa))

owpm %>% 
  group_by(institucion) %>% 
  filter(tipo_carrera=="PostÌtulo") %>% 
  summarise(hombres=sum(hombres_matriculados_pa),
            mujeres=sum(mujeres_matriculadas_pa))

# 4. ¿Cual es la carrera que dura mas (en años)? ----
owpm$nombre_carrera <- as.factor(owpm$nombre_carrera)

owpm %>% 
  group_by(nombre_carrera) %>% 
  summarise(duracion=round((mean(duracion)/2),1)) %>% 
  arrange(desc(duracion)) # En general, MEDICINA, ODONTOLOGIA, ING CIVIL.

owpm %>% 
  filter(institucion=="CFT LOS LAGOS") %>% 
  group_by(nombre_carrera) %>% 
  summarise(duracion=round((mean(duracion)/2),1)) %>% 
  arrange(desc(duracion)) # TEC. GESTION RRHH.

owpm %>% 
  filter(institucion=="IP LOS LAGOS") %>% 
  group_by(nombre_carrera) %>% 
  summarise(duracion = round((mean(duracion)/2),1)) %>% 
  arrange(desc(duracion)) # ING INDUSTRIAL

owpm %>% 
  filter(institucion=="UNIVERSIDAD ANDRES BELLO") %>% 
  group_by(nombre_carrera) %>% 
  summarise(duracion=round((mean(duracion)/2),1)) %>% 
  arrange(desc(duracion)) # MEDICINA

owpm %>% 
  filter(institucion=="UNIVERSIDAD DE LAS AMERICAS") %>% 
  group_by(nombre_carrera) %>% 
  summarise(duracion=round((mean(duracion)/2),1)) %>% 
  arrange(desc(duracion)) # ARQUITECTURA, ING CIVIL IND

owpm %>% 
  filter(institucion=="UNIVERSIDAD SAN SEBASTIAN") %>% 
  group_by(nombre_carrera) %>% 
  summarise(duracion=round((mean(duracion)/2),1)) %>% 
  arrange(desc(duracion)) # MEDICINA


# 5. Cantidad colegios tec vs cientifico-humanista
owpm %>% 
  group_by(institucion) %>% 
  summarise(tecnicos = sum(tecnico),
            cientifico_humanista = sum(humanista_cientifico))

# CARRERAS CON MAYOR ACREDITACION

owpm %>% 
  group_by(institucion) %>% 
  summarise(cantidad = n())
