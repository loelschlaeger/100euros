today <- Sys.Date()

### run script only on Sundays
if(lubridate::wday(today) == 1) {

  year <- lubridate::year(today)
  week <- lubridate::week(today)
  
  week_start <- lubridate::floor_date(today, "week") + 1
  week_end <- lubridate::ceiling_date(today, "week")
  
  stocks <- tibble::tribble(
    ~symbol,   ~name,
    "AEC1.HA", "AmericanExpress",
    "CHV.DE",  "Chevron",
    "LIN.DE",  "Diageo",
    "FRE.DE",  "Fresenius",
    "LIN.DE",  "Linde",
    "MDO.DE",  "McDonalds",
    "NKE.DE",  "Nike",
    "ORCL.VI", "Oracle",
    "PRG.DE",  "ProcterGamble",
    "RY6.SG",  "RealtyIncome"
  )

  for(i in 1:10) {
    symbol <- as.character(stocks[i,"symbol"])
    name <- as.character(stocks[i,"name"])
    fHMM::download_data(
      symbol = symbol,
      from = today - 7,
      to = today,
      file = paste0("data-raw/",name,"/",name,"_",year,"_",week,".csv"),
      verbose = FALSE
    )
  }
}
