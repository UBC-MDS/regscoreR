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
#' @return double
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
  ## - contain numeric values
  ## - have equal length

  if (!is.vector(y) || !is.vector(y_pred)) {
    stop("Expect y and y_pred to be vector-alike with numeric elements")
  }

  for (i in y) {
    for (j in y_pred) {
      if (typeof(i) != "double" || typeof(j) != "double")
        stop("Expect y and y_pred to be vector-alike with numeric elements")
    }
  }

  if (length(y) <= 1 || length(y_pred) <= 1) {
    stop("Expect length of y and y_pred larger than 1")
  }

  if (length(y) != length(y_pred)) {
    stop("Expect y and y_pred to have equal length")
  } else {
    n <- length(y)
  }

  ## Conditions for p:
  ## - should be an integer
  ## - should be positive

  if (typeof(p) != "double") {
    stop("Expect numeric value for p")
  } else if (p%%1 != 0) {
    stop("Expect p to be integer")
  } else if (p <= 0) {
    stop("Expect p to be positive")
  }

  # Calculation
  resid <- y_pred - y
  rss <- sum(resid^2)
  aic_score <- n*log(rss/n) + 2*p

  return(aic_score)
}
