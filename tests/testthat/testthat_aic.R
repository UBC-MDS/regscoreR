# add tests for AIC

context("Test aic")

test_that("aic() returns an aic score of a specific model, given observed y, predicted y and number of predictive variable", {
  # expect outputs:
  expect_equal(round(aic(c(1,2,3,4), c(5,6,7,8), 3), 3), 72)


  # expect_errors:
  ## test if y and y_pred have same length, if not yield error
  expect_error(aic(c(1,2,3,4), c(4,5,6,7,8), 3), "y and y_pred have different length")

  ## test if length of y is larger than 1, if not yield error
  expect_error(aic(c(), c(5,6,7,8), 3), "y should have length > 1 with equal length to y_pred")

  ## test if length of y_pred is larger than 1, if not yield error
  expect_error(aic(c(1,2,3,4), c(3), 3), "y_pred should have length > 1 with equal length to y")

  ## test if p is int, if not yield error
  expect_error(aic(c(1,2,3,4), c(5,6,7,8), "a"), "non-numeric argument")

  ## test if y is a vector or array-like type, if not yield error
  expect_error(aic(as.data.frame(c(1,2,3,4)), c(5,6,7,8), 3), "y should be vector")

  ## test if y_pred is a vector or array-like type, if not yield error
  expect_error(aic(c(1,2,3,4), as.data.frame(c(5,6,7,8)), 3), "y_pred should be vector")

  ## test if p is larger than 0, if not yield error
  expect_error(aic(c(1,2,3,4), c(5,6,7,8), 0, "p should be positive"))
})
