#library(testthat)
#library(regscoreR)

context("Testing mallows")

# mallows
test_that("mallows() returns Mallow's Cp of the model", {
  # expected outputs:
  expect_equal(round(aic(y,y_pred,4),5), value)


  # expected errors:
  expect_error(aic([1,2,3],[2,2,3],-1))
  expect_error(aic(y, y_pred, 3.3))
  expect_error(aic("a", [[1,2],[2,2]], 3))
  expect_error(aic([1,2], [1,2,3],2))
  expect_error(aic([1], [3],1))
})
