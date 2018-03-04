#' Mallow's Cp function
#'
#' @author Ruoqi XU
#'
#' @param
#' y: array-like of shape = (n_samples) or (n_samples, n_outputs)
#'    True target variable(s)
#' y_pred: array-like of shape = (n_samples) or (n_samples, n_outputs)
#'    Fitted target variable(s) obtained from your regression model
#' y_pred: array-like of shape = (n_samples) or (n_samples, n_outputs)
#'    Fitted target variable(s) obtained from your regression model
#' y_sub: array-like of shape = (n_samples) or (n_samples, n_outputs)
#'    Fitted target variable(s) obtained from your subset regression model
#' k: (int)Number of predictive variable(s) used in the model
#' p: (int)Number of predictive variable(s) used in the subset model
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
#' y <-c(1,2,3,4)
#' y_pred <- c(5,6,7,8)
#' y_sub <- c(1,2,3,5)
#' k <- 3
#' p <- 2
#' mallow(y, y_pred, y_sub, k, p)
