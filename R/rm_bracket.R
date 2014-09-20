#' Remove/Replace/Extract Brackets
#' 
#' Remove/replace/extract bracketed strings.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern The type of bracket (and encased text) to remove.  This is one 
#' or more of the strings \code{"curly"}/\code{"\{"}, \code{"square"}/\code{"["}, 
#' \code{"round"}/\code{"("}, \code{"angle"}/\code{"<"} and \code{"all"}.  These 
#' strings correspond to: \{, [, (, < or all four types.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the bracketed text is extracted into 
#' a list of vectors.
#' @param include.markers logical.  If \code{TRUE} and \code{extract = TRUE} returns 
#' the markers (left/right) and the text between.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @param merge logical.  If \code{TRUE} the results of each bracket type will 
#' be merged by string.  \code{FALSE} returns a named list of lists of vectors 
#' of bracketed text per bracket type.  
#' @rdname rm_bracket
#' @include rm_default.R utils.R
#' @return \code{rm_bracket} - returns a character string with 
#' multiple brackets removed.  If \code{extract = TRUE} the results are 
#' optionally merged and named by bracket type.  This is more flexible than 
#' \code{rm_bracket} but slower.
#' @keywords bracket
#' @references \url{http://stackoverflow.com/q/8621066/1000343} 
#' @author  Martin Morgan and Tyler Rinker <tyler.rinker@@gmail.com>.
#' @export
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[qdapRegex]{rm_between}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @examples
#' examp <- structure(list(person = structure(c(1L, 2L, 1L, 3L),
#'     .Label = c("bob", "greg", "sue"), class = "factor"), text =
#'     c("I love chicken [unintelligible]!",
#'     "Me too! (laughter) It's so good.[interrupting]",
#'     "Yep it's awesome {reading}.", "Agreed. {is so much fun}")), .Names =
#'     c("person", "text"), row.names = c(NA, -4L), class = "data.frame")
#' 
#' examp
#' rm_bracket(examp$text, pattern = "square")
#' rm_bracket(examp$text, pattern = "curly")
#' rm_bracket(examp$text, pattern = c("square", "round"))
#' rm_bracket(examp$text)
#' 
#' rm_bracket(examp$text, pattern = "square", extract=TRUE)
#' rm_bracket(examp$text, pattern = "curly", extract=TRUE)
#' rm_bracket(examp$text, pattern = c("square", "round"), extract=TRUE)
#' rm_bracket(examp$text, pattern = c("square", "round"), merge = FALSE, extract=TRUE)
#' rm_bracket(examp$text, extract=TRUE)
#' rm_bracket(examp$tex, include.markers=TRUE, extract=TRUE)
#' 
#' \dontrun{
#' library(qdap)
#' rm_bracket(examp$tex, pattern="curly", extract=TRUE) %>% 
#'   unlist() %>% 
#'   na.omit() %>% 
#'   paste2()
#' }
#' 
#' x <- "I like [bots] (not). And <likely> many do not {he he}"
#' 
#' rm_round(x)
#' rm_round(x, extract = TRUE)
#' 
#' rm_round(x, include.marker = FALSE)
#' rm_round(x, extract = TRUE, include.marker = TRUE)
#' 
#' rm_square(x)
#' rm_square(x, extract = TRUE)
#' 
#' rm_curly(x)
#' rm_curly(x, extract = TRUE)
#' 
#' rm_angle(x)
#' rm_angle(x, extract = TRUE)
#' 
#' lapply(rm_between('She said, "I am!" and he responded..."Am what?".', 
#'     left='"', right='"', extract = TRUE), "[", c(TRUE, FALSE))
rm_bracket <- function(text.var, pattern = "all", trim = TRUE, clean = TRUE, 
    replacement = "", extract = FALSE,
    include.markers = ifelse(extract, FALSE, TRUE),
    dictionary = getOption("regex.library"), ...) {

	pattern <- bracket_convert(pattern)
    left <- sapply(pattern, "[", 1)
    right <- sapply(pattern, "[", 2)

    rm_between(text.var = text.var, left = left, right = right, 
        trim = trim, clean = clean, replacement = replacement, 
        extract = extract, include.markers = include.markers, 
        dictionary = dictionary, ...)
}


#' @export
#' @rdname rm_bracket
#' @return \code{rm_round} - returns a character string with round brackets removed.
rm_round <- function(text.var, pattern = "(", trim = TRUE, clean = TRUE, 
    replacement = "", extract = FALSE,
    include.markers = ifelse(extract, FALSE, TRUE),
    dictionary = getOption("regex.library"), ...) {

	pattern <- bracket_convert(pattern)
    left <- sapply(pattern, "[", 1)
    right <- sapply(pattern, "[", 2)

    rm_between(text.var = text.var, left = left, right = right, 
        trim = trim, clean = clean, replacement = replacement, 
        extract = extract, include.markers = include.markers, 
        dictionary = dictionary, ...)
}

#' @export
#' @rdname rm_bracket
#' @return \code{rm_square} - returns a character string with square brackets 
#' removed.
rm_square <- function(text.var, pattern = "[", trim = TRUE, clean = TRUE, 
    replacement = "", extract = FALSE,
    include.markers = ifelse(extract, FALSE, TRUE),
    dictionary = getOption("regex.library"), ...) {

	pattern <- bracket_convert(pattern)
    left <- sapply(pattern, "[", 1)
    right <- sapply(pattern, "[", 2)

    rm_between(text.var = text.var, left = left, right = right, 
        trim = trim, clean = clean, replacement = replacement, 
        extract = extract, include.markers = include.markers, 
        dictionary = dictionary, ...)
}

#' @export
#' @rdname rm_bracket
#' @return \code{rm_curly} - returns a character string with curly brackets 
#' removed.
rm_curly <- function(text.var, pattern = "{", trim = TRUE, clean = TRUE, 
    replacement = "", extract = FALSE,
    include.markers = ifelse(extract, FALSE, TRUE),
    dictionary = getOption("regex.library"), ...) {

	pattern <- bracket_convert(pattern)
    left <- sapply(pattern, "[", 1)
    right <- sapply(pattern, "[", 2)

    rm_between(text.var = text.var, left = left, right = right, 
        trim = trim, clean = clean, replacement = replacement, 
        extract = extract, include.markers = include.markers, 
        dictionary = dictionary, ...)
}

#' @export
#' @rdname rm_bracket
#' @return \code{rm_angle} - returns a character string with angle brackets 
#' removed.
rm_angle <- function(text.var, pattern = "<", trim = TRUE, clean = TRUE, 
    replacement = "", extract = FALSE,
    include.markers = ifelse(extract, FALSE, TRUE),
    dictionary = getOption("regex.library"), ...) {

	pattern <- bracket_convert(pattern)
    left <- sapply(pattern, "[", 1)
    right <- sapply(pattern, "[", 2)

    rm_between(text.var = text.var, left = left, right = right, 
        trim = trim, clean = clean, replacement = replacement, 
        extract = extract, include.markers = include.markers, 
        dictionary = dictionary, ...)
}

bracket_convert <- function(x) {

	if (length(x) == 1 && x == "all") x <- names(.bracketconverts)
	
    x <- unique(.mgsub(sapply(.bracketconverts, "[", 1), 
        names(.bracketconverts), x))

    if (!all(x %in% names(.bracketconverts))) {
        stop("Supply 1 or more of: `square`, `curly`, `round`, and/or `all`")
    }
    
    .bracketconverts[x]

}

.bracketconverts <- list(
    curly = c("{", "}"),
    round = c("(", ")"),
    square = c("[", "]"),
    angle = c("<", ">")     
)

#' @export
#' @rdname rm_bracket
#' @return \code{rm_bracket_multiple} - returns a character string with 
#' multiple brackets removed.  If \code{extract = TRUE} the results are 
#' optionally merged and named by bracket type.  This is more flexible than 
#' \code{rm_bracket} but slower.
rm_bracket_multiple <- function(text.var, trim = TRUE, clean = TRUE, 
    pattern = "all", replacement = "", extract = FALSE, include.markers = FALSE, 
	merge =TRUE) {

    if (extract) {
        return(.bracketXtract(text.var, pattern = pattern,
            include.markers = include.markers, merge = merge))
    }

    out <- .bracketX(text.var, pattern, replacement=replacement)

    if (trim) out <- Trim(out)
    if (clean) {
        out <- gsub("\\s+([.!?])", "\\1", clean(out), perl=TRUE)
    }
    out
}



.bracketX <-
function (text.var, pattern = "all", replacement) {

    lside <- rside <- "[ ]*"
    text.var <- .mgsub(c("(", ")","[", "]", "{", "}", "<", ">"), 
        c(" (", ") "," [", "] ", " {", "} ", " <", "> "), text.var)


    FUN <- function(bracket, text.var, missing, names, replacement) {
        X <- switch(bracket, 
            html = sapply(text.var, function(x) gsub(paste0(lside, "<.*?>", rside), replacement, x)),
            angle = sapply(text.var, function(x) gsub(paste0(lside, "<.*?>", rside), replacement, x)),
            square = sapply(text.var, function(x) gsub(paste0(lside, "\\[.*?\\]", rside), replacement, x)), 
            round = sapply(text.var, function(x) gsub(paste0(lside, "\\(.*?\\)", rside), replacement, x)), 
            curly = sapply(text.var, function(x) gsub(paste0(lside, "\\{.*?\\}", rside), replacement, x)), 
            all = {
                P1 <- sapply(text.var, function(x) gsub(paste0(lside, "\\[.*?\\]", rside), replacement, x))
                P1 <- sapply(P1, function(x) gsub(paste0(lside, "\\(.*?\\)", rside), replacement, x))
                P1 <- sapply(P1, function(x) gsub(paste0(lside, "<.*?>", rside), replacement, x))
                sapply(P1, function(x) gsub(paste0(lside, "\\{.*?\\}", rside), replacement, x))
            }
        )

        names(X) <- NULL
        X
    }

    invisible(lapply(pattern, function(x) {
        text.var <<- FUN(x, text.var = text.var, 
            missing = missing, names = names, replacement=replacement)
    }))
    text.var
}

.bracketXtract <-
function(text.var, pattern = "all", include.markers = FALSE, merge = TRUE){
   
    FUN <- function(text.var, bracket, with){   
        br <- bracket
        br <- ifelse(br=="round", "(", 
            ifelse(br=="square", "[", 
            ifelse(br=="curly", "{",
            ifelse(br=="html", "<",
            ifelse(br=="angle", "<", br)))))
        left <- if ("all" == br) {
            "\\(|\\{|<|\\["
        } else {
            sprintf("\\%s", br)
        }
        map <- c(`\\(`="\\)", `\\[`="\\]", `\\{`="\\}",
                 `\\<`="\\>", `\\(|\\{|<|\\[`="\\)|\\}|\\>|\\]")
        fmt <- if (with) {
            "(%s).*?(%s)"
        } else {
            "(?<=%s).*?(?=%s)"
        }
        re <- sprintf(fmt, left, map[left])
        if(length(text.var)==1){
            unlist(regmatches(text.var, gregexpr(re, text.var, perl=TRUE)))
        }else{  
            regmatches(text.var, gregexpr(re, text.var, perl=TRUE)) 
        }
    }
    out <- invisible(lapply(pattern, function(x) {
        FUN(x, text.var = text.var, with = include.markers)
    }))
    names(out) <- pattern
    if (length(pattern) == 1) {
        return(unlist(out, recursive = FALSE))
    } else {
        if (merge) {
            out <- invisible(lapply(seq_along(text.var), function(i) {
                unlist(invisible(lapply(seq_along(out), function(j) {
                    out[[j]][[i]]
                })))
            }))            
        }
    }
    out
}

