
# Função mutate do pacote dplyr ------------------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data: 20/05/22 ---------------------------------------------------------------------------------------------------------------------------
# Referência: Prática de Dados - Canal do Youtube ------------------------------------------------------------------------------------------

# Baixar pacote ----------------------------------------------------------------------------------------------------------------------------

library(tidyverse)

# Carregar conjunto de dados ---------------------------------------------------------------------------------------------------------------

data("starwars")
starwars

# Converter altura de centímetros para metros (sobrescrever) -------------------------------------------------------------------------------

### Sobrescrever apenas substitui a coluna já existente

starwars %>%
  mutate(
    height = height / 100
  )

# Criar nova coluna (S)im ou (N)ao se o personagem pesa mais de 100 kg ---------------------------------------------------------------------

starwars %>%
  mutate(
    peso_acima_100 = ifelse(mass > 100, "S", "N")
  ) %>%
  select(name, mass, peso_acima_100)

# Substituir hair_color NA por "desconhecido" ----------------------------------------------------------------------------------------------

starwars %>%
  mutate(
    hair_color = ifelse(is.na(hair_color), "desconhecido", hair_color)
  ) %>%
  select(name, hair_color)

# Parâmetros especiais: .keep all, used, unused, none -------------------------------------------------------------------------------------

starwars %>%
  mutate(
    hair_color = ifelse(is.na(hair_color), "desconhecido", hair_color), .keep = "all"
  )

starwars %>%
  mutate(
    hair_color = ifelse(is.na(hair_color), "desconhecido", hair_color), .keep = "used"
  )

starwars %>%
  mutate(
    hair_color = ifelse(is.na(hair_color), "desconhecido", hair_color), .keep = "unused"
  )

starwars %>%
  mutate(
    hair_color = ifelse(is.na(hair_color), "desconhecido", hair_color), .keep = "none"
  )

# Parâmetros especiais: .before, .after ----------------------------------------------------------------------------------------------------

### Coloca a nova coluna antes ou após uma determinada coluna

starwars %>%
  mutate(
    peso_acima_100 = ifelse(mass > 100, "S", "N"), .after = "name"
  ) 

starwars %>%
  mutate(
    peso_acima_100 = ifelse(mass > 100, "S", "N"), .after = "mass"
  ) 
