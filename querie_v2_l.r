#reto1

install.packages("DBI")
install.packages("RMySQL")
install.packages("dplyr")
install.packages("ggplot2")
library(DBI)
library(RMySQL)
library(dplyr)
library(ggplot2)


MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(), #driver de la base de datos
  dbname = "shinydemo",  #Nombre de la base de datos
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com", #host
  username = "guest", #usuario
  password = "guest") #contraseña

dbListTables(MyDataBase)  #nos la lista de tablas

dbListFields(MyDataBase, 'CountryLanguage')

DataDB <- dbGetQuery(MyDataBase, "SELECT * 
                                  from CountryLanguage")


str(DataDB)
filtro.sp<-filter(DataDB, Language == "Spanish")

#Realizar una gráfica con ggplot que represente este porcentaje de tal modo que en el eje de las Y aparezca el país y en X el porcentaje, y que diferencie entre aquellos que es su lengua oficial y los que no de diferente color (puedes utilizar la geom_bin2d() y _ coord_flip()_)

ggplot(filtro.sp, aes( x = CountryCode, y=Percentage, fill = IsOfficial )) + 
  geom_bin2d() +
  coord_flip()+
  ggtitle("Porcentaje de personas que hablen español") +
  ylab("Porcentaje") +
  xlab("País")+
  labs(fill = "Es oficial")
