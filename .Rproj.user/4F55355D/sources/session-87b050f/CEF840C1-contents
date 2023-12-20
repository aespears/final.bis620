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
plot_hist <- function(df, col, title = "Histogram") {

  # Create ggplot object for the histogram
  ggplot(df, aes(x = !!as.symbol(col))) +
    geom_histogram(bins = 30) +
    labs(title = title, x = "Values", y = "Frequency") + theme_bw()

}

#' Generate a colored map
#'
#' This function takes a geometry object and fill scale creates a shaded map using ggplot2.
#'
#' @param df A data frame
#' @param geometry The geometry to plot
#' @param fill The factor to color the map by - can be discrete or continuous
#' @param title The title of the map plot (default is "Map").
#'
#' @return A ggplot object representing the histogram.
#'
#'
#' @importFrom ggplot2 ggplot aes labs theme_bw
#' @importFrom viridis scale_fill_viridis
#' @export
plot_map <- function(df, geometry, fill, title = "Map") {
  # If continuous use viridis color fill
  if (is.numeric(df[[fill]])){
    ggplot(df, aes(geometry = !!as.symbol(geometry), fill = !!as.symbol(fill))) +
      geom_sf() + scale_fill_viridis() +
      labs(title = title) + theme_bw()
  } else {
    # Discrete variables can use default fill
    ggplot(df, aes(geometry = !!as.symbol(geometry), fill = !!as.symbol(fill))) +
      geom_sf() +
      labs(title = title) + theme_bw()
  }

}

#' Generate pivoted histograms
#'
#' This function takes a geometry object and fill scale creates a shaded map using ggplot2.
#'
#' @param df A data frame
#' @param geometry The geometry to plot
#' @param fill The factor to color the map by - can be discrete or continuous
#' @param title The title of the map plot (default is "Map").
#'
#' @return A ggplot object representing the histogram.
#'
#'
#' @importFrom ggplot2 ggplot aes labs theme_bw
#' @importFrom viridis scale_fill_viridis
#' @export
plot_map <- function(df, geometry, fill, title = "Map") {
  # If continuous use viridis color fill
  if (is.numeric(df[[fill]])){
    ggplot(df, aes(geometry = !!as.symbol(geometry), fill = !!as.symbol(fill))) +
      geom_sf() + scale_fill_viridis() +
      labs(title = title) + theme_bw()
  } else {
    # Discrete variables can use default fill
    ggplot(df, aes(geometry = !!as.symbol(geometry), fill = !!as.symbol(fill))) +
      geom_sf() +
      labs(title = title) + theme_bw()
  }

}

