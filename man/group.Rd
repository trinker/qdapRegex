% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/group.R
\name{group}
\alias{group}
\title{Group Regular Expressions}
\usage{
group(..., left = "(", right = ")", dictionary = getOption("regex.library"))
}
\arguments{
\item{left}{A single length character vector to use as the left bound.}

\item{right}{A single length character vector to use as the right bound.}

\item{dictionary}{A dictionary of canned regular expressions to search within.}

\item{\ldots}{Regular expressions to add grouping parenthesis to a named 
expression from the default regular expression dictionary prefixed with 
single at (\code{@}) (e.g., \code{"@rm_hash"}) or a regular expression from 
\code{\link[qdapRegex]{regex_supplement}} dictionary prefixed with an at 
(\code{@}) (e.g., \code{"@time_12_hours"}).}
}
\value{
Returns a single string of regular expressions with grouping 
parenthesis added.
}
\description{
\code{group} - A wrapper for \code{paste(collapse="|")} that also searches 
the default and supplemental (\code{\link[qdapRegex]{regex_supplement}}) 
dictionaries for regular expressions before pasting them together with a pipe 
(\code{|}) separator.
}
\examples{
group(LETTERS)
group(1)

(grouped <- group("(the|them)\\\\b", "@rm_zip"))
pastex(grouped)
}
\keyword{group}
\keyword{regex}
