library(mdlCpOaMdr)
library(testthat)
test_that("加法1", {
  expect_equal(add(3,4), 7)
})

test_that("加法2", {
  expect_equal(add(3,5), 8)
})
