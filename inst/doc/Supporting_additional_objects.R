## -----------------------------------------------------------------------------
library(skimr)
library(sf)
nc <- st_read(system.file("shape/nc.shp", package = "sf"))

## -----------------------------------------------------------------------------
class(nc)

class(nc$geometry)

## -----------------------------------------------------------------------------
skim(nc$geometry)

## -----------------------------------------------------------------------------
get_crs <- function(column) {
  crs <- sf::st_crs(column)

  paste0("epsg: ", crs[["epsg"]], " proj4string: '", crs[["proj4string"]], "'")
}

## -----------------------------------------------------------------------------
skim_sf <- skim_with(
  sfc = sfl(
    n_unique = n_unique,
    valid = ~ sum(sf::st_is_valid(.)),
    crs = get_crs
  )
)

## -----------------------------------------------------------------------------
skim_sf(nc$geometry)

## -----------------------------------------------------------------------------
#' @importFrom skimr get_skimmers
#' @export
get_skimmers.sfc <- function(column) {
  sfl(
    skim_type = "sfc",
    n_unique = n_unique,
    valid = ~ sum(sf::st_is_valid(.)),
    crs = get_crs
  )
}

## -----------------------------------------------------------------------------
get_default_skimmer_names()

## -----------------------------------------------------------------------------
skim(nc)

