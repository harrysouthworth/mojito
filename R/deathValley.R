if (FALSE){
  library(tidyverse)
  library(mgcv)

  dv <- read.csv("data/deathValley2020.csv") %>%
    setNames(tolower(names(.))) %>%
    select(date, tmax) %>%
    mutate(date = lubridate::ymd(date),
           year = lubridate::year(date),
           month = lubridate::month(date),
           day = lubridate::day(date),
           dayofyear = lubridate::yday(date),
           time = 1:nrow(.)) %>%
    na.omit()

  m <- gamm(tmax ~ s(dayofyear, bs = "cc", k = 20) + s(time, bs = "cr"),
            data = dv, correlation = corAR1(form = ~ 1 | year))

  dv$expected <- fitted(m[[2]])
  dv$residual <- resid(m[[2]])

  save(dv, file = "data/deathValley2020.RData")
}
