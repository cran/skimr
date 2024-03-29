% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/skim_print.R
\name{print}
\alias{print}
\alias{print.skim_df}
\alias{print.skim_list}
\alias{print.summary_skim_df}
\title{Print \code{skim} objects}
\usage{
\method{print}{skim_df}(
  x,
  include_summary = TRUE,
  n = Inf,
  width = Inf,
  summary_rule_width = getOption("skimr_summary_rule_width", default = 40),
  ...
)

\method{print}{skim_list}(x, n = Inf, width = Inf, ...)

\method{print}{summary_skim_df}(x, .summary_rule_width = 40, ...)
}
\arguments{
\item{x}{Object to format or print.}

\item{include_summary}{Whether a summary of the data frame should be printed}

\item{n}{Number of rows to show. If \code{NULL}, the default, will print all rows
if less than the \code{print_max} \link[pillar:pillar_options]{option}.
Otherwise, will print as many rows as specified by the
\code{print_min} \link[pillar:pillar_options]{option}.}

\item{width}{Width of text output to generate. This defaults to \code{NULL}, which
means use the \code{width} \link[pillar:pillar_options]{option}.}

\item{summary_rule_width}{Width of Data Summary cli rule, defaults to 40.}

\item{...}{Passed on to \code{\link[=tbl_format_setup]{tbl_format_setup()}}.}

\item{.summary_rule_width}{the width for the main rule above the summary.}
}
\description{
\code{skimr} has custom print methods for all supported objects. Default printing
methods for \code{knitr}/ \code{rmarkdown} documents is also provided.
}
\section{Methods (by class)}{
\itemize{
\item \code{print(skim_df)}: Print a skimmed data frame (\code{skim_df} from \code{\link[=skim]{skim()}}).

\item \code{print(skim_list)}: Print a \code{skim_list}, a list of \code{skim_df} objects.

\item \code{print(summary_skim_df)}: Print method for a \code{summary_skim_df} object.

}}
\section{Printing options}{


For better or for worse, \code{skimr} often produces more output than can fit in
the standard R console. Fortunately, most modern environments like RStudio
and Jupyter support more than 80 character outputs. Call
\code{options(width = 90)} to get a better experience with \code{skimr}.

The print methods in \code{skimr} wrap those in the \link[tibble:formatting]{tibble}
package. You can control printing behavior using the same global options.
}

\section{Behavior in \code{dplyr} pipelines}{


Printing a \code{skim_df} requires specific columns that might be dropped when
using \code{\link[dplyr:select]{dplyr::select()}} or \code{\link[dplyr:summarise]{dplyr::summarize()}} on a \code{skim_df}. In those
cases, this method falls back to \code{\link[tibble:formatting]{tibble::print.tbl()}}.
}

\section{Options for controlling print behavior}{


You can control the width rule line for the printed subtables with an option:
\code{skimr_table_header_width}.
}

\seealso{
\code{\link[tibble:trunc_mat]{tibble::trunc_mat()}} For a list of global options for customizing
print formatting. \code{\link[crayon:has_color]{crayon::has_color()}} for the variety of issues that
affect tibble's color support.
}
