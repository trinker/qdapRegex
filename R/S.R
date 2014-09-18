#' Use C-style String Formatting Commands
#' 
#' Convenience wrapper for \code{\link[base]{sprintf}} that allows recycling of 
#' \ldots of length one.
#' 
#' @param x A single string containing \code{"\%s"}.
#' @param \ldots A vector of substitutions equal in length to the number of 
#' \code{"\%s"} in \code{x} or of length one (if length one \ldots will be recycled).
#' @return Returns a string with \code{"\%s"} replaced.
#' @export
#' @seealso \code{\link[base]{sprintf}}
#' @examples
#' S("@@after_", "the", "the")
#' # Recycle
#' S("@@after_", "the")
#' S("@@rm_between", "LEFT", "RIGHT")
S <- function(x, ...) {
    y <- pastex(x)
    cnts <- stringi::stri_count_fixed(y, "%s")
    reps <- list(...)

    len <- length(reps)
    if (len != 1 & cnts != len) {
        stop(
            paste0("... must be of length one or equal to number of `%s` (in this use: ", 
                cnts, ") in `x`")
        )
    } 
    if (len == 1 & cnts != len) {
        reps <- unlist(rep(reps, cnts))
    }

    do.call(sprintf, c(list(y), reps))
  
}