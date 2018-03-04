
context("Testing BIC")

test_that("bic() returns the BIC score of a specific model, given observed y, predicted y and number of variables used for prediction", {

  # check if y and y_pred have same length, if not raise error
  expect_error(bic(c(1,2,3,4), c(5,6,7,8,9), 3), "y and y_pred have different dimensions/lengths")
  expect_error(bic(c(1,2,3,4,5,6,7), c(5,6,7,8,9), 2), "y and y_pred have different dimensions/lengths")
  
  # check if length of y or ypred is larger than 1, if not raise error
  expect_error(bic(c(), c(5,6,7,8), 3), "y should not be empty vector")
  expect_error(bic(c(2), c(5,6,7,8), 3), "y cannot be of length 1")
  expect_error(bic(c(1,2,3,4), c(3), 3), "y_pred cannot be of length 1 and should be equal to length of y")
  expect_error(bic(c(1,2,3,4), c(), 3), "y_pred should not be of length 0")
  
  ## check if y is a vector of numbers, if not raise error
  expect_error(bic(as.tibble(c(1,2,3,4)), c(5,6,7,8), 3), "y should be vector")
  expect_error(bic(as.data.frame(c(1,2,3,4)), c(5,6,7,8), 3), "y should be vector")
  expect_error(bic(2, c(5,6,7,8), 3), "y should be vector")
  expect_error(bic(c("a","b","c","d"), c(5,6,7,8), 3), "y should be vector")
  expect_error(bic("a", c(5,6,7,8), 3), "y should be vector")
  
  ## check if ypred is a vector of numbers, if not raise error
  expect_error(bic(c(1,2,3), as.tibble(c(5,6,7)), 3), "y_pred should be vector")
  expect_error(bic(c(1,2,3), as.data.frame(c(5,6,7)), 3), "y_pred should be vector")
  expect_error(bic(c(1,2,3), 2, 3), "y_pred should be vector")
  expect_error(bic(c(1,2,3), c("a","b","c","d"), 3), "y_pred should be vector of integers")
  expect_error(bic(c(1,2,3), "a", 3), "y_pred should be vector not a character")
  
  ## check if p is int, if not raise error
  expect_error(bic(c(1,2,3), c(5,6,7), "a"), "non-numeric argument")
  expect_error(bic(c(1,2,3), c(5,6,7), c(2,1,0)), "non-numeric argument")
  expect_error(bic(c(1,2,3), c(5,6,7), 1.75), "floats not allowed")
  
  ## check if p is larger than 0, if not raise error
  expect_error(bic(c(1,2,3), c(5,6,7), 0, "p should be greater than 0"))
  expect_error(bic(c(1,2,3), c(5,6,7), -5, "p cannot be negative"))
})