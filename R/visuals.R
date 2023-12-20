#' Generate a histogram
#'
#' This function takes a numeric vector and creates a histogram using ggplot2.
#'
#' @param df A data frame
#' @param col The column of the data frame to plot, as a string
#' @param title The title of the histogram plot (default is "Histogram").
#'
#' @return A ggplot object representing the histogram.
#'
#'
#' @importFrom ggplot2 ggplot aes geom_histogram labs theme_bw
#' @export
plot_hist <- function (df, col, title = "Histogram") {

  # Create ggplot object for the histogram
  ggplot(df, aes(x = !!as.symbol(col))) +
    geom_histogram(bins = 30) +
    labs(title = title, x = "Values", y = "Frequency") + theme_bw()

}

#' Generate a colored map
#'
#' This function takes a geometry object and fill scale variable
#' to create a shaded map using ggplot2.
#'
#' @param df A data frame
#' @param geometry The geometry to plot
#' @param fill The factor to color the map by - can be discrete or continuous
#' @param title The title of the map plot (default is "Map").
#'
#' @return A ggplot object representing the map
#'
#'
#' @importFrom ggplot2 ggplot aes labs theme_bw geom_sf
#' @importFrom viridis scale_fill_viridis
#' @export
plot_map <- function (df, geometry, fill, title = "Map") {
  # If continuous use viridis color fill
  if (is.numeric(df[[fill]])) {
    ggplot(df, aes(geometry = !!as.symbol(geometry),
                   fill = !!as.symbol(fill))) +
      geom_sf() + scale_fill_viridis() +
      labs(title = title) + theme_bw()
  } else {
    # Discrete variables can use default fill
    ggplot(df, aes(geometry = !!as.symbol(geometry),
                   fill = !!as.symbol(fill))) +
      geom_sf() +
      labs(title = title) + theme_bw()
  }

}

#' Generate facet histograms for each column in a dataframe
#'
#' This function takes a dataframe and the columns you want to keep, and creates
#' a faceted plot with histograms for all of the columns.
#'
#' @param df A data frame
#' @param cols A character vector of the columns you do not want faceted, such
#' as unique identifiers
#' @param title The title of the map plot (default is "Histograms").
#'
#' @return A ggplot object representing the histograms
#'
#' @importFrom tidyr pivot_longer all_of
#' @importFrom ggplot2 ggplot aes labs theme_bw geom_histogram facet_wrap
#' @export
facet_hist <- function(df, cols, title = "Histograms") {
  df |> pivot_longer(-all_of(cols)) |> ggplot(aes(x = !!as.symbol("value"))) +
    geom_histogram() + facet_wrap(~name, scales = "free_x") + theme_bw() +
    labs(title = title)
}



#' Residual Plot
#'
#' This function takes a linear model `lm` object and creates a residual plot
#'
#' @param lm1 A linear model
#' @param title The title of the map plot (default is "Residuals").
#'
#' @return A ggplot object representing the residuals and fitted values
#'
#' @importFrom ggplot2 ggplot aes labs theme_bw geom_point
#' @export

resid_plot <- function (lm1, title = 'Residuals' ) {
  data.frame("residuals" = lm1[["residuals"]],
             "fitted.values" = lm1[["fitted.values"]]) |>
    ggplot(aes(x = !!as.symbol("residuals"),
               y = !!as.symbol("fitted.values"))) +
    geom_point() +
    theme_bw() +
    labs(title = title)
}
