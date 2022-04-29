#' Remove/Replace/Extract Time
#' 
#' \code{rm_time} - Remove/replace/extract time from a string.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector (see \bold{Details} for additional information).  Default, 
#' \code{@@rm_time} uses the \code{rm_time} regex from the regular expression 
#' dictionary from the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the times are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with time removed.
#' @keywords time
#' @details The default regular expression used by \code{rm_time} finds 
#' time with no AM/PM.  This behavior can be altered by using a 
#' secondary regular expression from the \code{\link[qdapRegex]{regex_usa}} 
#' data (or other dictionary) via (\code{pattern = "@@rm_time2"}. See 
#' \bold{Examples} for example usage. 
#' @family rm_ functions
#' @include utils.R
#' @export
#' @rdname rm_time
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @author \href{https://stackoverflow.com/}{stackoverflow's} hwnd and Tyler Rinker <tyler.rinker@@gmail.com>. 
#' @references The time regular expression was taken from: 
#' \url{https://stackoverflow.com/a/25111133/1000343}
#' @examples
#' x <-  c("R uses 1:5 for 1, 2, 3, 4, 5.", 
#'     "At 3:00 we'll meet up and leave by 4:30:20",
#'     "We'll meet at 6:33.", "He ran it in :22.34")
#'
#' rm_time(x)
#' ex_time(x)
#' 
#' ## With AM/PM
#' x <- c(
#'     "I'm getting 3:04 AM just fine, but...",
#'     "for 10:47 AM I'm getting 0:47 AM instead.",
#'     "no time here",
#'     "Some time has 12:04 with no AM/PM after it",
#'     "Some time has 12:04 a.m. or the form 1:22 pm"
#' )
#' 
#' ex_time(x)
#' ex_time(x, pat="@@rm_time2")
#' rm_time(x, pat="@@rm_time2")
#' ex_time(x, pat=pastex("@@rm_time2", "@@rm_time"))
#' 
#' # Convert to standard format
#' as_time(ex_time(x))
#' as_time(ex_time(x), as.POSIXlt = TRUE)
#' as_time(ex_time(x), as.POSIXlt = FALSE, millisecond = FALSE) 
#' 
#' # Transcript specific time stamps
#' x2 <-c(
#'     '08:15 8 minutes and 15 seconds	00:08:15.0',
#'     '3:15 3 minutes and 15 seconds	not 1:03:15.0',
#'     '01:22:30 1 hour 22 minutes and 30 seconds	01:22:30.0',
#'     '#00:09:33-5# 9 minutes and 33.5 seconds	00:09:33.5',
#'     '00:09.33,75 9 minutes and 33.5 seconds	00:09:33.75'
#' )
#' 
#' rm_transcript_time(x2)
#' (out <- ex_transcript_time(x2))
#' 
#' as_time(out)
#' as_time(out, TRUE)
#' as_time(out, millisecond = FALSE)
#' 
#' \dontrun{
#' if (!require("pacman")) install.packages("pacman")
#' pacman::p_load(chron)
#' lapply(as_time(out), chron::times)
#' lapply(as_time(out, , FALSE), chron::times)
#' }
rm_time <- hijack(rm_default, pattern = "@rm_time")



#' Remove/Replace/Extract Time
#' 
#' \code{rm_transcript_time} - Remove/replace/extract transcript specific time 
#' stamps from a string.
#' 
#' @family rm_ functions
#' @export
#' @rdname rm_time
rm_transcript_time <- hijack(rm_default, pattern = "@rm_transcript_time")

#' Remove/Replace/Extract Time
#' 
#' \code{as_time} - Convert a time stamp removed by \code{rm_time} or  
#' \code{rm_transcript_time} to a standard time format (HH:SS:MM.OS) and 
#' optionally convert to \code{\link[base]{as.POSIXlt}}.
#' 
#' @param x A list with extracted time stamps.
#' @param as.POSIXlt logical.  If \code{TRUE} the output will be converted to 
#' \code{\link[base]{as.POSIXlt}}. 
#' @param millisecond logical.  If \code{TRUE} milliseconds are retained.  If 
#' \code{FALSE} they are rounded and added to seconds.
#' @export
#' @rdname rm_time
as_time <- function (x, as.POSIXlt = FALSE, millisecond = TRUE) {

    out <- lapply(x, function(y) {
        z <- gsub("[,-.]", ":", gsub("^#|#$", "", y))
        z <- gsub("(^.*:.*:.*?)(:)(.*)$", "\\1.\\3", z, perl=TRUE)

        unlist(lapply(z, function(a){
            if (is.na(a)) return(NA)
            b <- strsplit(a, ":")[[1]]
            out <- switch(length(b),
                `1` = NA,
                `2` = c("00", b),
                `3` = b
            )
            if (!grepl("\\.[0-9]+", out[3])){
                out[3] <- paste0(out[3], ".0")
            }
            if (!millisecond){
                sec <- as.numeric(gsub("([0-9]{2})(\\.[0-9]+)", "\\1", out[3]))
                mil <- round(as.numeric(gsub("([0-9]{2})(\\.[0-9]+)", "\\2", out[3])))
                out[3] <- sec + mil
            }
            #if (nchar(out[2]) == 1) out[2] <- paste0("0", out[2])
            paste(out, collapse = ":")
        }))
    })

    out <- lapply(out, function(x) gsub("(^\\d{1}:|(?<=:)\\d(?=:))", "0\\1", x, perl = TRUE))

    if (as.POSIXlt){
        out <- lapply(out, strptime, "%H:%M:%OS")
    }
    out
}

#' Remove/Replace/Extract Time
#' 
#' \code{as_time} - A convenience function for \code{as_time} that unlists and 
#' returns a vector rather than a list.
#' 
#' @note \ldots in \code{as_time2} are the other arguments passed to \code{as_time}.
#' @export
#' @rdname rm_time
as_time2 <- function (x, ...) {
    unlist(as_time(x, ...))
}

 

#' @export
#' @rdname rm_time
ex_time <- hijack(rm_time, extract=TRUE)

#' @export
#' @rdname rm_time
ex_transcript_time <- hijack(rm_transcript_time, extract=TRUE)

