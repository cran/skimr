## ------------------------------------------------------------------------
summary(iris)

## ------------------------------------------------------------------------
summary(iris$Sepal.Length)

## ------------------------------------------------------------------------
fivenum(iris$Sepal.Length)

## ------------------------------------------------------------------------
summary(iris$Species)

## ------------------------------------------------------------------------
library(skimr)
skim(iris)

## ------------------------------------------------------------------------
s <- skim(iris)
head(s, 15)

## ------------------------------------------------------------------------
mtcars %>%
  dplyr::group_by(gear) %>%
  skim()

## ------------------------------------------------------------------------

skim(iris, Sepal.Length, Species)
skim(iris, starts_with("Sepal"))


## ------------------------------------------------------------------------
skim(datasets::lynx)

## ------------------------------------------------------------------------
lynx <- datasets::lynx
class(lynx) <- "unkown_class"
skim(lynx)

## ------------------------------------------------------------------------
skim_with(numeric = list(mad_name = mad))
skim(datasets::chickwts)

## ------------------------------------------------------------------------
skim_with_defaults()
skim_with(numeric = list(mad_name = mad), append = FALSE)
skim(datasets::chickwts)
skim_with_defaults() # Reset to defaults

## ------------------------------------------------------------------------
skim_with(numeric = list(hist = NULL))
skim(datasets::chickwts)
skim_with_defaults() #

## ----results='asis'------------------------------------------------------

skim(iris) %>% kable()


## ------------------------------------------------------------------------
library(pander)
panderOptions('knitr.auto.asis', FALSE)
skim(iris) %>% pander() 


