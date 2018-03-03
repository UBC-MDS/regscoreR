#library(testthat)
#library(regscoreR)

context("Testing mallows")

# mallows
test_that("mallows() returns Mallow's Cp of the model", {
  # expected outputs:
  expect_equal(round(mallow(c(1,2,3,4),c(5,6,7,8),c(1,2,3,5),3,2),2), 0.02)
  expect_equal(round(mallow(c(0, 1, 1.1, -6), c(1, 0, 0.9, -6),c(1,0.8,0,-3.3),3,2), 2), 4.68)
})

test_that("Error message occurs when input is not correct format",{
  # expected errors:
  expect_error(mallow(c(1,2,3,4), c(3,5,5,3),c(5,6,7,7),2,3)) #check if p less than k
  expect_error(mallow(c(1,2,3,4), c(5,6,7,8),c(5,6,7,8), 3, -1)) #check if p is positive
  expect_error(mallow(c(1,2,3,4), c(5,6,7,8),c(5,6,7,8), 3, 2.3)) #check if p is integer
  expect_error(mallow(c(1,2,3,4), c(5,6,7,8),c(5,6,7,8), -1, 3)) #check if k is positive
  expect_error(mallow(c(1,2,3,4), c(5,6,7,8),c(5,6,7,8), 3.3, 2)) #check if k is integer
  expect_error(mallow("a", c(1,2,3,4),c(5,6,7,8), 3,2)) #chect if y is a vector
  expect_error(mallow(c(1,2,3,4), "a",c(5,6,7,8), 3,2)) #chect if y_pred is a vector
  expect_error(mallow(c(1,2,3,4),c(5,6,7,8),"a", 3,2)) #chect if y_sub is a vector
  expect_error(mallow(c(1,2), c(1,2,3),c(1,2),3, 2)) #check if y, and y_pred have same length
  expect_error(mallow(c(1,2), c(1,2),c(1,2,3),3, 2)) #check if y, and y_sub have same length
  expect_error(mallow(c(1),c(3),c(2),3, 2)) #check if the length of y, y_sub, and y_pred is 1

})
