#' Remove/Replace/Extract Simile (like)
#' 
#' Remove/replace/extract simile (like) from a string.  Useful more so for
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
#' @details \code{rm_simile_like} is liberal, including phrases like "I like 
#' cookies".  This can be fixed by forcing an article to come after the "like".
#' Doing so would miss simile phrases such as "It's like cat city in here."
#' @export
#' @family rm_simile functions
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @examples
#' sims_like <- c(
#'     "I like cookies.", 
#'     "like a good neighbor", 
#'     "John is like a big horse.",
#'     "She's like a disaster",
#'     "Not likely though"
#' )
#' 
#' rm_simile_like(sims_like)
#' rm_simile_like(sims_like, extract = TRUE)
#' 
#' \dontrun{
#' if (!require("pacman")) install.packages("pacman")
#' pacman::p_load(dplyr)
#' 
#' sims_like[grepl(grab("@@rm_simile_like"), sims_like)] %>%
#'     rm_simile_like(replacement="<<SIMILE>>") %>%
#'     strsplit("\\s*<<SIMILE>>\\s*") %>%
#'     do.call(rbind.data.frame, .) %>%
#'     setNames(paste0("Noun_Phrase_", 1:2))   
#' }
rm_simile_like <- hijack(rm_default, pattern = "@rm_simile_like")
