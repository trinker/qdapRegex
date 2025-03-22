#' qdapRegex: Regular Expression Removal, Extraction, & Replacement Tools for the \pkg{qdap} Package
#'
#' \pkg{qdapRegex} is a collection of regular expression tools associated with 
#' the \pkg{qdap} package that may be useful outside of the context of discourse
#' analysis.  Tools include removal/extraction/replacement of abbreviations, 
#' dates, dollar amounts, email addresses, hash tags, numbers, percentages, 
#' citations, person tags, phone numbers, times, and zip codes.
#' 
#' The \pkg{qdapRegex} package does not aim to compete with string manipulation 
#' packages such as 
#' \href{https://CRAN.R-project.org/package=stringr}{\pkg{stringr}} 
#' or \href{https://CRAN.R-project.org/package=stringi}{\pkg{stringi}} 
#' but is meant to provide access to canned, common regular expression patterns 
#' that can be used within \pkg{qdapRegex}, with \pkg{R}'s own regular 
#' expression functions, or add on string manipulation packages such as 
#' \code{stringr} and \code{stringi}.
#'
#' @docType package
#' @name qdapRegex
#' @aliases qdapRegex package-qdapRegex
NULL

#' 
#' A dataset containing the regex chunk name, the regex string, and a 
#' description of what the chunk does.
#' 
#' @details 
#' \itemize{ 
#'   \item Name. The name of the regex chunk.
#'   \item Regex. The regex chunk.
#'   \item What it Does. Description of what the regex chunk does.
#' } 
#' 
#' @docType data 
#' @name regex_cheat 
#' @usage data(regex_cheat) 
#' @format A data frame with 6 rows and 3 variables 
NULL


#' Canned Regular Expressions (United States of America)
#' 
#' A dataset containing a list U.S. specific, canned regular expressions for use
#' in various functions within the \pkg{qdapRegex} package.  
#' 
#' @docType data 
#' @details The following canned regular expressions are included:
#' \describe{
#'   \item{rm_abbreviation}{abbreviations containing single lower case or capital letter followed by a period and then an optional space (this must be repeated 2 or more times)}
#'   \item{rm_between}{Remove characters between a left and right boundary including the boundaries; note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own}
#'   \item{rm_between2}{Remove characters between a left and right boundary NOT including the boundaries; note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own}
#'   \item{rm_caps}{words containing 2 or more consecutive upper case letters and no lower case}
#'   \item{rm_caps_phrase}{phrases of 1 word or more containing 1 or more consecutive upper case letters and no lower case; if phrase is one word long then phrase must be 2 or more consecutive capital letters}
#'   \item{rm_citation}{substring that looks for in-text and parenthetical APA6 style citations (attempts to exclude references)}
#'   \item{rm_citation2}{substring that looks for in-text APA6 style citations (attempts to exclude references)}
#'   \item{rm_citation3}{substring that looks for parenthetical APA6 style citations (attempts to exclude references)}
#'   \item{rm_city_state}{substring with \emph{city} (single lower case word or multiple consecutive capitalized words before a comma and state) & \emph{state} (2 consecutive capital letters)}
#'   \item{rm_city_state_zip}{substring with \emph{city} (single lower case word or multiple consecutive capitalized words before a comma and state) & \emph{state} (2 consecutive capital letters) & \emph{zip code} (exactly 5 or 5+4 consecutive digits)}
#'   \item{rm_date}{dates in the form of 2 digit month, 2 digit day, and 2 or 4 digit year.  Separator between month, day, and year may be dot (.), slash (/), or dash (-)}
#'   \item{rm_date2}{dates in the form of 3-9 letters followed by one or more spaces, 2 digits, a comma(,), one or more spaces, and 4 digits}
#'   \item{rm_date3}{dates in the form of XXXX-XX-XX; hyphen separated string of 4 digit year, 2 digit month, and 2 digit day}
#'   \item{rm_date4}{dates in the form of both \code{rm_date}, \code{rm_date2}, and \code{rm_date3}}
#'   \item{rm_dollar}{substring with dollar sign ($) followed by (1) just dollars (no decimal), (2) dollars and cents (whole number and decimal), or (3) just cents (decimal value); dollars may contain commas}
#'   \item{rm_email}{substring with (1) alphanumeric characters or dash (-), plus (+), or underscore (_) (\emph{This may be repeated}) (2) followed by at (@@), followed by the same regex sequence as before the at (@@), and ending with dot (.) and 2-14 digits}
#'   \item{rm_emoticon}{common emoticons (logic is complicated to explain in words) using ">?[:;=8XB]\{1\}[-~+o^]?[|\")(&gt;DO>\{pP3/]+|</?3|XD+|D:<|x[-~+o^]?[|\")(&gt;DO>\{pP3/]+" regex pattern; general pattern is optional hat character, followed by eyes character, followed by optional nose character, and ending with a mouth character}
#'   \item{rm_endmark}{substring of the last endmark group in a string; endmarks include (! ? . * OR |)}
#'   \item{rm_endmark3}{substring of the last endmark group in a string; endmarks include (! ? OR .)}
#'   \item{rm_endmark3}{substring of the last endmark group in a string; endmarks include (! ? . * | ; OR :)}
#'   \item{rm_hash}{substring that begins with a hash (#) followed by a word}
#'   \item{rm_nchar_words}{substring of letters (that may contain apostrophes) n letters long (apostrophe not counted in length); note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own}
#'   \item{rm_nchar_words2}{substring of letters (that may contain apostrophes) n letters long (apostrophe counted in length); note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own}
#'   \item{rm_non_ascii}{substring of 2 digits or letters a-f inside of a left and right angle brace in the form of \code{"<a4>"}}
#'   \item{rm_non_words}{substring of any character that isn't a letter, apostrophe, or single space}
#'   \item{rm_number}{substring that may begin with dash (-) for negatives, and is (1) just whole number (no decimal), (2) whole number and decimal, or (3) just decimal value; regex pattern provided by Jason Gray}
#'   \item{rm_percent}{substring beginning with (1) just whole number (no decimal), (2) whole number and decimal, or (3) just decimal value and followed by a percent sign (\%)}
#'   \item{rm_phone}{phone numbers in the form of optional country code, valid 3 digit prefix, and 7 digits (may contain hyphens and parenthesis); logic is complex to explain (see \url{https://stackoverflow.com/a/21008254/1000343} for more)}
#'   \item{rm_postal_code}{U.S. state abbreviations (and District of Columbia) that is constrained to just possible U.S. state names, not just two consecutive capital letters; taken from Mike Hamilton's submission found \url{https://regexlib.com/REDetails.aspx?regexp_id=2177}}
#'   \item{rm_repeated_characters}{substring with a repetition of repeated characters within a word; regex pattern retrieved from \href{https://stackoverflow.com}{StackOverflow}'s, \href{https://stackoverflow.com/users/3679490/vks}{vks}: \url{https://stackoverflow.com/a/29438461/1000343}}
#'   \item{rm_repeated_phrases}{substring with a phrase (a sequence of 1 or more words) that is repeated 2 or more times (case is ignored; separating periods and commas are ignored); regex pattern retrieved from \href{https://stackoverflow.com}{StackOverflow}'s, \href{https://stackoverflow.com/users/2725969/brodieg}{BrodieG}: \url{https://stackoverflow.com/a/28786617/1000343}}
#'   \item{rm_repeated_words}{substring with a word (marked with a boundary) that is repeat 2 or more times (case is ignored)}
#'   \item{rm_tag}{substring that begins with an at (@@) followed by a word}
#'   \item{rm_tag2}{Twitter substring that begins with an at (@@) followed by a word composed of alpha-numeric characters and underscores, no longer than 15 characters}
#'   \item{rm_title_name}{substring beginning with title (Mrs., Mr., Ms., Dr.) that is case independent or full title (Miss, Mizz, mizz) followed by a single lower case word or multiple capitalized words}
#'   \item{rm_time}{substring that (1) must begin with 0-2 digits, (2) must be followed by a single colon (:), (3) optionally may be followed by either a colon (:) or a dot (.), (4) optionally may be followed by 1-infinite digits (if previous condition is true)}
#'   \item{rm_time2}{substring that is identical to \code{rm_time} with the additional search for Ante Meridiem/Post Meridiem abbreviations (e.g., AM, p.m., etc.)}
#'   \item{rm_transcript_time}{substring that is specific to transcription time stamps in the form of HH:MM:SS.OS where OS is milliseconds.  HH: and .OS are optional. The SS.OS period divide may also be a comma or additional colon.  The HH:SS divid may also be a period.  String may be affixed with pound sign (#).}
#'   \item{rm_twitter_url}{\href{https://twitter.com/}{Twitter} short link/url; substring optionally beginning with \emph{http}, followed by \emph{t.co} ending on a space or end of string (whichever comes first)}
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
#' }
#' @name regex_usa 
#' @section Extra: Use \code{qdapRegex:::examine_regex()} to interactively explore the 
#' regular expressions in \code{regex_usa}.  This will provide a browser + console
#' based break down of each regex in the dictionary.
#' @usage data(regex_usa) 
#' @format A list with 54 elements 
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
#' @name regex_supplement
#' @details The following canned regular expressions are included:
#' \describe{
#'   \item{after_a}{single word after the word "a"}
#'   \item{after_the}{single word after the word "the"}
#'   \item{after_}{find single word after ? word (? = user defined); note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own (user supplies (1) n before, (2) the point, & (3) n after)}
#'   \item{around_}{find n words (not including punctuation) before or after  ? word (? = user defined); note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own (user supplies (1) n before, (2) the point, & (3) n after)}
#'   \item{around2_}{find n words (plus punctuation) before or after  ? word (? = user defined); note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own}
#'   \item{before_}{find sing word before ? word (? = user defined); note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own}
#'   \item{except_first}{find all occurrences of a substring except the first; regex pattern retrieved from  \href{https://stackoverflow.com/users/3732271/akrun}{StackOverflow's akrun}: \url{https://stackoverflow.com/a/31458261/1000343}} 
#'   \item{hexadecimal}{substring beginning with hash (#) followed by either 3 or 6 select characters (a-f, A-F, and 0-9)}
#'   \item{ip_address}{substring of four chunks of 1-3 consecutive digits separated with dots (.)}
#'   \item{last_occurrence}{last occurrence of a delimiter; note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own (user supplies the delimiter)}
#'   \item{pages}{substring with "pp." or "p.", optionally followed by a space, followed by 1 or more digits, optionally followed by a dash, optionally followed by 1 or more digits, optionally followed by a semicolon, optionally followed by a space, optionally followed by 1 or more digits; intended for extraction/removal purposes}
#'   \item{pages2}{substring 1 or more digits, optionally followed by a dash, optionally followed by 1 or more digits, optionally followed by a semicolon, optionally followed by a space, optionally followed by 1 or more digits; intended for validation purposes}
#'   \item{punctuation}{punctuation characters (\code{[:punct:]}) with the ability to negate; note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own}
#'   \item{run_split}{a regex that is useful for splitting strings in the characters runs (e.g., "wwxyyyzz" becomes "ww", "x", "yyy", "zz"); regex pattern retrieved from \href{https://stackoverflow.com/users/2994949/rawr}{Robert Redd}: \url{https://stackoverflow.com/a/29383435/1000343}}
#'   \item{split_keep_delim}{regex string that splits on a delimiter and retains the delimiter}
#'   \item{thousands_separator}{chunks digits > 4 into groups of 3 from right to left allowing for easy insertion of thousands separator; regex pattern retrieved from \href{https://stackoverflow.com/}{StackOverflow}'s stema: \url{https://stackoverflow.com/a/10612685/1000343}}
#'   \item{time_12_hours}{substring of valid hours (1-12) followed by a colon (:) followed by valid minutes (0-60), followed by an optional space and the character chunk \emph{am} or \emph{pm}} 
#'   \item{version}{substring starting with "v" or "version" optionally followed by a space and then period separated digits for <major>.<minor>.<release>.<build>; the build sequence is optional and the "version"/"v" IS NOT contained in the substring}
#'   \item{version2}{substring starting with "v" or "version" optionally followed by a space and then period separated digits for <major>.<minor>.<release>.<build>; the build sequence is optional and the "version"/"v" IS contained in the substring}
#'   \item{white_after_comma}{substring of white space after a comma}
#'   \item{word_boundary}{A true word boundary that only includes alphabetic characters; based on \url{https://www.rexegg.com/}'s suggestion taken from \href{https://www.rexegg.com/regex-boundaries.php#real-word-boundary}{discussion of true word boundaries}; note contains \code{"\%s"} that is replaced by \code{\link[base]{sprintf}} and is not a valid regex on its own}
#'   \item{word_boundary_left}{A true left word boundary that only includes alphabetic characters; based on \url{https://www.rexegg.com/}'s suggestion taken from \href{https://www.rexegg.com/regex-boundaries.php#real-word-boundary}{discussion of true word boundaries}}
#'   \item{word_boundary_right}{A true right word boundary that only includes alphabetic characters; based on \url{https://www.rexegg.com/}'s suggestion taken from \href{https://www.rexegg.com/regex-boundaries.php#real-word-boundary}{discussion of true word boundaries}}	
#'   \item{youtube_id}{substring of the video id from a \href{https://www.youtube.com}{YouTube} video; taken from Jacob Overgaard's submission found https://regex101.com/r/kU7bP8/1}
#' } 
#' 
#' Regexes from this data set can be added to the \code{pattern} argument of any 
#' \code{rm_XXX} function via an at sign (@@) followed by a regex name from
#' this data set (e.g., \code{pattern = "@@after_the"}) provided the regular 
#' expression does not contain non-regex such as \code{\link[base]{sprintf}} 
#' character string \code{\%s}.
#' @section Warning: Note that regexes containing \code{\%s} are replaced by 
#' \code{\link[base]{sprintf}} and are not a valid regex on their own. The
#' \code{\link[qdapRegex]{S}} is useful for adding these missing \code{\%s} 
#' parameters.
#' @usage data(regex_supplement) 
#' @details Use \code{qdapRegex:::examine_regex(regex_supplement)} to 
#' interactively explore the regular expressions in \code{regex_usa}.  This will 
#' provide a browser + console based break down of each regex in the dictionary.
#' @format A list with 24 elements
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
#' ## Split runs into chunks
#' x <- "1111100000222000333300011110000111000"
#' strsplit(x, grab("@@run_split"), per = TRUE)
#' 
#' \dontrun{
#' library(qdap);library(ggplot2);library(reshape2)
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
#' 
#' ## remove/extract pages numbers
#' x <- c("I read p. 36 and then pp. 45-49", "it's on pp. 23-24;28")
#' 
#' rm_pages <- rm_(pattern="@@pages", extract=TRUE)
#' rm_pages(x)
#' 
#' rm_default(x, pattern = "@@pages")
#' rm_default(x, pattern = "@@pages", extract=TRUE)
#' rm_default(x, pattern = "@@pages2", extract=TRUE)
#' 
#' ## Validate pages
#' page_val <- validate("@@pages2", FALSE)
#' page_val(c(66, "78-82", "hello world", TRUE, "44-45; 56"))
#' 
#' ## Split on last occurrence
#' x <- c(
#'     "test@@aol@@fg.mm.com", 
#'     "test@@hotmail.com", 
#'     "test@@xyz@@rr@@lk.edu", 
#'     "test@@abc.xx@@zz.vv.net"
#' )
#' 
#' strsplit(x, S("@@last_occurrence", "\\."), perl=TRUE)
#' strsplit(x, S("@@last_occurrence", "@@"), perl=TRUE)
#' 
#' ## True Word Boundaries
#' x <- "this is _not a word666 and this is not a word too." 
#' ## Standard regex word boundary
#' rm_default(x, pattern=bind("not a word"))
#' ## Alphabetic only word boundaries
#' rm_default(x, pattern=S("@@word_boundary", "not a word"))
#' 
#' ## Remove all but first occurrence of something
#' x <- c(
#'     "12-3=4-5=678-9", 
#'     "ABC-D=EF2-GHI-JK3=L-MN=", 
#'     "9-87=65", 
#'     "a - de=4fgh --= i5jkl", 
#'     NA
#' )
#' 
#' rm_default(x, pattern = S("@@except_first", "-"))
#' rm_default(x, pattern = S("@@except_first", "="))
NULL
