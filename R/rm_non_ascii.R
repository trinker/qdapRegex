#' Remove/Replace/Extract Non-ASCII
#' 
#' Remove/replace/extract non-ASCII substring from a string.  This is the template used by
#' other \pkg{qdapRegex} \code{rm_XXX} functions.
#' 
#' @section Note:
#' MacOS 14, Sonoma (and likely all versions afterward), has a different 
#' implementation of iconv which may not result in expected results.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_non_ascii} uses the 
#' \code{rm_non_ascii} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.  If \code{extract = FALSE} 
#' \code{\link[base]{gsub}} is not used as with other \code{rm_XXX} functions,
#' rather \code{\link[base]{iconv}} with the \code{sub} argument set is used to
#' conduct the subbing.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the all non-ASCII strings are extracted 
#' into a list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param ascii.out logical.  If \code{TRUE} output is given in non-ASCII format,
#' otherwise \code{"byte"} is used.
#' @param \dots ignored.
#' @return Returns a character string with "all non-ascii" removed.
#' @keywords ascii unicode
#' @section Warning: \code{\link[base]{iconv}} is used within \code{rm_non_ascii}.
#' \code{\link[base]{iconv}}'s behavior across operating systems may not be 
#' consistent.
#' @author \href{https://stackoverflow.com}{stackoverflow}'s MrFlick, hwnd, and Tyler Rinker <tyler.rinker@@gmail.com>. 
#' @family rm_ functions
#' @include utils.R
#' @export
#' @rdname rm_non_ascii
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @examples
#' x <- c("Hello World", "Ekstr\xf8m", "J\xf6reskog", "bi\xdfchen Z\xfcrcher")
#' Encoding(x) <- "latin1"
#' x
#' 
#' rm_non_ascii(x)
#' rm_non_ascii(x, replacement="<<FLAG>>")
#' ex_non_ascii(x)
#' ex_non_ascii(x, ascii.out=FALSE)
#' 
#' ## simple regex to remove non-ascii
#' rm_default(x, pattern="[^ -~]")
#' ex_default(x, pattern="[^ -~]")
rm_non_ascii <- function (text.var, trim = !extract, clean = TRUE, 
    pattern = "@rm_non_ascii", replacement = "", extract = FALSE, 
    dictionary = getOption("regex.library"), ascii.out = TRUE,
    ...) {

    if(Sys.info()['sysname'] == 'Darwin' && as.numeric_version(Sys.info()[["release"]]) >= "23.0.0"){
        warning('Darwin >= Version 14 uses a different version of iconv.  Results may not match expectations.')
    }
    pattern <- reg_check(pattern = pattern, dictionary = dictionary)

    if (extract) {

        text.var <- iconv(text.var, "latin1", "ASCII", sub = "byte")
        y <- stringi::stri_extract_all_regex(text.var, pattern)

        if (!ascii.out) {
           y[!is.na(y)] <- lapply(y[!is.na(y)], function(x) {
                out <- rawToChar(as.raw(strtoi(paste0("0x",substr(x,2,3)))), multiple=TRUE)
                Encoding(out) <- "latin1"
                out
            })
        }
        if (!trim) {
            return(ext(y))
        }
        return(ext(lapply(y, Trim)))
    }
    out <- iconv(text.var, to="ASCII", sub=replacement) 
    if (trim) out <- Trim(out)
    if (clean) out <- clean(out)
    out
} 

#' @export
#' @rdname rm_non_ascii
ex_non_ascii <- hijack(rm_non_ascii, extract=TRUE)

