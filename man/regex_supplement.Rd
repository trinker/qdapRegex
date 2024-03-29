% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/qdapRegex-package.R
\docType{data}
\name{regex_supplement}
\alias{regex_supplement}
\title{Supplemental Canned Regular Expressions}
\format{
A list with 24 elements
}
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
  \item{except_first}{find all occurrences of a substring except the first; regex pattern retrieved from  \href{https://stackoverflow.com/users/3732271/akrun}{StackOverflow's akrun}: \url{https://stackoverflow.com/a/31458261/1000343}} 
  \item{hexadecimal}{substring beginning with hash (#) followed by either 3 or 6 select characters (a-f, A-F, and 0-9)}
  \item{ip_address}{substring of four chunks of 1-3 consecutive digits separated with dots (.)}
  \item{last_occurrence}{last occurrence of a delimiter; note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own (user supplies the delimiter)}
  \item{pages}{substring with "pp." or "p.", optionally followed by a space, followed by 1 or more digits, optionally followed by a dash, optionally followed by 1 or more digits, optionally followed by a semicolon, optionally followed by a space, optionally followed by 1 or more digits; intended for extraction/removal purposes}
  \item{pages2}{substring 1 or more digits, optionally followed by a dash, optionally followed by 1 or more digits, optionally followed by a semicolon, optionally followed by a space, optionally followed by 1 or more digits; intended for validation purposes}
  \item{punctuation}{punctuation characters (\code{[:punct:]}) with the ability to negate; note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own}
  \item{run_split}{a regex that is useful for splitting strings in the characters runs (e.g., "wwxyyyzz" becomes "ww", "x", "yyy", "zz"); regex pattern retrieved from \href{https://stackoverflow.com/users/2994949/rawr}{Robert Redd}: \url{https://stackoverflow.com/a/29383435/1000343}}
  \item{split_keep_delim}{regex string that splits on a delimiter and retains the delimiter}
  \item{thousands_separator}{chunks digits > 4 into groups of 3 from right to left allowing for easy insertion of thousands separator; regex pattern retrieved from \href{https://stackoverflow.com/}{StackOverflow}'s stema: \url{https://stackoverflow.com/a/10612685/1000343}}
  \item{time_12_hours}{substring of valid hours (1-12) followed by a colon (:) followed by valid minutes (0-60), followed by an optional space and the character chunk \emph{am} or \emph{pm}} 
  \item{version}{substring starting with "v" or "version" optionally followed by a space and then period separated digits for <major>.<minor>.<release>.<build>; the build sequence is optional and the "version"/"v" IS NOT contained in the substring}
  \item{version2}{substring starting with "v" or "version" optionally followed by a space and then period separated digits for <major>.<minor>.<release>.<build>; the build sequence is optional and the "version"/"v" IS contained in the substring}
  \item{white_after_comma}{substring of white space after a comma}
  \item{word_boundary}{A true word boundary that only includes alphabetic characters; based on \url{https://www.rexegg.com/}'s suggestion taken from \href{https://www.rexegg.com/regex-boundaries.html#real-word-boundary}{discussion of true word boundaries}; note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own}
  \item{word_boundary_left}{A true left word boundary that only includes alphabetic characters; based on \url{https://www.rexegg.com/}'s suggestion taken from \href{https://www.rexegg.com/regex-boundaries.html#real-word-boundary}{discussion of true word boundaries}}
  \item{word_boundary_right}{A true right word boundary that only includes alphabetic characters; based on \url{https://www.rexegg.com/}'s suggestion taken from \href{https://www.rexegg.com/regex-boundaries.html#real-word-boundary}{discussion of true word boundaries}}	
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

\examples{
time <- rm_(pattern="@time_12_hours")
time("I will go at 12:35 pm")

x <- "v6.0.156 for Windows 2000/2003/XP/Vista
Server version 1.1.20
Client Manager version 1.1.24"

rm_default(x, pattern = "@version", extract=TRUE)
rm_default(x, pattern = "@version2", extract=TRUE)

x <- "this is 1000000 big 4356.  And little 123 number."
rm_default(x, pattern="@thousands_separator", replacement="\\\\1,")
rm_default(x, pattern="@thousands_separator", replacement="\\\\1.")

rm_default("I was,but it costs 10,000.", pattern="@white_after_comma", 
    replacement=", ")

x <- "I like; the donuts; a lot"
strsplit(x, ";")
strsplit(x, S(grab("split_keep_delim"), ";"), perl=TRUE)
stringi::stri_split_regex(x, S(grab("split_keep_delim"), ";"))
stringi::stri_split_regex("I like; the donuts; a lot:cool", 
    S(grab("split_keep_delim"), ";|:"))

## Grab words around a point
x <- c(
    "the magic word is e",
    "the dog is red and they are blue",
    "I am new but she is not new",
    "hello world",
    "why is it so cold?  Perhaps it is Winter.",
    "It is not true the 7 is 8.",
    "Is that my drink?"
)

rm_default(x, pattern = S("@around_", 1, "is", 1), extract=TRUE)
rm_default(x, pattern = S("@around_", 2, "is", 2), extract=TRUE)
rm_default(x, pattern = S("@around_", 1, "is|are|am", 1), extract=TRUE)
rm_default(x, pattern = S("@around_", 1, "is not|is|are|am", 1), extract=TRUE)
rm_default(x, pattern = S("@around_", 1, 
    "is not|[Ii]s|[Aa]re|[Aa]m", 1), extract=TRUE)

x <- c(
    "hello world",
    "45",
    "45 & 5 makes 50",
    "x and y",
    "abc and def",
    "her him foo & bar for Jack and Jill then"
)

around_and <- rm_(pattern = S("@around_", 1, "and|\\\\&", 1), extract=TRUE)
around_and(x)

## Split runs into chunks
x <- "1111100000222000333300011110000111000"
strsplit(x, grab("@run_split"), per = TRUE)

\dontrun{
library(qdap);library(ggplot2);library(reshape2)

out <- setNames(lapply(c("@after_a", "@after_the"), function(x) {
    o <- rm_default(stringi:::stri_trans_tolower(pres_debates2012$dialogue), 
        pattern = x, extract=TRUE)
    m <- qdapTools::matrix2df(data.frame(freq=sort(table(unlist(o)), TRUE)), "word")
    m[m$freq> 7, ]
}), c("a", "the"))


dat <- setNames(Reduce(function(x, y) {
    merge(x, y, by = "word", all = TRUE)}, out), c("Word", "A", "THE"))

dat <- reshape2::melt(dat, id="Word", variable.name="Article", value.name="freq")

dat <- dat[order(dat$freq, dat$Word), ]

ord <- aggregate(freq ~ Word, dat, sum)

dat$word <- factor(dat$Word, levels=ord[order(ord[[2]]), 1])
ggplot(dat, aes(x=freq, y=Word)) + geom_point()+ facet_grid(~Article)
}

## remove/extract pages numbers
x <- c("I read p. 36 and then pp. 45-49", "it's on pp. 23-24;28")

rm_pages <- rm_(pattern="@pages", extract=TRUE)
rm_pages(x)

rm_default(x, pattern = "@pages")
rm_default(x, pattern = "@pages", extract=TRUE)
rm_default(x, pattern = "@pages2", extract=TRUE)

## Validate pages
page_val <- validate("@pages2", FALSE)
page_val(c(66, "78-82", "hello world", TRUE, "44-45; 56"))

## Split on last occurrence
x <- c(
    "test@aol@fg.mm.com", 
    "test@hotmail.com", 
    "test@xyz@rr@lk.edu", 
    "test@abc.xx@zz.vv.net"
)

strsplit(x, S("@last_occurrence", "\\\\."), perl=TRUE)
strsplit(x, S("@last_occurrence", "@"), perl=TRUE)

## True Word Boundaries
x <- "this is _not a word666 and this is not a word too." 
## Standard regex word boundary
rm_default(x, pattern=bind("not a word"))
## Alphabetic only word boundaries
rm_default(x, pattern=S("@word_boundary", "not a word"))

## Remove all but first occurrence of something
x <- c(
    "12-3=4-5=678-9", 
    "ABC-D=EF2-GHI-JK3=L-MN=", 
    "9-87=65", 
    "a - de=4fgh --= i5jkl", 
    NA
)

rm_default(x, pattern = S("@except_first", "-"))
rm_default(x, pattern = S("@except_first", "="))
}
