## -----------------------------------------------------------------------------
library(skimr)
library(sf)
nc <- st_read(system.file("shape/nc.shp", package = "sf"))

## -----------------------------------------------------------------------------
class(nc)

## -----------------------------------------------------------------------------
skim(nc$geometry)

## -----------------------------------------------------------------------------
funny_sf <- function(x) {
  length(x) + 1
}

## -----------------------------------------------------------------------------
skim_sf <- skim_with(
  sfc_MULTIPOLYGON = sfl(
    n_unique = n_unique,
    valid = ~ sum(sf::st_is_valid(.)),
    funny = funny_sf
  )
)

## -----------------------------------------------------------------------------
skim_sf(nc$geometry)

## -----------------------------------------------------------------------------
skim_by_type.sfc_MULTIPOLYGON <- function(mangled, columns, data) {
  skimmed <- dplyr::summarize_at(data, columns, mangled$funs)
  build_results(skimmed, columns, NULL)
}

## -----------------------------------------------------------------------------
skim_sf(nc)

## -----------------------------------------------------------------------------
#' Skimming functions for `sfc_MULTIPOLYGON` objects.
#' @export
skim_sf <- skim_with(
  sfc_MULTIPOLYGON = sfl(
    missing = n_missing,
    n = length,
    n_unique = n_unique,
    valid = ~ sum(sf::st_is_valid(.)),
    funny = funny_sf
  )
)

#' A skim_by_type function for `sfc_MULTIPOLYGON` objects.
#' @export
skim_by_type.sfc_MULTIPOLYGON <- function(mangled, columns, data) {
  skimmed <- dplyr::summarize_at(data, columns, mangled$funs)
  skimr::build_results(skimmed, columns, NULL)
}

## -----------------------------------------------------------------------------
#' @importFrom skimr get_skimmers
#' @export
get_skimmers.sfc_MULTIPOLYGON <- function(column) {
  sfl(
    skim_type = "sfc_MULTIPOLYGON",
    n_unique = n_unique,
    valid = ~ sum(sf::st_is_valid(.)),
    funny = funny_sf
  )
}

## -----------------------------------------------------------------------------
#' @export
get_skimmers.sfc_POINT <- function(column) {
  sfl(
    skim_type = "sfc_POINT",
    n_unique = n_unique,
    valid = ~ sum(sf::st_is_valid(.))
  )
}

## -----------------------------------------------------------------------------
get_default_skimmer_names()

