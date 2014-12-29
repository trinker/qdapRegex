#' Upper/Lower/Title Case
#' 
#' \code{TC} - Capitalize titles according to traditional capitalization rules.
#' 
#' @param text.var The text variable.
#' @param lower A vector of words to retain lower case for (unless first or last word).
#' @param \ldots Other arguments passed to: \code{\link[stringi]{stri_trans_tolower}},
#' \code{\link[stringi]{stri_trans_toupper}}, and \code{\link[stringi]{stri_trans_totitle}}.
#' @return Returns a character vector with new case (lower, upper, or title).
#' @note \code{TC} utilizes additional rules for capitalization beyond 
#' \code{\link[stringi]{stri_trans_totitle}} that include:
#' \enumerate{
#'   \item Capitalize the first & last word
#'   \item Lowercase articles, coordinating conjunctions, & prepositions
#'   \item Lowercase "to" in an infinitive
#'   }
#' @details Case wrapper functions for \pkg{stringi}'s \code{\link[stringi]{stri_trans_tolower}},
#' \code{\link[stringi]{stri_trans_toupper}}, and \code{\link[stringi]{stri_trans_totitle}}.
#' Functions are useful within \pkg{magrittr} style chaining.
#' @export
#' @rdname case
#' @seealso \code{\link[stringi]{stri_trans_tolower}},
#' \code{\link[stringi]{stri_trans_toupper}},
#' \code{\link[stringi]{stri_trans_totitle}}
#' @examples
#' y <- c(
#'    "I'm liking it but not too much.", 
#'    "How much are you into it?",  
#'    "I'd say it's yet awesome yet."
#' ) 
#' L(y)
#' U(y)
#' TC(y)
TC <- function (text.var, lower = NULL, ...) {
    m <- lapply(text.var, stringi::stri_trans_totitle, ...)
    if (!is.null(lower) && !lower) 
        return(m)
    if (is.null(lower)) {
        lower <- c("A", "An", "And", "As", "At", "But", "By", 
            "Down", "Even", "For", "From", "If", "In", "Into", 
            "Like", "Near", "Nor", "Of", "On", "Once", "Onto", 
            "Or", "Over", "Past", "So", "Than", "That", "The", 
            "Till", "To", "Upon", "When", "With", "Yet")
    }
    lower1 <- bind(lower, left="\\s", right="\\b")
    lower2 <- bind(stringi::stri_trans_tolower(lower), left=" ", right="")
    for (i in seq_along(lower1)) {
        m <- lapply(m, stringi::stri_replace_all_regex, paste0(lower1[i], 
            "(?![:punct:]*$)"), lower2[i])
    }
    m
}

#' \code{L} - All lower case.
#' 
#' @export
#' @rdname case
L <- function(text.var, ...) lapply(text.var, stringi::stri_trans_tolower)

#' \code{U} - All upper case.
#' 
#' @export
#' @rdname case
U <- function(text.var, ...) lapply(text.var, stringi::stri_trans_toupper)



