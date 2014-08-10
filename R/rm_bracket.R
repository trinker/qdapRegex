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
#' or more of the strings \code{"curly"}, \code{"square"}, \code{"round"}, 
#' \code{"angle"} and \code{"all"}.  These strings correspond 
#' to: \{, [, (, < or all four types.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the dollars are extracted into a 
#' list of vectors.
#' @param include.bracket logical.  If \code{TRUE} and \code{extract = TRUE} returns 
#' the brackets and the bracketed text.
#' @param merge logical.  If \code{TRUE} the results of each bracket type will 
#' be merged by string.  \code{FALSE} returns a named list of lists of vectors 
#' of bracketed text per bracket type.  
#' @return Returns a character string with brackets removed.
#' @keywords bracket
#' @references \url{http://stackoverflow.com/q/8621066/1000343} 
#' @author  Martin Morgan and Tyler Rinker <tyler.rinker@@gmail.com>.
#' @export
#' @seealso \code{\link[base]{gsub}}
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
#' rm_bracket(examp$tex, include.bracket=TRUE, extract=TRUE)
#' \dontrun{
#' qdap::paste2(rm_bracket(examp$tex, pattern="curly", extract=TRUE))
#' }
rm_bracket <- function(text.var, trim = TRUE, clean = TRUE, 
    pattern = "all", replacement = "", extract = FALSE, 
    include.bracket = FALSE, merge =TRUE) {

    if (extract) {
        return(.bracketXtract(text.var, pattern = pattern,
            include.bracket = include.bracket, merge = merge))
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
function(text.var, pattern = "all", include.bracket = FALSE, merge = TRUE){
   
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
        FUN(x, text.var = text.var, with = include.bracket)
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

