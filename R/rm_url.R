#' Remove/Replace/Extract URLs
#' 
#' \code{rm_url} - Remove/replace/extract URLs from a string.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_url} uses the 
#' \code{rm_url} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the URLs are extracted into a list 
#' of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with URLs removed.
#' @details The default regex pattern \code{"(http[^ ]*)|(www\\.[^ ]*)"} is more 
#' liberal.  More constrained versions can be accessed
#' via \code{pattern = "@@rm_url2"} & \code{pattern = "@@rm_url3"} see 
#' \bold{Examples}).
#' @keywords url www http t.co ftp
#' @references The more constrained url regular expressions (\code{"@@rm_url2"}
#' and \code{"@@rm_url3"} was adapted from imme_emosol's response: 
#' \url{https://mathiasbynens.be/demo/url-regex}
#' @family rm_ functions
#' @include utils.R
#' @export
#' @rdname rm_url
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @examples
#' x <- " I like www.talkstats.com and http://stackoverflow.com"
#' rm_url(x)
#' rm_url(x, replacement = '<a href="\\1" target="_blank">\\1</a>')
#' ex_url(x)
#' 
#' ex_url(x, pattern = "@@rm_url2")
#' ex_url(x, pattern = "@@rm_url3")
#'
#' ## Remove Twitter Short URL
#' x <- c("download file from http://example.com", 
#'          "this is the link to my website http://example.com", 
#'          "go to http://example.com from more info.",
#'          "Another url ftp://www.example.com",
#'          "And https://www.example.net",
#'          "twitter type: t.co/N1kq0F26tG",
#'          "still another one https://t.co/N1kq0F26tG :-)")
#' 
#' rm_twitter_url(x)
#' ex_twitter_url(x)
#' 
#' ## Combine removing Twitter URLs and standard URLs
#' rm_twitter_n_url <- rm_(pattern=pastex("@@rm_twitter_url", "@@rm_url"))
#' rm_twitter_n_url(x)
#' rm_twitter_n_url(x, extract=TRUE)
rm_url <- hijack(rm_default, pattern = "@rm_url")


#' Remove/Replace/Extract URLs
#' 
#' \code{rm_twitter_url} - Remove/replace/extract Twitter Short URLs from a 
#' string.
#' 
#' @include utils.R
#' @export
#' @rdname rm_url
rm_twitter_url <- hijack(rm_default, pattern = "@rm_twitter_url") 


#' @export
#' @rdname rm_url
ex_url <- hijack(rm_url, extract=TRUE)


#' @export
#' @rdname rm_url
ex_twitter_url <- hijack(rm_twitter_url, extract=TRUE)
