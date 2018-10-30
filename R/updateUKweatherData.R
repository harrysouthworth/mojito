#' Read data obtained from UK Historic Weather Station Data and AZN price data and create data objects
#' @aliases updateAZN
#' @details Use \code{tail(eksdalemuir)} and \code{tail(newtonrigg)} to find
#' out if it worked. You might want to delete the .txt files once you're done.
#' These functions are intended for use to update the course data prior to
#' it being run and are not intended for use by the students.
#' @param dataPath String giving path to the downloaded .txt files. Defaults
#'   to \code{dataPath = "data"}.
#' @param eskdalemuir Strings giving the names of the files to
#'   read from the data directory. NOTE THAT the file format is assumed to be
#'   space separated values for the weather data, csv for the AZN data.
#' @keywords internal
updateUKweatherData <- function(dataPath="data/", eskdalemuir = "eskdalemuir.txt",
                                newtonrigg = "newtonrigg.txt"){
  eskdalemuir <- suppressMessages(readr::read_table(file.path(dataPath, eskdalemuir)))
  eskdalemuir <- suppressWarnings(
    mutate(eskdalemuir, tmax = as.numeric(tmax), tmin = as.numeric(tmin),
           af = as.numeric(af), sun = as.numeric(sun))
    ) %>% as.data.frame()

  newtonrigg <- suppressMessages(readr::read_table(file.path(dataPath, newtonrigg)))
  newtonrigg <- suppressWarnings(
    mutate(newtonrigg, tmax = as.numeric(tmax), tmin = as.numeric(tmin),
           rain = as.numeric(rain),
           af = as.numeric(af), sun = as.numeric(sun))
    ) %>%
    as.data.frame()

  save(eskdalemuir, file = file.path(dataPath, "eskdalemuir.RData"))
  save(newtonrigg, file = file.path(dataPath, "newtonrigg.RData"))

  invisible()
}

updateAZN <- function(dataPath="data", azn = "azn.csv"){
  azn <- readr::read_csv(file.path(dataPath, "azn.csv")) %>%
    select(-`adj close`) %>%
    as.data.frame()

  save(azn, file = file.path(dataPath, "azn.RData"))

  invisible()
  }
