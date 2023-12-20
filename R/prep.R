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

#' Log transform columns
#'
#' This function log transforms all of the indicated columns in a dataframe
#' and replaces the original columns with new ones titled `log_name`
#'
#' @param df A dataframe with columns to be transformed
#' @param cols The columns to be log_transformed, a <tidy-select>
#' @returns A new dataframe with all the indicated columns replaced by log transformed versions
#'
#' @importFrom dplyr mutate select
#' @export
log_trans <- function(df, cols){

  logs <- df |> select(all_of(cols)) |> apply(2, function(x) log(x + 1)) |> as.data.frame()
  names(logs) <- paste0('log_', names(logs))

  cbind(df |> select(-all_of(cols)), logs)
}


