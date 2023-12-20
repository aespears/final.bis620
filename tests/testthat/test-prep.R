test_that("fix999 works", {
  # Set up toy example
  s <- data.frame(a = rnorm(100))
  # Get indices to change
  ind <- sample(1:100, 10)

  # In one set indices to -999
  s999 <- s
  s999$a[ind] <- -999

  # In other set indices to NA
  sNA <- s
  sNA$a[ind] <- NA
  expect_equal(sNA, fix999(s999))
})

test_that("day_dif works", {
  expect_equal(iris$Sepal.Length - iris$Sepal.Width,
               day_dif(iris$Sepal.Length, iris$Sepal.Width))
})

test_that("pct_day_dif works", {
  pct <- (iris$Sepal.Length - iris$Sepal.Width)/iris$Sepal.Width
  expect_equal(pct, pct_day_dif(iris$Sepal.Length, iris$Sepal.Width))
})

test_that("log_trans works", {
  expect_equal(nrow(iris),
               nrow(log_trans(iris, all_of(c("Sepal.Length", "Sepal.Width",
                                             "Petal.Length", "Petal.Width")))))
  expect_equal(ncol(iris),
               ncol(log_trans(iris, all_of(c("Sepal.Length", "Sepal.Width",
                                             "Petal.Length", "Petal.Width")))))
})
