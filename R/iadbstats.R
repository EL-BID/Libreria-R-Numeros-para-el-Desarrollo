#' Pull the data for some indicators and countries. 
#' 
#' Data frame with the data of the specified indicators and countries
#' All countries and All indicators cannot be requested
#' When All indicators data is requested, data can be requested for a maximum of 4 countries
#' When All country data is requested, data can be requested for a maximum of 10 indicators (see iadbstats.list)
#' 
#' @param country Character string. ISO3 code of the countries. E.g COL for Colombia or 'ALL' for all the countries
#' @param frequency Character string. Frequency of the indicators Year for yearly. 
#' @param indicatorcode codes of the indicators separated by comma. 'All' for all the indicators
#' @return Data frame with  CountryCode, CountryTableName, IndicatorCode, IndicatorName, TopicName, SubTopicName, Year, Quarter,
#' AggregationLevel, AggregatedValue, UOM 
#' @export
#' @examples
#' iadbstats(country="COL",frequency="year",indicatorcode="SOC_050")
#' iadbstats(country="ARG,COL",frequency="year",indicatorcode="SOC_050")
iadbstats <- function(country="ALL",frequency="year",indicatorcode="ALL"){

  if(country=="ALL" && indicatorcode=="ALL") stop("All countries and All indicators cannot be requested")
  
  if(indicatorcode=="ALL"&& stringr::str_count(country, ',')>3) stop("When All indicators data is requested, data can be requested for a maximum of 4 countries")
  
  if(country=="ALL"&& stringr::str_count(indicatorcode, ',')>9) stop("When All country data is requested, data can be requested for a maximum of 10 indicators")
  
  urlmeta <- "datasitedata?"
  
  #Country
  if(as.character(country)!="all"&& length(country)>1)
  {
    country<-paste0(country,collapse=",") 
  }

  searchcountry <- paste0("countrycode=",country)
  searchfrequency <- paste0("&frequency=",frequency)
  searchLanguage <- "&languagecode=EN"
  searchIndicator <- paste0("&indicatorcode=",indicatorcode)
  
  urls <- iadburls()
  
  #print(lenght(indicatorCode))
  url <- paste0(urls$base_url,urlmeta,searchcountry,searchfrequency,searchLanguage,searchIndicator,urls$utils_url)
  
  print(url)
  #url
  iadbget.raw(url)  
}

#' Pull the data for a vector of indicators and ALL the countries. 
#' 
#' Data frame with the data of the specified indicators and countries
#' 
#' @param frequency Character string. Frequency of the indicators Year for yearly. 
#' @param indicatorCodes vector of indicator codes c("SOC_050","SOC_057")
#' @param country Character string. ISO3 code of the countries. E.g COL for Colombia or 'ALL' for all the countries
#' @return Data frame with  CountryCode, CountryTableName, IndicatorCode, IndicatorName, TopicName, SubTopicName, Year, Quarter, AggregationLevel, AggregatedValue, UOM 
#' @export
#' @examples
#' codes=c("SOC_050","SOC_057")
#' iadbstats.list(indicatorCodes=codes)
iadbstats.list <- function(frequency="year",indicatorCodes,country="ALL"){

  scountry=country
 
  #split the codes into groups of maximum 10 indicator
  df = split(indicatorCodes, ceiling(seq_along(indicatorCodes)/10))
  
  indicator_list = list()
  
  for(i in 1:length(df))
  {
    #Pull the data for a subset of 10 indicators
    ind = paste(as.character(df[[i]]),collapse=",")
    indicator_list[[i]] = iadbstats(country=scountry,frequency=frequency,indicatorcode=ind)
  }  
  
  #Combine results into one data frame
  full_data = dplyr::bind_rows(indicator_list) 
  
  full_data
}

#' Get the metadata of the countries available in IADB
#'
#' Data frame of countries. 1 row per country
#' 
#' @return Data frame with CountryCode, ALPHA2Code, WB2Code, CountryShortName, CountryLongName, CountryIncomeGroup, OtherRegionalGroup, CountrySpecialNotes
#' @examples
#' iadbstats.countries()
#' @export
iadbstats.countries<-function()
{
  urls <- iadburls()
  url_countries<-"metadata/country?searchtype=name&searchvalue=All&Languagecode=en&"
  
  #print(lenght(indicatorCode))
  url <- paste0(urls$base_url,url_countries,urls$utils_url)
  
  return_list<-iadbget.raw(url)
  df_iadb_ct<-as.data.frame(return_list)
  
  df_iadb_ct
}

