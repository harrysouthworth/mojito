#' Read data obtained from UK Historic Weather Station Data and AZN price data and create data objects
#' @aliases updateAZN
#' @details Use \code{tail(eksdalemuir)} and \code{tail(newtonrigg)} to find
#' out if it worked. You might want to delete the .txt files once you're done.
#' These functions are intended for use to update the course data prior to
#' it being run and are not intended for use by the students.
#' NOTE THAT the function assumes the first line of the txt weather files is the
#' one starting with "yyyy mm ...". Also NOTE THAT to get the AZN data, go to
#' Yahoo finance UK, find AZN, look for the "Historical data" link in the
#' bar along the top. The start date is 10-24-1993 (i.e. US format).
#' @param dataPath String giving path to the downloaded .txt files. Defaults
#'   to \code{dataPath = "data"}.
#' @param eskdalemuir Strings giving the names of the files to
#'   read from the data directory. NOTE THAT the file format is assumed to be
#'   space separated values for the weather data, csv for the AZN data.
#' @keywords internal
updateUKweatherData <- function(dataPath="data/", eskdalemuir = "eskdalemuir.txt",
                                newtonrigg = "newtonrigg.txt"){
  eskdalemuir <- suppressMessages(readr::read_table(file.path(dataPath, eskdalemuir)))[-1, ]
  eskdalemuir <- suppressWarnings(
    mutate(eskdalemuir, tmax = as.numeric(tmax), tmin = as.numeric(tmin),
           af = as.numeric(af),
           sun = gsub("#", "", sun), sun = gsub("*", "", sun),
           sun = gsub("  Provisional", "", sun),
           sun = as.numeric(sun),
           mm = ifelse(mm < 10, paste0("0", mm), as.character(mm)))
    ) %>% as.data.frame()

  newtonrigg <- suppressMessages(readr::read_table(file.path(dataPath, newtonrigg)))[-1, ]
  newtonrigg <- suppressWarnings(
    mutate(newtonrigg,
           tmax = as.numeric(gsub("*", "", tmax)),
           tmin = as.numeric(gsub("*", "", tmin)),
           rain = as.numeric(gsub("*", "", rain)),
           af = as.numeric(gsub("*", "", af)),
           sun = as.numeric(gsub("*", "", sun)),
           mm = ifelse(mm < 10, paste0("0", mm), as.character(mm)))
    ) %>%
    as.data.frame()

  save(eskdalemuir, file = file.path(dataPath, "eskdalemuir.RData"))
  save(newtonrigg, file = file.path(dataPath, "newtonrigg.RData"))

  invisible()
}

updateAZN <- function(dataPath="data", azn = "azn.csv"){
  azn <- readr::read_csv(file.path(dataPath, "azn.csv")) %>%
    setNames(tolower(names(.))) %>%
    select(-`adj close`) %>%
    as.data.frame()


  save(azn, file = file.path(dataPath, "azn.RData"))

  invisible()
}
