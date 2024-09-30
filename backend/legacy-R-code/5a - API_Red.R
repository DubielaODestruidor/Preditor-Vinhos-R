library(plumber)
library(jsonlite)

#* @apiTitle Wine Quality for Red Wine Prediction API
load("./models/rf_red.RData")

#* @param fixed_acidity Ácido fixo (numeric)
#* @param volatile_acidity Ácido volátil (numeric)
#* @param citric_acid Ácido cítrico (numeric)
#* @param residual_sugar Açúcar residual (numeric)
#* @param chlorides Cloretos (numeric)
#* @param free_sulfur_dioxide Dióxido de enxofre livre (numeric)
#* @param total_sulfur_dioxide Dióxido de enxofre total (numeric)
#* @param density Densidade (numeric)
#* @param pH pH (numeric)
#* @param sulphates Sulfatos (numeric)
#* @param alcohol Álcool (numeric)
#* @post /predict
function(fixed_acidity, volatile_acidity, citric_acid, residual_sugar,
         chlorides, free_sulfur_dioxide, total_sulfur_dioxide,
         density, pH, sulphates, alcohol) {
  
  # Converte os parâmetros para numéricos
  input_data <- data.frame(
    fixed_acidity = as.numeric(fixed_acidity),
    volatile_acidity = as.numeric(volatile_acidity),
    citric_acid = as.numeric(citric_acid),
    residual_sugar = as.numeric(residual_sugar),
    chlorides = as.numeric(chlorides),
    free_sulfur_dioxide = as.numeric(free_sulfur_dioxide),
    total_sulfur_dioxide = as.numeric(total_sulfur_dioxide),
    density = as.numeric(density),
    pH = as.numeric(pH),
    sulphates = as.numeric(sulphates),
    alcohol = as.numeric(alcohol)
  )
  
  # Realiza a predição
  prediction <- predict(rf_red, newdata = input_data)
  
  # Retorna a predição
  list(quality = prediction)
}