#' qdapRegex: Regular expression removal/extraction/replacement tools for the \pkg{qdap} package
#'
#' This package is a collection of  regular expression tools associated with the
#' \pkg{qdap} package that may be useful outside of the context of discourse
#' analysis.  Tools include removal/extraction/replacement of abbreviations, 
#' dates, dollar amounts, email addresses, hash tags, numbers, percentages, 
#' person tags, phone numbers, times, and zip codes.
#' 
#' The \pkg{qdapRegex} package does not aim to compete with string manipulation 
#' packages such as 
#' \href{http://cran.r-project.org/web/packages/stringr/index.html}{\pkg{stringr}} 
#' or \href{http://cran.r-project.org/web/packages/stringi/index.html}{\pkg{stringi}} 
#' but is meant to provide access to canned, common regular expression patterns 
#' that can be used within \pkg{qdapRegex}, with \pkg{R}'s own regular 
#' expression functions, or add on string manipulation packages such as 
#' \code{stringr} and \code{stringi}.
#'
#' @docType package
#' @name qdapRegex
#' @aliases qdapRegex package-qdapRegex
NULL

#' Canned Regular Expressions (United States of America)
#' 
#' A dataset containing a list U.S. specific, canned regular expressions for use
#' in various functions within the \pkg{qdapRegex} package.  
#' 
#' @docType data 
#' @keywords datasets
#' @details The following canned regular expressions are included:
#' \describe{
#'   \item{rm_abbreviation}{abbreviations containing single lower case or capital letter followed by a period and then an optional space (this must be repeated 2 or more times)}
#'   \item{rm_between}{Remove characters between a left and right boundary including the boundaries; note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own}
#'   \item{rm_between2}{Remove characters between a left and right boundary NOT including the boundaries; note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own}
#'   \item{rm_caps}{words containing 2 or more consecutive upper case letters and no lower case}
#'   \item{rm_city_state}{substring with \emph{city} (single lower case word or multiple consecutive capitalized words before a comma and state) & \emph{state} (2 consecutive capital letters)}
#'   \item{rm_city_state_zip}{substring with \emph{city} (single lower case word or multiple consecutive capitalized words before a comma and state) & \emph{state} (2 consecutive capital letters) & \emph{zip code} (exactly 5 or 5+4 consecutive digits)}
#'   \item{rm_date}{dates in the form of 2 digit month, 2 digit day, and 2 or 4 digit year.  Separator between month, day, and year may be dot (.), slash (/), or dash (-)}
#'   \item{rm_date2}{dates in the form of 3-9 letters followed by one or more spaces, 2 digits, a comma(,), one or more spaces, and 4 digits}
#'   \item{rm_date3}{dates in the form of XXXX-XX-XX; hyphen separated string of 4 digit year, 2 digit month, and 2 digit day}
#'   \item{rm_date3}{dates in the form of both \code{rm_date}, \code{rm_date2}, and \code{rm_date3}}
#'   \item{rm_dollar}{substring with dollar sign ($) followed by (1) just dollars (no decimal), (2) dollars and cents (whole number and decimal), or (3) just cents (decimal value)}
#'   \item{rm_email}{substring with (1) alphanumeric characters or dash (-), plus (+), or underscore (_) (\emph{This may be repeated}) (2) followed by at (@@), followed by the same regex sequence as before the at (@@), and ending with dot (.) and 2-14 digits}
#'   \item{rm_emoticon}{common emoticons (logic is complicated to explain in words) using ">?[:;=8XB]\{1\}[-~+o^]?[|\")(&gt;DO>\{pP3/]+|</?3|XD+|D:<|x[-~+o^]?[|\")(&gt;DO>\{pP3/]+" regex pattern; general pattern is optional hat character, followed by eyes character, followed by optional nose character, and ending with a mouth character}
#'   \item{rm_endmark}{substring of the last endmark group in a string; endmarks include (! ? . * OR |)}
#'   \item{rm_endmark3}{substring of the last endmark group in a string; endmarks include (! ? OR .)}
#'   \item{rm_endmark3}{substring of the last endmark group in a string; endmarks include (! ? . * | ; OR :)}
#'   \item{rm_hash}{substring that begins with a hash (#) followed by a word}
#'   \item{rm_nchar_words}{substring of letters (that may contain apostrophes) n letters long (apostrophe not counted in length); note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own}
#'   \item{rm_nchar_words2}{substring of letters (that may contain apostrophes) n letters long (apostrophe counted in length); note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own}
#'   \item{rm_non_ascii}{substring of 2 digits or letters a-f inside of a left and right angle brace in the form of \code{"<a4>"}}
#'   \item{rm_number}{substring that may begin with dash (-) for negatives, and is (1) just whole number (no decimal), (2) whole number and decimal, or (3) just decimal value}
#'   \item{rm_percent}{substring beginning with (1) just whole number (no decimal), (2) whole number and decimal, or (3) just decimal value and followed by a percent sign (\%)}
#'   \item{rm_phone}{phone numbers in the form of optional country code, valid 3 digit prefix, and 7 digits (may contain hyphens and parenthesis); logic is complex to explain (see \url{http://stackoverflow.com/a/21008254/1000343} for more)}
#'   \item{rm_tag}{substring that begins with an at (@@) followed by a word}
#'   \item{rm_tag2}{\href{https://support.twitter.com/articles/101299-why-can-t-i-register-certain-usernames}{Twitter} substring that begins with an at (@@) followed by a word composed of alpha-numeric characters and underscores, no longer than 15 characters}
#'   \item{rm_title_name}{substring beginning with title (Mrs., Mr., Ms., Dr.) that is case independent or full title (Miss, Mizz, mizz) followed by a single lower case word or multiple capitalized words}
#'   \item{rm_time}{substring that (1) must begin with 0-2 digits, (2) must be followed by a single colon (:), (3) optionally may be followed by either a colon (:) or a dot (.), (4) optionally may be followed by 1-infinite digits (if previous condition is true)}
#'   \item{rm_twitter_url}{\href{https://twitter.com/}{Twitter} \href{https://support.twitter.com/articles/109623-about-twitter-s-link-service-http-t-co}{short link/url}; substring optionally beginning with \emph{http}, followed by \emph{t.co} ending on a space or end of string (whichever comes first)}
#'   \item{rm_url}{substring beginning with \emph{http}, \emph{www.}, or \emph{ftp} and ending on a space or end of string (whichever comes first); note that this regex is simple and may not cover all valid URLs or may include invalid URLs}
#'   \item{rm_url2}{substring beginning with \emph{http}, \emph{www.}, or \emph{ftp} and more constrained than \code{rm_url}; based on @@imme_emosol's response from \url{https://mathiasbynens.be/demo/url-regex}}
#'   \item{rm_url3}{substring beginning with \emph{http} or \emph{ftp} and more constrained than \code{rm_url} & \code{rm_url2} though light-weight, making it ideal for validation purposes; taken from @@imme_emosol's response found \url{https://mathiasbynens.be/demo/url-regex}}
#'   \item{rm_white}{substring of white space(s); this regular expression combines \code{rm_white_bracket}, \code{rm_white_colon}, \code{rm_white_comma}, \code{rm_white_endmark}, \code{rm_white_lead}, \code{rm_white_trail}, and \code{rm_white_multiple}}
#'   \item{rm_white_bracket}{substring of white space(s) following left brackets ("\{", "(", "[") or preceding right brackets ("\}", ")", "]")}
#'   \item{rm_white_colon}{substring of white space(s) preceding colon(s)/semicolon(s)}
#'   \item{rm_white_comma}{substring of white space(s) preceding a comma}
#'   \item{rm_white_endmark}{substring of white space(s) preceding a single occurrence/combination of period(s), question mark(s), and exclamation point(s)}
#'   \item{rm_white_lead}{substring of leading white space(s)}
#'   \item{rm_white_lead_trail}{substring of leading/trailing white space(s)}
#'   \item{rm_white_multiple}{substring of multiple, consecutive white spaces}
#'   \item{rm_white_punctuation}{substring of white space(s) preceding a comma or a single occurrence/combination of colon(s), semicolon(s), period(s), question mark(s), and exclamation point(s)}
#'   \item{rm_white_trail}{substring of trailing white space(s)}
#'   \item{rm_zip}{substring of 5 digits optionally followed by a dash and 4 more digits} 
#'   \item{youtube_id}{substring of the video id from a \href{YouTube}{https://www.youtube.com/} video; ; taken from Jacob Overgaard's submissionfound \url{http://regex101.com/r/kU7bP8/1}}
#' }
#' @name regex_usa 
#' @usage data(regex_usa) 
#' @format A list with 42 elements 
NULL

#' Supplemental Canned Regular Expressions
#' 
#' A dataset containing a list of supplemental, canned regular expressions.  The 
#' regular expressions in this data set are considered useful but have not been 
#' included in a formal function (of the type \code{rm_XXX}).  Users can utilize 
#' the \code{rm_} function to generate functions that can sub/replace/extract as
#' desired.
#' 
#' @docType data 
#' @keywords datasets 
#' @name regex_supplement
#' @details The following canned regular expressions are included:
#' \describe{
#'   \item{after_a}{single word after the word "a"}
#'   \item{after_the}{single word after the word "the"}
#'   \item{after_}{find single word after ? word (? = user defined); note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own (user supplies (1) n before, (2) the point, & (3) n after)}
#'   \item{around_}{find n words (not including punctuation) before or after  ? word (? = user defined); note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own (user supplies (1) n before, (2) the point, & (3) n after)}
#'   \item{around2_}{find n words (plus punctuation) before or after  ? word (? = user defined); note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own}
#'   \item{before_}{find sing word before ? word (? = user defined); note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own}
#'   \item{hexadecimal}{substring beginning with hash (#) followed by either 3 or 6 select characters (a-f, A-F, and 0-9)}
#'   \item{ip_address}{substring of four chunks of 1-3 consecutive digits separated with dots (.)}
#'   \item{split_keep_delim}{regex string that splits on a delimiter and retains the delimiter}
#'   \item{thousands_separator}{chunks digits > 4 into groups of 3 from right to left allowing for easy insertion of thousands separator; regex pattern retrieved from \href{http://stackoverflow.com/}{StackOverflow}'s stema: \url{http://stackoverflow.com/a/10612685/1000343}}
#'   \item{time_12_hours}{substring of valid hours (1-12) followed by a colon (:) followed by valid minutes (0-60), followed by an optional space and the character chunk \emph{am} or \emph{pm}} 
#'   \item{white_after_comma}{substring of white space after a comma}
#'   \item{version}{substring starting with "v" or "version" optionally followed by a space and then period separated digits for <major>.<minor>.<release>.<build>; the build sequence is optional and the "version"/"v" IS NOT contained in the substring}
#'   \item{version2}{substring starting with "v" or "version" optionally followed by a space and then period separated digits for <major>.<minor>.<release>.<build>; the build sequence is optional and the "version"/"v" IS contained in the substring}
#' } 
#' 
#' Regexes from this data set can be added to the \code{pattern} argument of any 
#' \code{rm_XXX} function via an at sign (@@) followed by a regex name from
#' this data set (e.g., \code{pattern = "@@after_the"}) provided the regular 
#' expression does not contain non-regex such as \code{\link[base]{sprintf}} 
#' character string \code{\%s}.
#' @section Warning: Note that regexes containing \code{\%s}(s)  are replaced by 
#' \code{\link[base]{sprintf}} and is not a valid regex on its own. The
#' \code{\link[qdapRegex]{S}} is usefult for adding these missing \code{\%s} 
#' parameters.

#' @usage data(regex_supplement) 
#' @format A list with 12 elements
#' @examples 
#' time <- rm_(pattern="@@time_12_hours")
#' time("I will go at 12:35 pm")
#' 
#' x <- "v6.0.156 for Windows 2000/2003/XP/Vista
#' Server version 1.1.20
#' Client Manager version 1.1.24"
#' 
#' rm_default(x, pattern = "@@version", extract=TRUE)
#' rm_default(x, pattern = "@@version2", extract=TRUE)
#' 
#' x <- "this is 1000000 big 4356.  And little 123 number."
#' rm_default(x, pattern="@@thousands_separator", replacement="\\1,")
#' rm_default(x, pattern="@@thousands_separator", replacement="\\1.")
#' 
#' rm_default("I was,but it costs 10,000.", pattern="@@white_after_comma", 
#'     replacement=", ")
#' 
#' x <- "I like; the donuts; a lot"
#' strsplit(x, ";")
#' strsplit(x, S(grab("split_keep_delim"), ";"), perl=TRUE)
#' stringi::stri_split_regex(x, S(grab("split_keep_delim"), ";"))
#' stringi::stri_split_regex("I like; the donuts; a lot:cool", 
#'     S(grab("split_keep_delim"), ";|:"))
#' 
#' ## Grab words around a point
#' x <- c(
#'     "the magic word is e",
#'     "the dog is red and they are blue",
#'     "I am new but she is not new",
#'     "hello world",
#'     "why is it so cold?  Perhaps it is Winter.",
#'     "It is not true the 7 is 8.",
#'     "Is that my drink?"
#' )
#' 
#' rm_default(x, pattern = S("@@around_", 1, "is", 1), extract=TRUE)
#' rm_default(x, pattern = S("@@around_", 2, "is", 2), extract=TRUE)
#' rm_default(x, pattern = S("@@around_", 1, "is|are|am", 1), extract=TRUE)
#' rm_default(x, pattern = S("@@around_", 1, "is not|is|are|am", 1), extract=TRUE)
#' rm_default(x, pattern = S("@@around_", 1, 
#'     "is not|[Ii]s|[Aa]re|[Aa]m", 1), extract=TRUE)
#' 
#' x <- c(
#'     "hello world",
#'     "45",
#'     "45 & 5 makes 50",
#'     "x and y",
#'     "abc and def",
#'     "her him foo & bar for Jack and Jill then"
#' )
#' 
#' around_and <- rm_(pattern = S("@@around_", 1, "and|\\&", 1), extract=TRUE)
#' around_and(x)
#' 
#' \dontrun{
#' library(qdap)'library(ggplot2);library(reshape2)
#' 
#' out <- setNames(lapply(c("@@after_a", "@@after_the"), function(x) {
#'     o <- rm_default(stringi:::stri_trans_tolower(pres_debates2012$dialogue), 
#'         pattern = x, extract=TRUE)
#'     m <- qdapTools::matrix2df(data.frame(freq=sort(table(unlist(o)), TRUE)), "word")
#'     m[m$freq> 7, ]
#' }), c("a", "the"))
#' 
#' 
#' dat <- setNames(Reduce(function(x, y) {
#'     merge(x, y, by = "word", all = TRUE)}, out), c("Word", "A", "THE"))
#' 
#' dat <- reshape2::melt(dat, id="Word", variable.name="Article", value.name="freq")
#' 
#' dat <- dat[order(dat$freq, dat$Word), ]
#' 
#' ord <- aggregate(freq ~ Word, dat, sum)
#' 
#' dat$word <- factor(dat$Word, levels=ord[order(ord[[2]]), 1])
#' ggplot(dat, aes(x=freq, y=Word)) + geom_point()+ facet_grid(~Article)
#' }
NULL
