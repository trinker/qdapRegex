#' Visualize Regular Expressions
#' 
#' Visualize regular expressions using \url{http://www.regexper.com}.
#' 
#' @param pattern A character string containing a regular expression or a
#' character string starting with \code{"@@"} that is a regular 
#' expression from a \pkg{qdapRegex} dictionary.
#' @param dictionary A dictionary of canned regular expressions to search within.
#' @return Attemps to open the url to the visual representation provided by
#' \url{http://www.regexper.com} and invisibly returns the url string.
#' @keywords explain regex 
#' @export
#' @seealso \url{http://www.regexper.com}
#' @author Ananda Mahto and Tyler Rinker <tyler.rinker@@gmail.com>.
#' @references \url{http://stackoverflow.com/a/27489977/1000343}
#' @examples
#' \dontrun{
#' explain("\\s*foo[A-Z]\\d{2,3}")
#' explain("@@rm_time")
#' }
explain <- function(pattern, dictionary = getOption("regex.library")) {

    pattern <- reg_check(x, dictionary = dictionary)
    URL <- paste0("http://www.regexper.com/#", 
        utils::URLencode(pattern))
    utils::browseURL(URL)

    return(invisible(URL))

}
