#' Pull the data for some indicators and countries. 
#' 
#' Data frame with the data of the specified indicators and countries
#' 
#' @param country Character string. ISO3 code of the countries. E.g COL for Colombia or 'ALL' for all the countries
#' @param frequency Character string. Frequency of the indicators Year for yearly. 
#' @param indicatorcode codes of the indicators separated by comma. 'All' for all the indicators
#' @return Data frame with  CountryCode, CountryTableName, IndicatorCode, IndicatorName, TopicName, SubTopicName, Year, Quarter,
#' AggregationLevel, AggregatedValue, UOM 
#' @export
#' @examples
#' iadbstats(country="ARG,COL",frequency="year",indicatorcode="ALL")
#' iadbstats(country="ARG",frequency="year",indicatorcode="ALL"))
iadbstats <- function(country="ALL",frequency="year",indicatorcode="ALL"){

  if(country=="ALL" && indicatorcode=="ALL") stop("All countries and All indicators cannot be requested")
  
  if(indicatorcode=="ALL"&& stringr::str_count(country, ',')>3) stop("When All indicators data is requested, data can be requested for a maximum of 4 countries")
  
  if(country=="ALL"&& stringr::str_count(indicatorcode, ',')>9) stop("When All country data is requested, data can be requested for a maximum of 10 indicators")
  
  urlmeta = "datasitedata?"
  searchcountry = paste0("countrycode=",country)
  searchfrequency = paste0("&frequency=",frequency)
  searchLanguage = "&languagecode=EN"
  searchIndicator = paste0("&indicatorcode=",indicatorcode)
  
  urls = iadburls()
  
  #print(lenght(indicatorCode))
  url = paste0(urls$base_url,urlmeta,searchcountry,searchfrequency,searchLanguage,searchIndicator,urls$utils_url)
  
  #url
  iadbget.raw(url)  
}
iadbstats.list <- function(frequency="year",indicatorcodes){

  scountry="ALL"
 
  # dfInd<- as.data.frame(indicatorcodes)
  # subsetsInd<- split(dfInd, (seq(nrow(dfInd))-1) %/% 10) 
  # ind <-paste(as.character(subsetsInd[[1]]),collapse=",")
  
  
  df = split(indicatorCode, ceiling(seq_along(indicatorCode)/10))
  
  indicator_list = list()
  
  for(i in 1:length(df))
  {
    ind = paste(as.character(df[[1]]),collapse=",")
    indicator_list[[i]] = iadbstats(country=scountry,frequency=frequency,indicatorcode=ind)
  }  
  
  full_data = bind_rows(indicator_list) 
  
  full_data
}