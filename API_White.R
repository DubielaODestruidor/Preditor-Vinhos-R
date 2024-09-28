library(plumber)
library(jsonlite)

#* @apiTitle Wine Quality for Red Wine Prediction API
load("./models/rf_white.RData")

#* @param fixed.acidity Ácido fixo (numeric)
#* @param volatile.acidity Ácido volátil (numeric)
#* @param citric.acid Ácido cítrico (numeric)
#* @param residual.sugar Açúcar residual (numeric)
#* @param chlorides Cloretos (numeric)
#* @param free.sulfur.dioxide Dióxido de enxofre livre (numeric)
#* @param total.sulfur.dioxide Dióxido de enxofre total (numeric)
#* @param density Densidade (numeric)
#* @param pH pH (numeric)
#* @param sulphates Sulfatos (numeric)
#* @param alcohol Álcool (numeric)
#* @post /predict
function(fixed.acidity, volatile.acidity, citric.acid, residual.sugar,
         chlorides, free.sulfur.dioxide, total.sulfur.dioxide,
         density, pH, sulphates, alcohol) {

  # Converter os parâmetros para numéricos
  input_data <- data.frame(
    fixed.acidity = as.numeric(fixed.acidity),
    volatile.acidity = as.numeric(volatile.acidity),
    citric.acid = as.numeric(citric.acid),
    residual.sugar = as.numeric(residual.sugar),
    chlorides = as.numeric(chlorides),
    free.sulfur.dioxide = as.numeric(free.sulfur.dioxide),
    total.sulfur.dioxide = as.numeric(total.sulfur.dioxide),
    density = as.numeric(density),
    pH = as.numeric(pH),
    sulphates = as.numeric(sulphates),
    alcohol = as.numeric(alcohol)
  )

  # Realizar a predição
  prediction <- predict(rf_white, newdata = input_data)

  # Retornar a predição
  list(quality = prediction)
}