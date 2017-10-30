*Esta herramienta digital está publicada en la iniciativa [Código para el Desarrollo](http://code.iadb.org/es/repositorio/24/libreria-r-numeros-para-el-desarrollo)*

# Librería R - Números para el Desarrollo (iadbstats)
---
*Iadbstats* es la librería en R que permite la descarga automática a un ambiente de desarrollo en R, de los catálogos de datos alojados en el portal de datos abiertos del Banco Interamericano de Desarrollo, ([Números para el Desarrollo](https://data.iadb.org/NumbersForDevelopment/NumbersForDevelopment)). Este portal dispone de los indicadores socioeconómicos de América Latina y el Caribe más relevantes.

Se trata de una recopilación de siete fuentes de datos:  
* Agrimonitor: Portal para el monitoreo de políticas agrícolas en la Región. 
* INTrade: Un portal en línea que reúne información de integración y comercio en la región. 
* Latin Macro Watch: Indicadores con datos macroeconómicos, sociales, de comercio exterior, flujos de capital, mercados y gobernabilidad. 
* Gestión Pública: Conjunto de indicadores de Gestión Pública basados en metodologías desarrolladas por el BID sobre el desempeño de la Gestión para Resultados en el Desarrollo (GpRD) y del Servicio Civil en América Latina y el Caribe. 
* Pulso Social: Conjunto completo de indicadores clave sobre las condiciones de vida de la población de América Latina y el Caribe. 
* SIMS: Principal fuente de información sobre mercados laborales de América Latina y el Caribe. 
* Sociómetro: Conjunto de datos de indicadores sociales que aportan información sobre condiciones socioeconómicas de América Latina y el Caribe.

```
Esta librería está basada en: https://github.com/vincentarelbundock/WDI_
```

## Cómo instalar
Introduce lo siguiente en la consola de comandos de R:
```r
install.packages('devtools')
library(devtools)
install_github('EL-BID/Libreria-R-Numeros-para-el-Desarrollo')
library('iadbstats') 
```
### Requerimientos
* Versión de R 3.3.1

## Cómo utilizar
### Búsqueda de metadatos de los indicadores

Puedes acceder a los metadatos de todos los indicadores o especificar un conjunto de indicadores.

```r
iadbmsearch(value='ALL')
```

A continuación una muestra de las cinco primeras filas: 

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

### Descarga de los datos

```r
data<-iadbstats(country="ARG,COL",frequency="year",indicatorcode="SOC_050")
```
Previsualización de datos: 

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

### Uso de los datos

```r
library(ggplot2)
ggplot(data, aes(x=Year, y=AggregatedValue, color=CountryTableName)) + geom_point() +   xlab('Year') + ylab('% house holds economically headed by females')
```

![% house holds economically headed by females in Argentina and Colombia](https://cloud.githubusercontent.com/assets/9949001/24076430/b5c724ae-0c06-11e7-95cd-991aec265ef9.png)

# Más información
----
Esta herramienta está basado en el trabajo original de [Vincent Arel-Bundock](https://github.com/vincentarelbundock), [WDI](https://github.com/vincentarelbundock/WDI)

## Licencia
[LICENSE](https://github.com/EL-BID/Libreria-R-Numeros-para-el-Desarrollo/blob/master/Licencia/GPL-3)

## Autores
- Vincent Arel-Bundock
- [Alejandro Rodriguez Cuellar](https://github.com/arcuellar88)
- Socrata: Proveedor de api en el portal de Datos abiertos.

## Links útiles
- https://data.iadb.org/
- [Sobre el API](https://data.iadb.org/NumbersForDevelopment/NumbersForDevelopment)
