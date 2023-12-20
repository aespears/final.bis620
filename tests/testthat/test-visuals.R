test_that("plot_hist works", {
  vdiffr::expect_doppelganger("Iris Sepal Length",
                              plot_hist(iris, 'Sepal.Length',
                                        "Sepal Length in Iris"))
})

test_that("plot_map works", {
  data("fips_data")
  library(sf)
  vdiffr::expect_doppelganger("CT Pop Map",
                              plot_map(fips_data |>
                                         dplyr::filter(ST_ABBR == "CT"),
                                       "geometry", "E_TOTPOP"))
})

test_that("facet_hist works", {
  vdiffr::expect_doppelganger("Iris Facet Hist",
                              facet_hist(iris, c("Species"), "Iris Variables"))
})

test_that("resid_plot works", {
  vdiffr::expect_doppelganger("Iris Resid Plot",
                              resid_plot(lm(Sepal.Width ~ ., iris)))

})
