## -----------------------------------------------------------------------------
library(skimr)

## -----------------------------------------------------------------------------
results <- lm(weight ~ feed, data = chickwts)
class(results)
attributes(results)

## ---- eval = FALSE------------------------------------------------------------
#  as.data.frame(results)
#  #> Error in as.data.frame.default(results) :
#  #>  cannot coerce class ‘"lm"’ to a data.frame

## -----------------------------------------------------------------------------
skim(results$model)

## -----------------------------------------------------------------------------
skim_lm <- function(.data) {
  .data <- .data$model
  skimr::skim(.data)
}

lm(weight ~ feed, data = chickwts) %>% skim_lm()

## -----------------------------------------------------------------------------
skim_lm <- function(.data, fit = FALSE) {
  .data <- .data$model
  if (fit) {
    .data <- .data %>%
      dplyr::bind_cols(
        fitted = data.frame(results$fitted.values),
        residuals = data.frame(results$residuals)
      )
  }
  skimr::skim(.data)
}

## -----------------------------------------------------------------------------
skim_lm(results, fit = TRUE)

## -----------------------------------------------------------------------------
class(UScitiesD)
UScitiesD

## -----------------------------------------------------------------------------
skim_dist <- function(.data) {
  .data <- data.frame(as.matrix(.data))
  skimr::skim(.data)
}

## -----------------------------------------------------------------------------
as.data.frame.dist <- function(.data) {
  .data <- data.frame(as.matrix(.data))

  .data[] <- lapply(.data, structure, class = "distance", nms = names(.data))
  .data
}

as.data.frame(UScitiesD)

## -----------------------------------------------------------------------------
skim(UScitiesD)

## -----------------------------------------------------------------------------
get_nearest <- function(column) {
  closest <- which.min(column[column != 0])
  cities <- attr(column, "nms")[column != 0]
  toString(cities[closest])
}

get_furthest <- function(column) {
  furthest <- which.max(column[column != 0])
  cities <- attr(column, "nms")[column != 0]
  toString(cities[furthest])
}

## -----------------------------------------------------------------------------
skim_with_dist <- skim_with(
  distance = sfl(
    nearest = get_nearest,
    furthest = get_furthest
  )
)

skim_with_dist(UScitiesD)

## -----------------------------------------------------------------------------
#' @importFrom skimr get_skimmers
#' @export
get_skimmers.distance <- function(column) {
  sfl(
    skim_type = "distance",
    nearest = get_nearest,
    furthest = get_furthest
  )
}

## -----------------------------------------------------------------------------
get_default_skimmer_names()

## -----------------------------------------------------------------------------
skim(UScitiesD)

