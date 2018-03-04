#' BIC scorer function
#'
#' @author Simran Sethi
#' 
#' @param y and y_pred is a list of numbers and p which is an int
#' 
#' @description BIC stands for Bayesian Information Criterion. 
#' Like AIC, it also estimates the quality of a model.
#' When fitting models, it is possible to increase model fitness by adding more parameters. 
#' Doing this may results in model overfit. 
#' Both AIC and BIC helps to resolve this problem by using a penalty term for the number of parameters in the model. 
#' This term is bigger in BIC than in AIC.
#' 
#' @details BIC = n X log(residual sum of squares/n) + K X log(n)
#'
#' @return float
#'
#' @examples
#' y <-c(1,2,3,4)
#' y_pred <- c(5,6,7,8)
#' p <- 3
#' bic(y, y_pred, p)