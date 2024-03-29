% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/skim_print.R
\name{knit_print}
\alias{knit_print}
\alias{knit_print.skim_df}
\alias{knit_print.skim_list}
\alias{knit_print.one_skim_df}
\alias{knit_print.summary_skim_df}
\title{Provide a default printing method for knitr.}
\usage{
\method{knit_print}{skim_df}(x, options = NULL, ...)

\method{knit_print}{skim_list}(x, options = NULL, ...)

\method{knit_print}{one_skim_df}(x, options = NULL, ...)

\method{knit_print}{summary_skim_df}(x, options = NULL, ...)
}
\arguments{
\item{x}{An R object to be printed}

\item{options}{Options passed into the print function.}

\item{...}{Additional arguments passed to the S3 method. Currently ignored,
except two optional arguments \code{options} and \code{inline}; see
the references below.}
}
\value{
A \code{knit_asis} object. Which is used by \code{knitr} when rendered.
}
\description{
Instead of standard R output, \code{knitr} and \code{RMarkdown} documents will have
formatted \code{\link[knitr:kable]{knitr::kable()}} output on return. You can disable this by setting
the chunk option \code{render = normal_print}.
}
\details{
The summary statistics for the original data frame can be disabled by setting
the \code{knitr} chunk option \code{skimr_include_summary = FALSE}. See
\link[knitr:opts_chunk]{knitr::opts_chunk} for more information. You can change the number of digits
shown in the printed table with the \code{skimr_digits} chunk option.

Alternatively, you can call \code{\link[=collapse]{collapse()}} or \code{\link[=yank]{yank()}} to get the particular
\code{skim_df} objects and format them however you like. One warning though.
Because histograms contain unicode characters, they can have unexpected
print results, as R as varying levels of unicode support. This affects
Windows users most commonly. Call \code{vignette("Using_fonts")} for more details.
}
\section{Methods (by class)}{
\itemize{
\item \code{knit_print(skim_df)}: Default \code{knitr} print for \code{skim_df} objects.

\item \code{knit_print(skim_list)}: Default \code{knitr} print for a \code{skim_list}.

\item \code{knit_print(one_skim_df)}: Default \code{knitr} print within a partitioned \code{skim_df}.

\item \code{knit_print(summary_skim_df)}: Default \code{knitr} print for \code{skim_df} summaries.

}}
\seealso{
\code{\link[knitr:kable]{knitr::kable()}}
}
