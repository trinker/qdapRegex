#' Visualize Regular Expressions
#' 
#' Visualize regular expressions using \url{http://www.regexper.com} 
## & \url{http://rick.measham.id.au/paste/explain}.
#' 
#' @param pattern A character string containing a regular expression or a
#' character string starting with \code{"@@"} that is a regular 
#' expression from a \pkg{qdapRegex} dictionary.
#' @param open logical.  If \code{TRUE} the default browser will attempt to 
#' open \url{http://www.regexper.com} page.  Setting \code{open = 2} will 
#' utilize an unstable visualization via \url{https://www.debuggex.com}.  This 
#' approach utilizes a non-api scrape that is subject to change and not 
#' guaranteed to be stable.  The regex is set to Python flavor which handles 
#' lookbehinds that the Java based \url{http://www.regexper.com} does not.  This
#' functionality was developed by 
#' \href{http://www.matthewflickinger.com}{Matthew Flickinger} (see 
#' \url{http://stackoverflow.com/a/27574103/1000343} for details).  Note that 
#' the user must have \pkg{httr} installed or will be prompted if the package
#' cannot be \code{\link[base]{require}}d.
#' @param print logical.  Should \code{explain} print output to the console?
#' @param dictionary A dictionary of canned regular expressions to search within.
#' @return Prints \url{http://www.regexper.com} to the console,
#' attempts to open the url to the visual representation provided by
#' \url{http://www.regexper.com}, and invisibly returns a list with the URLs.
#' @keywords explain regex 
#' @details Note that \url{http://www.regexper.com} is a Java based regular 
#' expression viewer. Lookbehind and negative lookbehinds are not respected. 
#' @export
#' @seealso \url{http://www.regexper.com} 
## \cr \url{http://rick.measham.id.au/paste/explain}
#' @author Ananda Mahto, Matthew Flickinger, and Tyler Rinker <tyler.rinker@@gmail.com>.
#' @references \url{http://stackoverflow.com/a/27489977/1000343} \cr
#' \url{http://www.regexper.com} \cr
## \url{http://rick.measham.id.au/paste/explain} \cr
#' \url{http://stackoverflow.com/a/27574103/1000343}
#' @examples
#' explain("\\s*foo[A-Z]\\d{2,3}", open = FALSE)
#' explain("@@rm_time", open = FALSE)
#' \dontrun{
#' ## Opens the regex
#' explain("\\s*foo[A-Z]\\d{2,3}")
#' explain("@@rm_time")
#' }
explain <- function(pattern, open = FALSE, print = TRUE,
    dictionary = getOption("regex.library")) {

    pattern <- reg_check(pattern, dictionary = dictionary)
    URL <- paste0("http://www.regexper.com/#", 
        utils::URLencode(pattern))
    if (isTRUE(open)) {

        if (grepl("\\(\\?\\<[=!]", pattern, perl=TRUE)) {
            warning(paste("Pattern contains a Lookbehind and may not be",
                "viewable to the Java based `www.regexper.com`"))
        }
        utils::browseURL(URL)
    }    

    if (open == 2) {
        ## Experimental/tempermental viewing from:
        ## https://www.debuggex.com
        view_regex <- source(system.file("additional_script/view_regex", 
            package = "qdapRegex"))
        view_regex[["value"]](pattern = pattern)
    }  

##   NOTE: THE COMMENTED OUT SECTION OF CODE IS FROM 8-16-15
##   IT APPEARS http://rick.measham.id.au/paste IS NO LONGER FUNCTIONING
##   AS SUCH THIS FUNCTIONALITY IS TEMPORARILY REMOVED FROM explain
##   IT MAY BE READDED IF THE WEBSITE BEGINS WORKING AGAIN OR IF A SUITABLE 
##   REPLACEMENT ID FOUND.
## 
#    URL2 <- paste0("http://rick.measham.id.au/paste/explain.pl?regex=",
#        utils::URLencode(pattern))

#    ## replace invalid characters
#    chars <- c(";", "+", "&")
#    reps <- c("%3B", "%2B", "%26")

#    for (i in seq_along(reps)){
#        URL2 <- gsub(chars[i], reps[i], URL2, fixed=TRUE)
#    }

#    lns <- readLines(URL2)
#    lns <- gsub("&quot;", "\"", lns[grep("NODE", lns):(length(lns) - 2)], fixed=TRUE)
#    lns <- gsub("&gt;", ">", gsub("&lt;", "<", lns, fixed=TRUE), fixed=TRUE)
#    lns <- gsub("\\", "\\\\", lns, fixed=TRUE)
#    lets <- c("n", "r", "t", "f", "a")
#    for (i in seq_len(length(lets))){
#        lns <- gsub(paste0("\\\\", lets[i]), paste0("\\", lets[i]), lns, fixed=TRUE)
#    }
#    lns[length(lns)] <- gsub("</pre>$", "", lns[length(lns)])
     lns <- URL   # added 8-16-15; remove later if rick.measham goes back online
     class(lns) <- c("explain", class(lns))
     attributes(lns)[["www.regexper.com"]] <- URL
#    attributes(lns)[["http://rick.measham.id.au/paste/explain"]] <- URL2
     attributes(lns)[["print"]] <- print
     
    message("The `http://rick.measham.id.au/paste/explain` text explanation no longer", 
        "\nprints to the command line.  The website no longer works.\n\n",
        "The text explanation functionality will return if the website becomes",
        "\noperational again or if a suitable substitute can be found."
    )
     
    lns
}


#' Prints a explain object
#' 
#' Prints a explain object
#' 
#' @param x The explain object
#' @param \ldots ignored
#' @export
#' @method print explain
print.explain <- function(x, ...){
    if (isTRUE(attributes(x)[["print"]])) cat(paste0(paste(x, collapse="\n"), "\n\n"))
}

explain("[a-z]", open=F)