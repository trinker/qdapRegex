#' Visualize Regular Expressions
#' 
#' Visualize regular expressions using \url{http://www.regexper.com} &
#' \url{http://rick.measham.id.au/paste/explain}.
#' 
#' @param pattern A character string containing a regular expression or a
#' character string starting with \code{"@@"} that is a regular 
#' expression from a \pkg{qdapRegex} dictionary.
#' @param open logical.  If \code{TRUE} the the default browser will attempt to 
#' open \url{http://www.regexper.com} page.
#' @param dictionary A dictionary of canned regular expressions to search within.
#' @return Prints \url{http://rick.measham.id.au/paste/explain} to the console,
#' attemps to open the url to the visual representation provided by
#' \url{http://www.regexper.com}, and invisibly returns a list with the URLs.
#' @keywords explain regex 
#' @export
#' @seealso \url{http://www.regexper.com} \cr
#' \url{http://rick.measham.id.au/paste/explain}
#' @author Ananda Mahto and Tyler Rinker <tyler.rinker@@gmail.com>.
#' @references \url{http://stackoverflow.com/a/27489977/1000343} \cr
#' \url{http://www.regexper.com} \cr
#' \url{http://rick.measham.id.au/paste/explain}
#' @examples
#' explain("\\s*foo[A-Z]\\d{2,3}")
#' explain("@@rm_time")
#' \dontrun{
#' explain("\\s*foo[A-Z]\\d{2,3}", open = TRUE)
#' explain("@@rm_time", open = TRUE)
#' }
explain <- function(pattern, open = FALSE, dictionary = getOption("regex.library")) {

    pattern <- reg_check(pattern, dictionary = dictionary)
    URL <- paste0("http://www.regexper.com/#", 
        utils::URLencode(pattern))
    if (isTRUE(open)) utils::browseURL(URL)

    URL2 <- gsub(";", "%3B", paste0("http://rick.measham.id.au/paste/explain.pl?regex=",
        utils::URLencode(pattern)), fixed=TRUE)
    lns <- readLines(URL2)
    lns <- gsub("&quot;", "\"", lns[grep("NODE", lns):(length(lns) - 2)], fixed=TRUE)
    lns <- gsub("&lt;", "<", lns, fixed=TRUE)
    lns <- gsub("\\", "\\\\", lns, fixed=TRUE)
    lets <- c("n", "r", "t", "f", "a")
    for (i in seq_len(length(lets))){
        lns <- gsub(paste0("\\\\", lets[i]), paste0("\\", lets[i]), lns, fixed=TRUE)
    }
    lns[length(lns)] <- gsub("</pre>$", "", lns[length(lns)])
    message(paste(lns, collapse="\n"), "\n\n")

    return(invisible(list(`www.regexper.com`=URL, 
        `http://rick.measham.id.au/paste/explain`=URL2)))

}
