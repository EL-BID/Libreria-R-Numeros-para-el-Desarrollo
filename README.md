#Inter-American development bank indicators

The Inter-american development bank has a lot of data  on Latin American and Caribbean countries at a granular level not available in other sources. https://data.iadb.org/NumbersForDevelopment/NumbersForDevelopment

#Based on:
https://github.com/vincentarelbundock/WDI


# Searching metadata of the indicators data

You can download the metadata of all the indicators or a specific set of indicators

```r
iadbmsearch(value='ALL')
```

Which produces this: 

```r
> iadbmsearch(value='ALL')[1:5,1:5]
  IndicatorCode DataSetcode DataSetName                                    IndicatorName
1         LMW_1         LMW         LMW               Consumption: millions of US$, s.a.
2        LMW_10         LMW         LMW Net Factor Payments: last 4 quarters (US$ mill.)
3       LMW_100         LMW         LMW              Export Prices: index, end of period
4       LMW_102         LMW         LMW       Domestic Pub.Debt: annual avg. (US$ mill.)
5       LMW_107         LMW         LMW                      Revenues: (US$ mill.), s.a.
> 
```

# Download the data

```r
data<-iadbstats(country="ARG,COL",frequency="year",indicatorcode="SOC_050")
```
Preview data: 

```r
head(data)
  CountryCode CountryTableName IndicatorCode                                  IndicatorName      TopicName SubTopicName Year Quarter Month AggregationLevel AggregatedValue        UOM
1         ARG        Argentina       SOC_050 % of households economically headed by females Social Outlook Demographics 2003                           Year          35.263 PERCENT   
2         ARG        Argentina       SOC_050 % of households economically headed by females Social Outlook Demographics 1995                           Year          29.701 PERCENT   
3         ARG        Argentina       SOC_050 % of households economically headed by females Social Outlook Demographics 2011                           Year          37.323 PERCENT   
4         ARG        Argentina       SOC_050 % of households economically headed by females Social Outlook Demographics 1996                           Year          29.247 PERCENT   
5         ARG        Argentina       SOC_050 % of households economically headed by females Social Outlook Demographics 2009                           Year          36.596 PERCENT   
6         ARG        Argentina       SOC_050 % of households economically headed by females Social Outlook Demographics 2000                           Year          31.698 PERCENT 
```


#Use the data

```r
library(ggplot2)
ggplot(data, aes(x=Year, y=AggregatedValue, color=CountryTableName)) + geom_point() +   xlab('Year') + ylab('% house holds economically headed by females')
```
