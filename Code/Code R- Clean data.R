#Hecho por: Juliana Lopez, Laura Otalora, Isabella Perilla
#Realizado para cambiar nombre de variables, y crear dos columnas

# Cargar el paquete 
library(readxl)
library(writexl)
# Leer el archivo Excel (ajusta el nombre si es necesario)
datos <- read_excel("Base de datos- proyecto (1).xlsx")

# Ver primeras 10 filas
head(datos, 10)

# Renombrar columnas
colnames(datos) <- c(
  "id_lugar",
  "coordenada",
  "nombre",
  "direccion",
  "tipo_negocio",
  "antiguedad",
  "n_sedes",
  "punto_fabrica",
  "n_empleados",
  "producto_referencia",
  "rango_precios",
  "estrategia_efectiva",
  "impacto_ingresos",
  "expectativa_futuro",
  "inversion_promocion",
  "tipo_promocion",
  "efectividad_promocion",
  "ampliacion_canales",
  "tipo_canales",
  "efectividad_canales",
  "reduccion_costos",
  "efectividad_costos",
  "reubicacion",
  "motivo_reubicacion",
  "variacion_ingresos",
  "retos"
)

# Verificar
head(datos)

# Ver tabla limpia (primeros 10 registros)
print(datos[1:10, ], row.names = FALSE)
datos$segmento_precio <- ifelse(datos$rango_precios < 500000, "Barato",
                                ifelse(datos$rango_precios <= 1500000, "Medio", "Caro"))
datos$antiguedad_grupo <- cut(datos$antiguedad, 
                              breaks = c(0, 3, 10, Inf), 
                              labels = c("Nueva", "Media", "Antigua"), 
                              right = FALSE)

# Guardar el nuevo archivo Excel
write_xlsx(datos, "Base_limpia_proyecto.xlsx")

