% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/qdapRegex-package.R
\docType{data}
\name{regex_supplement}
\alias{regex_supplement}
\title{Supplemental Canned Regular Expressions}
\format{A list with 24 elements}
\usage{
data(regex_supplement)
}
\description{
A dataset containing a list of supplemental, canned regular expressions.  The 
regular expressions in this data set are considered useful but have not been 
included in a formal function (of the type \code{rm_XXX}).  Users can utilize 
the \code{rm_} function to generate functions that can sub/replace/extract as
desired.
}
\details{
The following canned regular expressions are included:
\describe{
  \item{after_a}{single word after the word "a"}
  \item{after_the}{single word after the word "the"}
  \item{after_}{find single word after ? word (? = user defined); note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own (user supplies (1) n before, (2) the point, & (3) n after)}
  \item{around_}{find n words (not including punctuation) before or after  ? word (? = user defined); note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own (user supplies (1) n before, (2) the point, & (3) n after)}
  \item{around2_}{find n words (plus punctuation) before or after  ? word (? = user defined); note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own}
  \item{before_}{find sing word before ? word (? = user defined); note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own}
  \item{except_first}{find all occurrences of a substring except the first; regex pattern retrieved from  \href{http://stackoverflow.com/users/3732271/akrun}{StackOverflow's akrun}: \url{http://stackoverflow.com/a/31458261/1000343}} 
  \item{hexadecimal}{substring beginning with hash (#) followed by either 3 or 6 select characters (a-f, A-F, and 0-9)}
  \item{ip_address}{substring of four chunks of 1-3 consecutive digits separated with dots (.)}
  \item{last_occurrence}{last occurrence of a delimiter; note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own (user supplies the delimiter)}
  \item{pages}{substring with "pp." or "p.", optionally followed by a space, followed by 1 or more digits, optionally followed by a dash, optionally followed by 1 or more digits, optionally followed by a semicolon, optionally followed by a space, optionally followed by 1 or more digits; intended for extraction/removal purposes}
  \item{pages2}{substring 1 or more digits, optionally followed by a dash, optionally followed by 1 or more digits, optionally followed by a semicolon, optionally followed by a space, optionally followed by 1 or more digits; intended for validation purposes}
  \item{punctuation}{punctuation characters (\code{[:punct:]}) with the ability to negate; note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own}
  \item{run_split}{a regex that is useful for splitting strings in the characters runs (e.g., "wwxyyyzz" becomes "ww", "x", "yyy", "zz"); regex pattern retrieved from \href{http://stackoverflow.com/users/2994949/rawr}{Robert Redd}: \url{http://stackoverflow.com/a/29383435/1000343}}
  \item{split_keep_delim}{regex string that splits on a delimiter and retains the delimiter}
  \item{thousands_separator}{chunks digits > 4 into groups of 3 from right to left allowing for easy insertion of thousands separator; regex pattern retrieved from \href{http://stackoverflow.com/}{StackOverflow}'s stema: \url{http://stackoverflow.com/a/10612685/1000343}}
  \item{time_12_hours}{substring of valid hours (1-12) followed by a colon (:) followed by valid minutes (0-60), followed by an optional space and the character chunk \emph{am} or \emph{pm}} 
  \item{version}{substring starting with "v" or "version" optionally followed by a space and then period separated digits for <major>.<minor>.<release>.<build>; the build sequence is optional and the "version"/"v" IS NOT contained in the substring}
  \item{version2}{substring starting with "v" or "version" optionally followed by a space and then period separated digits for <major>.<minor>.<release>.<build>; the build sequence is optional and the "version"/"v" IS contained in the substring}
  \item{white_after_comma}{substring of white space after a comma}
  \item{word_boundary}{A true word boundary that only includes alphabetic characters; based on \url{www.rexegg.com}'s suggestion taken from \href{http://www.rexegg.com/regex-boundaries.html#real-word-boundary}{discussion of true word boundaries}; note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own}
  \item{word_boundary_left}{A true left word boundary that only includes alphabetic characters; based on \url{www.rexegg.com}'s suggestion taken from \href{http://www.rexegg.com/regex-boundaries.html#real-word-boundary}{discussion of true word boundaries}}
  \item{word_boundary_right}{A true right word boundary that only includes alphabetic characters; based on \url{www.rexegg.com}'s suggestion taken from \href{http://www.rexegg.com/regex-boundaries.html#real-word-boundary}{discussion of true word boundaries}}	
  \item{youtube_id}{substring of the video id from a \href{https://www.youtube.com}{YouTube} video; taken from Jacob Overgaard's submission found https://regex101.com/r/kU7bP8/1}
} 

Regexes from this data set can be added to the \code{pattern} argument of any 
\code{rm_XXX} function via an at sign (@) followed by a regex name from
this data set (e.g., \code{pattern = "@after_the"}) provided the regular 
expression does not contain non-regex such as \code{\link[base]{sprintf}} 
character string \code{\%s}.

Use \code{qdapRegex:::examine_regex(regex_supplement)} to 
interactively explore the regular expressions in \code{regex_usa}.  This will 
provide a browser + console based break down of each regex in the dictionary.
}
\section{Warning}{
 Note that regexes containing \code{\%s} are replaced by 
\code{\link[base]{sprintf}} and are not a valid regex on their own. The
\code{\link[qdapRegex]{S}} is useful for adding these missing \code{\%s} 
parameters.
}

\keyword{datasets}
