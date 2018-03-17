#' Mallow's Cp function
#'
#' @author Ruoqi XU
#'
#' @param y array-like of shape = (n_samples) or (n_samples, n_outputs), True target variable(s)
#' @param y_pred array-like of shape = (n_samples) or (n_samples, n_outputs)
#'    Fitted target variable(s) obtained from your regression model
#' @param y_sub array-like of shape = (n_samples) or (n_samples, n_outputs)
#'    Fitted target variable(s) obtained from your subset regression model
#' @param k (int,like 2L)Number of predictive variable(s) used in the model
#' @param p (int,like 2L)Number of predictive variable(s) used in the subset model
#'
#' @description Mallow's C_p is named for Colin Lingwood Mallows.
#' It is used to assess the fit of regression model,
#' finding the best model involving a subset of predictive variables available
#' for predicting some outcome.
#'
#' @details C_p = (SSE_p/MSE) - (n - 2p)
#'
#' @return mallow_score: float
#'
#' @examples
#' library(regscoreR)
#' y <-c(1,2,3,4)
#' y_pred <- c(5,6,7,8)
#' y_sub <- c(1,2,3,5)
#' k <- 3L
#' p <- 2L
#' regscoreR::mallow(y, y_pred, y_sub, k, p)
#'
#' @export


mallow <- function(y,y_pred,y_sub,k,p) {
  # Check conditions for function input
  if(p>k){
    stop("Error: The number of predictive variable(s)
         used in the sub model must less than in whole model")
  }
  if(length(y)!=length(y_pred) || length(y_pred)!=length(y_sub)){
    stop("Error: The length of y, predict y and predict y in subset model
         must equal.")
  }
  if(length(y)<2 || length(y_pred)<2 ||length(y_sub)<2){
    stop("Error: The length of y, predict y and predict y in subset model
         must larger than 1")
  }
  if(!is.integer(k) || !is.integer(p)){
    stop("Error: The number of predictive variable(s) used in the sub model
         must be integer")
  }
  if(!is.vector(y) || !is.vector(y_pred) || !is.vector(y_sub)){
    stop("Error: The observed y, predicted y, and predicted y in subset model
         must be vector")
  }
  if(k<=0 || p<=0){
    stop("Error: The number of predictive variable(s) used in the sub model
         must be positive")
  }


  # Calculation
    SSE_p <- sum((y-y_sub)^2)
    MSE <- sum((y-y_pred)^2)/(length(y)-k)
    mallowcp <- SSE_p/MSE-length(y)+2*p
    return(mallowcp)
}

