#' Add Left/Right Character(s) Boundaries
#' 
#' This convenience function wraps left and right boundaries of each element of 
#' a character vector.  The default is to use \code{"\\b"} for left and right 
#' boundaries.
#' 
#' @param x A character vector.
#' @param left A single length character vector to use as the left bound.
#' @param right A single length character vector to use as the right bound.
#' @return Returns a character vector.
#' @export
#' @seealso \code{\link[base]{paste0}}
#' @examples
#' bind(LETTERS, "[", "]")
#' 
#' ## More useful default parameters/usage
#' x <- c("Computer is fun. Not too fun.", "No it's not, it's dumb.", 
#'     "What should we do?", "You liar, it stinks!", "I am telling the truth!", 
#'     "How can we be certain?", "There is no way.", "I distrust you.", 
#'     "What are you talking about?", "Shall we move on?  Good then.", 
#'     "I'm hungry.  Let's eat.  You already?")
#' 
#' Fry25 <- c("the", "of", "and", "a", "to", "in", "is", "you", "that", "it", 
#'     "he", "was", "for", "on", "are", "as", "with", "his", "they", 
#'     "I", "at", "be", "this", "have", "from")
#' 
#' gsub(pastex(list(bind(Fry25))), "[[ELIM]]", x)
bind <- function(x, left="\\b", right = left){

    paste0(left, x, right)

}

