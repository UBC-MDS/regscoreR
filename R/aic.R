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


