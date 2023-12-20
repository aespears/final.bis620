#' Data Dictionary
#'
#' A reference guide to the column names in the `fips_data` data frame.
#'
#' @format ## `data_dict`
#' A data frame with 124 rows and 9 columns:
#' \describe{
#'   \item{var_name}{The variable name as listed in `fips_data`}
#'   \item{description}{Describes what the variable refers to}
#'   ...
#' }
"data_dict"

#' Data from the Social Vulnerability Index
#'
#' This data frame gives information relating to Social Vulnerability Index.
#' See `data_dict` df for more information on which each column represents
#'
#'
#' @format ## `fips_data`
#' A data frame with 72837 rows and 127 columns:
#' \describe{
#'   \item{ST}{State-level FIPS code}
#'   \item{STATE}{State}
#'   \item{ST_ABBR}{State abbreviation}
#'   \item{STCNTY}{County-level fips code}
#'   \item{COUNTY}{FIPS}
#'   ...
#' }
#' @source <https://www.atsdr.cdc.gov/placeandhealth/svi/>
"fips_data"
