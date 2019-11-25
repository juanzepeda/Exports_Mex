# Exportaciones no petroleras

# Paquetes
library(tidyverse)
library(plotly)
library(ggthemes)
library(viridis)
# Importamos base de datos
df <- read.csv("EXPORTACIONES_TIPODEBIEN.csv") 
head(df, n = 4)
tail(df, n = 4)
attach(df)
summary(df)

# Transformamos los datos
# Variable Valor de las Exportaciones por sector económico
Valor <- c(Total, Agropecuarias, Extractivas, Manufactureras)

# Variable Periodo (se define como datos mensuales de 1980 a 2019)
Periodo <- seq(as.Date("1980-01-01"), as.Date("2019-09-01"), by = "month")
Periodo <- rep(Periodo, 4)

# Variable Sector
# Creamos una variable del tipo caracter con el nombre de los sectores
Total_f <- c("Total")
Total_f <- rep(Total_f, 477)
class(Total_f)
Agropecuarias_f <- c("Agropecuarias")
Agropecuarias_f <- rep(Agropecuarias_f, 477) 
Extractivas_f <- c("Extractivas")
Extractivas_f <- rep(Extractivas_f, 477) 
Manufactureras_f <- c("Manufactureras")
Manufactureras_f <- rep(Manufactureras_f, 477) 
Sector <- c(Total_f, Agropecuarias_f, Extractivas_f, Manufactureras_f)

# Creamos nuevo data frame
Exportaciones_no_petroleras <- data.frame(Valor, Periodo, Sector)
head(Exportaciones_no_petroleras, n = 5)

# Gráfica
g <- ggplot(Exportaciones_no_petroleras, aes(x = Periodo, y = Valor, color = Sector)) + 
  geom_point() + 
  geom_smooth() +
  theme_minimal() +
  labs(title = "Exportaciones no petroleras por grandes grupos \n de actividad económica, 1980-2018.",
       subtitle = "Unidad de medida: Millones de dólares",
       caption = "Fuente: Elaborado por @eljuanzepeda con datos de INEGI.") +
  scale_y_continuous(name = "Valor de las exportaciones.") +
  scale_x_date(name = "Periodo") +
  theme(legend.position = "bottom") +
  scale_color_viridis(discrete = TRUE)
g