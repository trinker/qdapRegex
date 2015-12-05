#' Remove/Replace/Extract Citations
#' 
#' Remove/replace/extract APA6 style citations from a string.
#'  
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector (see \bold{Details} for additional information).  Default,
#' \code{@@rm_citation} uses the \code{rm_citation} regex from the regular 
#' expression dictionary from the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the dates are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Ignored.
#' @return Returns a character string with citations removed.
#' @keywords citation
#' @details The default regular expression used by \code{rm_citation} finds 
#' in-text and parenthetical citations.  This behavior can be altered by using a 
#' secondary regular expression from the \code{\link[qdapRegex]{regex_usa}} 
#' data (or other dictionary) via (\code{pattern = "@@rm_citation2"} or 
#' \code{pattern = "@@rm_citation3"}). See \bold{Examples} for example usage. 
#' @family rm_ functions
#' @include utils.R
#' @export
#' @rdname rm_citation
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @examples
#' ## All Citations
#' x <- c("Hello World (V. Raptor, 1986) bye",
#'     "Narcissism is not dead (Rinker, 2014)",
#'     "The R Core Team (2014) has many members.",
#'     paste("Bunn (2005) said, \"As for elegance, R is refined, tasteful, and",
#'         "beautiful. When I grow up, I want to marry R.\""),
#'     "It is wrong to blame ANY tool for our own shortcomings (Baer, 2005).",
#'     "Wickham's (in press) Tidy Data should be out soon.",
#'     "Rinker's (n.d.) dissertation not so much.",
#'     "I always consult xkcd comics for guidance (Foo, 2012; Bar, 2014).",
#'     "Uwe Ligges (2007) says, \"RAM is cheap and thinking hurts\""
#' )
#' 
#' rm_citation(x)
#' ex_citation(x)
#' rm_citation(x, replacement="[CITATION HERE]")
#' \dontrun{
#' qdapTools::vect2df(sort(table(unlist(rm_citation(x, extract=TRUE)))), 
#'     "citation", "count")
#' }
#' 
#' ## In-Text
#' ex_citation(x, pattern="@@rm_citation2")
#' 
#' ## Parenthetical
#' ex_citation(x, pattern="@@rm_citation3")
#' 
#' \dontrun{
#' ## Mining Citation
#' if (!require("pacman")) install.packages("pacman")
#' pacman::p_load(qdap, qdapTools, dplyr, ggplot2)
#' 
#' url_dl("http://umlreading.weebly.com/uploads/2/5/2/5/25253346/whole_language_timeline-updated.docx")
#' 
#' parts <- read_docx("whole_language_timeline-updated.docx") %>%
#'     rm_non_ascii() %>%
#'     split_vector(split = "References", include = TRUE, regex=TRUE)
#'     
#' parts[[1]]
#' 
#' parts[[1]] %>%
#'     unbag() %>%
#'     ex_citation() %>%
#'     c()
#' 
#' ## By line
#' ex_citation(parts[[1]])
#' 
#' ## Frequency
#' cites <- parts[[1]] %>%
#'     unbag() %>%
#'     ex_citation() %>%
#'     c() %>%
#'     data_frame(citation=.) %>%
#'     count(citation) %>%
#'     arrange(n) %>%
#'     mutate(citation=factor(citation, levels=citation))
#' 
#' ## Distribution of citations (find locations and then plot)
#' cite_locs <- do.call(rbind, lapply(cites[[1]], function(x){
#'     m <- gregexpr(x, unbag(parts[[1]]), fixed=TRUE)
#'     data.frame(
#'         citation=x,
#'         start = m[[1]] -5,
#'         end =  m[[1]] + 5 + attributes(m[[1]])[["match.length"]]
#'     )
#' }))
#' 
#' ggplot(cite_locs) +
#'     geom_segment(aes(x=start, xend=end, y=citation, yend=citation), size=3,
#'         color="yellow") +
#'     xlab("Duration") +
#'     scale_x_continuous(expand = c(0,0),
#'         limits = c(0, nchar(unbag(parts[[1]])) + 25)) +
#'     theme_grey() +
#'     theme(
#'         panel.grid.major=element_line(color="grey20"),
#'         panel.grid.minor=element_line(color="grey20"),
#'         plot.background = element_rect(fill="black"),
#'         panel.background = element_rect(fill="black"),
#'         panel.border = element_rect(colour = "grey50", fill=NA, size=1),
#'         axis.text=element_text(color="grey50"),    
#'         axis.title=element_text(color="grey50")  
#'     )
#' }
rm_citation <- 
function (text.var, trim = !extract, clean = TRUE, pattern = "@rm_citation", 
    replacement = "", extract = FALSE, dictionary = getOption("regex.library"), 
    ...) {
    pattern <- reg_check(pattern = pattern, dictionary = dictionary)
    if (extract) {
        if (!trim) {
            return(ext(stringi::stri_extract_all_regex(text.var, pattern)))
        }
        return(ext(lapply(stringi::stri_extract_all_regex(text.var, pattern), 
            Trim)))
    }
    out <- stringi::stri_replace_all_regex(text.var, pattern, replacement)
    if (trim) 
        out <- Trim(out)
    if (clean) 
        out <- clean(out)
    out
} 

#' @export
#' @rdname rm_citation
ex_citation <- hijack(rm_citation, extract=TRUE)

