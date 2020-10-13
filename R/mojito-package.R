#' UK weather station data
#'
#' Monthly summaries of UK weather station data
#'
#' @name eskdalemuir
#' @aliases eskdalemuir newtonrigg
#' @docType data
#' @format A \code{data.frame}:
#' \describe{
#'   \item{yyyy,mm}{The year and month.}
#'   \item{tmax}{Mean daily maximum and minimum temperature.}
#'   \item{af}{Days of air frost}
#'   \item{rain}{Total rainfall.}
#'   \item{sun}{Total sunshine duration.}
#' }
#' @source UK Met Office website: https://www.metoffice.gov.uk/public/weather/climate-historic/#?tab=climateHistoric
#' @keywords data
NULL


#' AstraZeneca London Stock Exchange share price
#'
#' Daily prices for LON: AZN
#'
#' @name azn
#' @docType data
#' @format A \code{data.frame}:
#' \describe{
#'   \item{date}{The date.}
#'   \item{open,high,low,close}{The opening price, high, low and closing price.}
#'   \item{volume}{Volume of shares traded}
#' }
#' @source Various financial websites carry the data. Search for "UK share prices"
#' and you'll find some.
#' @keywords data
NULL


#' Venezuela rainfall data
#'
#' Daily rainfall data in Venezuela from 1961 to 1999.
#'
#' @name venezuelaRain
#' @docType data
#' @format A \code{data.frame}:
#' \describe{
#'   \item{Year,Month,Day}{Numeric values for year, month and day.}
#'   \item{Rainfall}{Daily rainfall.}
#' }
#' @keywords data
NULL


#' 3-day maximal wind gusts, Netherlands
#'
#' 3-day maxima measured in 0.1 m/s from only the summer months of June, July, August, between 1st January 1990 to May 16th 2012.
#' Locations of the 22 inland weather stations in the Netherlands at which the data are measured are also given.
#'
#' @name KNMIdata
#' @aliases KNMIdata
#' @docType data
#' @format A \code{list} with the following elements:
#' \describe{
#'   \item{data}{A \code{matrix} whose columns correspond to spatial locaitons of stations, and rows to observed wind gusts speeds.}
#'   \item{loc}{A \code{matrix} with 2 columns corresponding to x- and y- coordinates of measurement locations respectively, in the order in which the stations appear in the \code{data} object; distance units are not specified.}
#' }
#' @source John HJ Einmahl, Anna Kiriliouk, Andrea Krajina, and Johan Segers. "An m-estimator of spatial tail dependence."  Journal of the Royal Statistical Society: Series B (Statistical Methodology), 78(1):275-298, 2016.
#' @keywords data
NULL

#' Maximum daily temperatures
#'
#' Maximum daily temperatures in deg C during summer months only.  Data has been pre-processed from the published data.
#'
#' @name heatwave.dat
#' @docType data
#' @format A \code{vector} of numeric values of temperatures.
#' @source H. C. Winter and J. A. Tawn "Modelling heatwaves in central France: a case-study in extremal dependence", Appl. Statist., 65 (2016), 345 -- 365. EUROPEAN CLIMATE ASSESSMENT & DATASET (ECA&D), THESE DATA CAN BE USED FREELY PROVIDED THAT THE FOLLOWING SOURCE IS ACKNOWLEDGED: 	Klein Tank, A.M.G. and Coauthors, 2002. Daily dataset of 20th-century surface air temperature and precipitation series for the European Climate Assessment. Int. J. of Climatol., 22, 1441-1453. Data and metadata available at http://www.ecad.eu
NULL

#' Death Valley maximum daily temperatures
#'
#' Daily maximum temperatures recorded in Furnace Creek, Death Valley. Provided
#' on request by National Centers for Environmental Information:
#' https://www.ncdc.noaa.gov/
#'
#' @name dv
#' @docType data
#' @format A \code{data.frame} with dates, maximum daily temperature, and the
#'   expected values and residuals from a generalized additive mixed model
#'   allowing for an annual cycle.
#' @keywords data
NULL


#' Data for teaching and learning extreme value modelling
#'
#' Supplemental data to what is supplied in the texmex package
