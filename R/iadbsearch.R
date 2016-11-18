
#' # Search for indicators
#' # 'searchvalue = ALL or indicator code'
#' idbmsearch(pattern = "poverty|unemployment|employment")
#' @export
iadbmsearch <- function(value = "ALL"){
  urlmeta <- "metadata/indicator"
  searchType <-"?searchtype=name"
  searchvalue<-paste0("&searchvalue=",value)
  searchLanguage<-"&languagecode=EN"
  
  urls<-iadburls()
  
  url <- paste0(urls$base_url,urlmeta,searchType,searchvalue,searchLanguage,urls$utils_url)
  
  #url
  iadbget.raw(url)
  
  
  #http://api-data.iadb.org/?searchtype=namemetadata/indicator&searchvalue=ALL&languagecode=EN&responsetype=json
  #http://api-data.iadb.org/metadata/indicator?searchtype=name&searchvalue=ALL&languagecode=EN&
  
}

