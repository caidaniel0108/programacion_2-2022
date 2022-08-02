# examen
library(palmerpenguins)
library(dplyr)

# 1. Instalar la librería "palmerpenguins" y cargar la base de datos "penguins"
df <- palmerpenguins::penguins


# 2. 
df <- df %>% 
  mutate(average = (bill_length_mm+bill_depth_mm)/2)


# 3.
df %>% 
  group_by(species) %>% 
  summarise(Biscoe = sum(island=="Biscoe"),
            Dream = sum(island=="Dream"),
            Torgersen = sum(island=="Torgersen"))

# 4. 
df %>% 
  group_by(island) %>% 
  filter(sex=="female" & island=="Dream") %>% 
  summarise(maximo= max(body_mass_g, na.rm = TRUE)) # 4.150


# 5.
df$flipper_length_mm[is.na(df$flipper_length_mm)] <- 0

for(i in 1:length(df)){
  if(df$flipper_length_mm[i]>=185){
    cantidad = sum(df$flipper_length_mm>=185)
  }
  else{
    df$flipper_length_mm = df$flipper_length_mm
  }
} # son 310 resultados

# 6.
library(ggplot2)
df %>% 
  ggplot(aes(body_mass_g, bill_length_mm, col=species)) +
  geom_point() +
  ggtitle("Relación entre la masa corporal y el largo del pico") +
  xlab("Masa corporal (mm)") + 
  ylab("Largo del pico (mm)")

# 7.
df %>% 
  ggplot(aes(island, fill=island)) +
  geom_bar() +
  xlab("Isla") +
  ylab("Cantidad de pingüinos observados") +
  ggtitle("Cantidad de Pingüinos según Isla de Observación") +
  theme(
    legend.position = "none"
  )


