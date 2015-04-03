#' Remove/Replace/Extract Simile (as ___  as)
#' 
#' Remove/replace/extract simile (as ___  as) from a string.  Useful more so for
#' the ability to split on these points.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the person tags are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with person tags removed.
#' @keywords person tag twitter
#' @export
#' @family rm_simile functions
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @examples
#' sims_as <- c(
#'     "John is as big as a horse and chicken.",
#'     "He's about as entertaining as watching paint dry",
#'     "This is as good as it gets",
#'     "It's not as good"
#' )
#' 
#' rm_simile_as(sims_as, replacement="--")
#' rm_simile_as(sims_as, replacement="--", extract = TRUE)
#' 
#' \dontrun{
#' if (!require("pacman")) install.packages("pacman")
#' pacman::p_load(dplyr)
#' 
#' sims_as[grepl(grab("@@rm_simile_as"), sims_as)] %>%
#'     rm_simile_as(replacement="<<SIMILE>> \\2 <<SIMILE>>") %>%
#'     strsplit("\\s*<<SIMILE>>\\s*") %>%
#'     do.call(rbind.data.frame, .) %>%
#'     setNames(c("Description", paste0("Noun_Phrase_", 1:2))[c(2, 1, 3)])   
#' }
rm_simile_as <- hijack(rm_default, pattern = "@rm_simile_as")
