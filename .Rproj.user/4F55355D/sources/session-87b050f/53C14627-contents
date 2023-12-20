#' Replace -999s with NAs for missing values
#'
#' @param df A dataframe in which some cells have values of -999 to represent missing values
#' @returns The same dataframe but all -999s have been replaced with NA
#'
#' @importFrom dplyr mutate_if
#'
#' @export
fix999 <- function(df) {
  df |> mutate_if(is.numeric, ~ ifelse(.x == -999, NA, .x))
}

#' Get difference between daytime population and area population
#'
#' @param day A column representing the daytime population of a region
#' @param total A column representing the total population of a region
#' @returns A new column giving the difference between day and total
#'
#'
#' @export
day_dif <- function(day, total){
  day - total
}

#' Get percent change between daytime population and area population
#'
#' This function accounts for when total area pop is 0 - If there is any increase
#' in population during the day, we simplify to say it is a 100% increase.
#' If day and total pop are both 0, we say percent change is 0.
#'
#' @param day A column representing the daytime population of a region
#' @param total A column representing the total population of a region
#' @returns A new column giving the difference between day and total
#'
#'
#' @export
pct_day_dif <- function(day, total){
  ifelse(total != 0, (day-total)/total, ifelse(day == 0, 0, 1))
}

