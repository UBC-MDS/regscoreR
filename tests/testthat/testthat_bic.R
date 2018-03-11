
context("Testing BIC")

test_that("bic() returns the BIC score of a specific model, given observed y, predicted y and number of variables used for prediction", {

  # check if y and y_pred have same length, if not raise error
  expect_error(bic(c(1,2,3,4), c(5,6,7,8,9), 3), "Error: Number of variables must be a double")
  expect_error(bic(c(1,2,3,4,5,6,7), c(5,6,7,8,9), 2), "Error: Number of variables must be a double")
  
  # check if length of y or ypred is larger than 1, if not raise error
  expect_error(bic(c(), c(5,6,7,8), 3), "Error: Argument 1 is not a vector")
  expect_error(bic(c(2), c(5,6,7,8), 3), "Error: Number of variables must be a double")
  expect_error(bic(c(1,2,3,4), c(3), 3), "Error: Number of variables must be a double")
  expect_error(bic(c(1,2,3,4), c(), 3), "Error: Argument 2 is not a vector")
  
  ## check if y is a vector of numbers, if not raise error
  expect_error(bic(as.data.frame(c(1,2,3,4)), c(5,6,7,8), 3), "Error: Argument 1 is not a vector")
  expect_error(bic(as.data.frame(c(1,2,3,4)), c(5,6,7,8), 3), "Error: Argument 1 is not a vector")
  expect_error(bic(2, c(5,6,7,8), 3), "Error: Number of variables must be a double")
  expect_error(bic(c("a","b","c","d"), c(5,6,7,8), 3), "Error: Elements of argument 1 must be double")
  expect_error(bic("a", c(5,6,7,8), 3), "Error: Elements of argument 1 must be double")
  
  ## check if ypred is a vector of numbers, if not raise error
  expect_error(bic(c(1,2,3), as.data.frame(c(5,6,7)), 3), "Error: Argument 2 is not a vector")
  expect_error(bic(c(1,2,3,4), as.data.frame(c(5,6,7,8)), 3), "Error: Argument 2 is not a vector")
  expect_error(bic(c(1,2,3), 2, 3), "Error: Number of variables must be a double")
  expect_error(bic(c(1,2,3), c("a","b","c","d"), 3), "Error: Elements of argument 2 must be double")
  expect_error(bic(c(1,2,3), "a", 3), "Error: Elements of argument 2 must be double")
  
  ## check if p is int, if not raise error
  expect_error(bic(c(1,2,3), c(5,6,7), "a"), "Error: Number of variables must be a double")
  expect_error(bic(c(1,2,3), c(5,6,7), c(2,1,0)), "Error: Number of variables must be a double")
  expect_error(bic(c(1,2,3), c(5,6,7), 1.75), "Error: Number of variables must be a double")
  
  ## check if p is larger than 0, if not raise error
  expect_error(bic(c(1,2,3), c(5,6,7), 0, "Error: Number of variables must be a positive integer"))
  expect_error(bic(c(1,2,3), c(5,6,7), -5, "Error: Number of variables must be a positive integer"))
})