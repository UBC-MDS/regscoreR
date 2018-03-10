#' AIC function
#'
#' @author Ha Dinh
#'
#' @function
#' aic(y, y_pred, p)
#'
#' @param
#' y: True target variable(s) - array-like of shape = (n_samples) or (n_samples, n_outputs)
#' y_pred: Fitted target variable(s) obtained from your regression model - array-like of shape = (n_samples) or (n_samples, n_outputs)
#' p: Number of predictive variable(s) used in the model - int
#'
#' @description
#' AIC stands for Akaike’s Information Criterion.
#' It estimates the quality of a model, relative to each of other models.
#' The lower AIC score is, the better the model is.
#' Therefore, a model with lowest AIC - in comparison to others, is chosen.
#'
#' @details
#' AIC = n*log(residual sum of squares/n) + 2K
#' where:
#' - n: number of observations
#' - K: number of parameters (including intercept)
#'
#' @return float
#'
#' @examples
#' y <-c(1,2,3,4)
#' y_pred <- c(5,6,7,8)
#' p <- 3
#' aic(y, y_pred, p)

library(tidyverse)

aic <- function(y, y_pred, p) {
  # Check conditions:
  ## Conditions for y and y_pred:
  ## - should be array-like with length larger than 1
  ## - have equal length
  ## - contain numeric values

  if (length(y) <= 1 | length(y_pred) <= 1) {
    stop("Expect length of y and y_pred larger than 1")
  } else if (length(y) != length(y_pred)) {
    stop("Expect y and y_pred to have equal length")
  } else if (typeof(y) != "double" | typeof(y_pred) != "double") {
    stop("Expect numeric elements in y and y_pred")
  } else {
    n <- length(y)
  }

  ## Conditions for p:
  ## - should be an integer
  ## - should be positive



  ## Length condition: length of y and y_pred should be equal, and should be more than 1




  # Calculation
  resid <- y_pred - y
  rss <- resid^2
  aic_score <- n*log(rss/n) + 2*p

  return(aic_score)
}
