# add tests for AIC

context("Test aic")

test_that("aic() returns an aic score of a specific model, given observed y, predicted y and number of predictive variable", {
  # expected outputs:
  expect_equal(round(aic(c(1,2,3,4), c(5,6,7,8), 3), 3), 17.09)
  expect_equal(round(aic(c(-5,1,-8,-12), c(-4,-6,-8,1), 5), 3), 26.011)
  expect_equal(round(aic(c(9.80, 105.23, 4.51, -65.75), c(9.81, 100.10, 4.51, -65.70), 10), 3), 27.536)
  expect_equal(round(aic(c(0, 0, 0, -65.789), c(1, 0, 0.9, -64), 4), 3), 8.901)

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
