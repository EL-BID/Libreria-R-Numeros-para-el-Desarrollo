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

iadburls <- function() {
  
  base_url <- "http://api-data.iadb.org/"
  utils_url <- "&responsetype=json"
  
  url_list <- list(base_url = base_url, utils_url = utils_url)
  
  url_list
}




#' http://api-data.iadb.org/metadata/country?searchtype=code&searchvalue=ARG&languagecode=en&responsetype=xml

#'http://api-data.iadb.org/metadata/indicator?searchtype=name&searchvalue=ALL&languagecode=EN&responsetype=xml

#'http://api-data.iadb.org/datasitedata?countrycode=arg&frequency=year&languagecode=en&responsetype=json&indicatorcode=all
