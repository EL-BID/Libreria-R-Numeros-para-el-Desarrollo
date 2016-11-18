#' Call the Data Catalog API
#'
#' Helper function for the data catalog call
#'
#' @param url A charcter string. A formatted url string
#' @note This call is seperate because the data catalog is actaully a different
#'  API and therefore has a different return structure.
#' @return A data frame
iadbget.raw <- function(url) {
  
  return_get <- httr::GET(url)
  return_json <- httr::content(return_get, as = "text")
  return_list <- jsonlite::fromJSON(return_json,  flatten = TRUE)
  return_list

}

#' Internal function to get the urls of the API
#'
#' List with 2 entries. The first one with the base_url and the second one with the utils_url#' @export
#' 
#' @return List with 2 entries. The first one with the base_url and the second one with the utils_url#' @export
#' @examples
#' iadburls()
#' iadburls()
iadburls <- function() {
  
  base_url <- "http://api-data.iadb.org/"
  utils_url <- "&responsetype=json"
  
  url_list <- list(base_url = base_url, utils_url = utils_url)
  
  url_list
}