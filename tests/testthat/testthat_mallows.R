#library(testthat)
#library(regscoreR)

context("Testing mallows")

# mallows
test_that("mallows() returns Mallow's Cp of the model", {
  # expected outputs:
  expect_equal(round(mallow([1,2,3,4],[5,6,7,8],[1,2,3,5],3,2),5), 1.09375)
})

test_that("Error message occurs when input is not correct format",{
  # expected errors:
  expect_error(mallow([1,2,3,4], [3,5,5,3],[5,6,7,7],2,3)) #check if p less than k
  expect_error(mallow([1,2,3,4], [5,6,7,8],[5,6,7,8], 3, -1)) #check if p is positive
  expect_error(mallow([1,2,3,4], [5,6,7,8],[5,6,7,8], 3, 2.3)) #check if p is integer
  expect_error(mallow([1,2,3,4], [5,6,7,8],[5,6,7,8], -1, 3)) #check if k is positive
  expect_error(mallow([1,2,3,4], [5,6,7,8],[5,6,7,8], 3.3, 2)) #check if k is integer
  expect_error(mallow("a", [1,2,3,4],[5,6,7,8], 3,2)) #chect if y is a vector
  expect_error(mallow([1,2,3,4], "a",[5,6,7,8], 3,2)) #chect if y_pred is a vector
  expect_error(mallow([1,2,3,4],[5,6,7,8],"a", 3,2)) #chect if y_sub is a vector
  expect_error(mallow([1,2], [1,2,3],[1,2],3, 2)) #check if y, and y_pred have same length
  expect_error(mallow([1,2], [1,2],[1,2,3],3, 2)) #check if y, and y_sub have same length
  expect_error(mallow([1], [3],[2],3, 2)) #check if the length of y, y_sub, and y_pred is 1

})
