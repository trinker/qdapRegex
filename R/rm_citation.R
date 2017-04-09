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
#' as_count(ex_citation(x))
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
#' ## Counts
#' parts[[1]] %>%
#'     unbag() %>%
#'     ex_citation() %>%
#'     as_count()
#'     
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

#' Convert Extracted Citations to Count Dataframe
#' 
#' Counts of normalized citations ("et al." to  original author converted to author + year standarization).
#' 
#' @param x The output from \code{ex_citation}.
#' @return Returns a \code{\link[base]{data.frame}} of Authors, Years, and n (counts).
#' @rdname rm_citation
#' @note This function is experimental.
#' @export
as_count <- function(x, ...){

    x <- gsub("'s(\\s*\\()", " (", unlist(x))
    x <- gsub("]", ")", gsub("[", "(", x, fixed=TRUE), fixed=TRUE)
    x <- distribute(x)    

    x <- gsub("\\s*\\(\\s*", ", ", gsub("(\\)|,)\\s*$", "", x))
    y <- stats::setNames(
        data.frame(
            do.call(
                rbind, 
                strsplit(gsub("(\\s*,\\s*)([^,]+$)", "<<break>>\\2", x), "<<break>>")
            ), 
            stringsAsFactors = FALSE
        ), 
        c("citation", "year")
    )
    y[["citation"]] <- gsub("\\band\\b", "&", y[["citation"]])

    locs1 <- grep("\\bet al\\.", y[["citation"]])
    if (length(locs1) > 0){
        locs2 <- grep(",[^,]+,", y[["citation"]])
    
        potentials <- tolower(trimws(gsub("(^[^,]+)(,.+$)", "\\1", y[["citation"]][locs2])))
    
        changes <- sapply(locs1, function(i){
            etal <- tolower(trimws(gsub("\\bet al\\.\\b", "", y[["citation"]][i])))
            which(potentials %in% etal & y[["year"]][locs2] %in% y[["year"]][i])[1]
        })
        y[["citation"]][locs1][!is.na(changes)] <- c(stats::na.omit(y[["citation"]][locs2][changes]))
    }

    y[["n"]] <- 1
    stats::aggregate(y[["n"]], y[c("citation", "year")], sum)

    y <- stats::setNames(as.data.frame(stats::aggregate(y[["n"]], y[c("citation", "year")], sum), stringsAsFactors = FALSE), c("Author", "Year", "n"))
    y <- y[order(-y[["n"]], y[["Author"]], y[["Year"]]), ]
    y
}


distribute <- function(x, unlist = TRUE){

    locs <- grepl("^[^ \\(][^(]+\\(([^,]+,)+[^,]", x, perl=TRUE)
    if (sum(locs) > 0){
        x <- as.list(x)
        x[locs] <- Map(function(x, y) {paste0(x, ", ", y)}, 
            rm_round(x[locs]),
            unlist(lapply(ex_round(x[locs]), strsplit, ",\\s*"), recursive=FALSE)
        )
    
        if (unlist) x <- unlist(x)
    }

    regex <- "(((\\d{4}[a-z]{0,1})|(n\\.d\\.)|(in press)),\\s*)+((\\d{4}[a-z]{0,1})|(n\\.d\\.)|(in press))$"
    locs <- grepl(regex, x, perl=TRUE)

    if (sum(locs) > 0){
        x <- as.list(x)
        begin <- gsub(regex, "", x[locs], perl=TRUE)
        x[locs] <- Map(function(x, y) {paste0(x, ", ", y)}, 
            gsub(",\\s*$", "", begin),
            unlist(lapply(trimws(gsub(begin, "", x[locs], fixed=TRUE)), strsplit, ",\\s*"), recursive=FALSE)
        )
    
        if (unlist) x <- unlist(x)
    }

    x
}
