#reto1
library(DBI)
library(RMySQL)

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
