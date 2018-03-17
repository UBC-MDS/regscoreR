# add tests for AIC
library(testthat)

context("Test aic")

test_that("aic() returns an aic score of a specific model, given observed y, predicted y and number of predictive variable", {
  # expected outputs:
  # 1
  expect_equal(round(aic(c(1,2,3,4), c(5,6,7,8), 3), 3), 17.09)
  # 2
  expect_equal(round(aic(c(-5,1,-8,-12), c(-4,-6,-8,1), 5), 3), 26.011)
  # 3
  expect_equal(round(aic(c(9.80, 105.23, 4.51, -65.75), c(9.81, 100.10, 4.51, -65.70), 10), 3), 27.536)
  # 4
  expect_equal(round(aic(c(0, 0, 0, -65.789), c(1, 0, 0.9, -64), 4), 3), 8.901)

  # expect_errors:
  ## test if y and y_pred have same length, if not yield error
  # 5
  expect_error(aic(c(1,2,3,4), c(4,5,6,7,8), 3), "Expect y and y_pred to have equal length")

  ## test if length of y is larger than 1, if not yield error
  expect_error(aic(c(2), c(5,6,7,8), 3), "Expect length of y and y_pred larger than 1")

  ## test if length of y_pred is larger than 1, if not yield error
  expect_error(aic(c(1,2,3,4), c(3), 3), "Expect length of y and y_pred larger than 1")

  ## test if y is a vector or array-like type including numbers, if not yield error
  # 10
  expect_error(aic(as.data.frame(c(1,2,3,4)), c(5,6,7,8), 3), "Expect y and y_pred to be vector-alike with numeric elements")
  expect_error(aic(c("a","b","c","d"), c(5,6,7,8), 3), "Expect y and y_pred to be vector-alike with numeric elements")
  # 13
  expect_error(aic("a", c(5,6,7,8), 3), "Expect y and y_pred to be vector-alike with numeric elements")

  ## test if y_pred is a vector or array-like type including numbers, if not yield error
  expect_error(aic(c(1,2,3,4), as.data.frame(c(5,6,7,8)), 3), "Expect y and y_pred to be vector-alike with numeric elements")
  expect_error(aic(c(1,2,3,4), c("a","b","c","d"), 3), "Expect y and y_pred to be vector-alike with numeric elements")
  expect_error(aic(c(1,2,3,4), "a", 3), "Expect y and y_pred to be vector-alike with numeric elements")

  ## test if p is int, if not yield error
  expect_error(aic(c(1,2,3,4), c(5,6,7,8), "a"), "Expect numeric value for p")
  expect_error(aic(c(1,2,3,4), c(5,6,7,8), 4.75), "Expect p to be integer")

  ## test if p is larger than 0, if not yield error
  expect_error(aic(c(1,2,3,4), c(5,6,7,8), 0), "Expect p to be positive")
  expect_error(aic(c(1,2,3,4), c(5,6,7,8), -5), "Expect p to be positive")
})


