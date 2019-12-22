RSQLiteGetTagMinMaxTime <- function(dbn,seltag) # this will query for the min and max times of tag of choice
{
  library("RSQLite")
  # connect to the sqlite file
  con = dbConnect(RSQLite::SQLite(),dbn)
  query = paste('select MIN(TIME) from LOCALIZATIONS WHERE TAG=', seltag , sep = "")
  mint = dbGetQuery(con,query)
  query = paste('select MAX(TIME) from LOCALIZATIONS WHERE TAG=', seltag , sep = "")
  maxt = dbGetQuery(con,query)
  dbDisconnect(con)
  return(c(mint,maxt))
}
