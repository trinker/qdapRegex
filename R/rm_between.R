#' Remove/Replace/Extract Strings Between 2 Markers
#' 
#' Remove/replace/extract strings bounded between a left and right marker.
#' 
#' @param text.var The text variable.
#' @param left A vector of character or numeric symbols as the left edge to 
#' extract.
#' @param right A vector of character or numeric symbols as the right edge to 
#' extract.
#' @param fixed logical.  If \code{TRUE} regular expression special characters 
#' (\code{c(".", "|", "(", ")", "[", "]", "{", "}", "^", "$", "*", "+", "?")})
#' will be treated as typical characters.  If the user wants to pass a regular 
#' expression with special characters then \code{fixed = FALSE} should be used.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the strings are extracted into a 
#' list of vectors.
#' @param include.markers logical.  If \code{TRUE} and \code{extract = TRUE} returns 
#' the markers (left/right) and the text between.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @param merge logical.  If \code{TRUE} the results of each bracket type will 
#' be merged by string.  \code{FALSE} returns a named list of lists of vectors 
#' of markered text per marker type.  
#' @return Returns a character string with markers removed.  If 
#' \code{rm_between} returns merged strings and is significantly faster.  If
#' \code{rm_between_multiple} the strings are optionally merged by 
#' \code{left}/\code{right} symbols.  The latter approach is more flexible and
#' names extracted strings by symbol boundaries, however, it is slower than 
#' \code{rm_between}.
#' @family rm_ functions
#' @include rm_default.R utils.R
#' @include utils.R
#' @export
#' @rdname rm_between
#' @include rm_default.R utils.R
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[qdapRegex]{rm_bracket}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @examples
#' x <-  "I like [bots] (not)."
#' 
#' rm_between(x, "(", ")")
#' ex_between(x, "(", ")")
#' rm_between(x, c("(", "["), c(")", "]"))
#' ex_between(x, c("(", "["), c(")", "]"))
#' 
#' rm_between(x, c("(", "["), c(")", "]"), include.markers=FALSE)
#' ex_between(x, c("(", "["), c(")", "]"), include.markers=TRUE) 
#' 
#' ## multiple (naming and ability to keep separate bracket types but slower)
#' x <- c("Where is the /big dog#?",
#'     "I think he's @@arunning@@b with /little cat#.")
#' 
#' rm_between_multiple(x, "@@a", "@@b")
#' ex_between_multiple(x, "@@a", "@@b")
#' rm_between_multiple(x, c("/", "@@a"), c("#", "@@b"))
#' ex_between_multiple(x, c("/", "@@a"), c("#", "@@b"))
#' 
#' x2 <- c("Where is the L1big dogL2?",
#'     "I think he's 98running99 with L1little catL2.")
#' rm_between_multiple(x2, c("L1", 98), c("L2", 99))
#' ex_between_multiple(x2, c("L1", 98), c("L2", 99))
#' 
#' state <- c("Computer is fun. Not too fun.", "No it's not, it's dumb.", 
#'     "What should we do?", "You liar, it stinks!", "I am telling the truth!", 
#'     "How can we be certain?", "There is no way.", "I distrust you.", 
#'     "What are you talking about?", "Shall we move on?  Good then.", 
#'     "I'm hungry.  Let's eat.  You already?")
#' 
#' rm_between_multiple(state, c("is", "we"), c("too", "on"))
#' 
#' ## Use Grouping
#' s <- "something before stuff $some text$ in between $1$ and after"
#' rm_between(s, "$", "$", replacement="<B>\\2<E>")
#' 
#' ## Using regular expressions as boundaries (fixed =FALSE)
#' x <-  c(
#'     "There are 2.3 million species in the world",
#'     "There are 2.3 billion species in the world"
#' )
#' 
#' ex_between(x, left='There', right = '[mb]illion', fixed = FALSE, include=TRUE)
rm_between <- function(text.var, left, right, fixed = TRUE, trim = TRUE, 
    clean = TRUE, replacement = "", extract = FALSE, 
    include.markers = ifelse(extract, FALSE, TRUE),
    dictionary = getOption("regex.library"), ...) {

    stopifnot(length(left) == length(right))

    pattern <- Map(function(x, y) {rm_between_subber(left=x, right=y, 
        fixed = fixed, dictionary=dictionary, include.markers=include.markers)}, 
        left, right)

    pattern <- paste(pattern, collapse="|")
# browser()
    if (extract) {
        
        quotelocs <- left %in% c("'", '"') & right %in% c("'", '"')
        
        if (any(quotelocs)){
         
            out <- Map(function(ql, l, r){
                    if (ql) {
                        
                	    if (!trim) {
                            return(rm_between_quote(text.var, left)[[1]])
                    	}
                	    return(lapply(rm_between_quote(text.var, left), Trim)[[1]]) 
                        
                    } else {
                        
                    	if (!trim) {
                            return(stringi::stri_extract_all_regex(text.var, pattern)[[1]])
                    	}
                    	return(lapply(stringi::stri_extract_all_regex(text.var, pattern), Trim)[[1]]) 
                        
                    }
                },
                ql = quotelocs, l=left, r=right
            )
            # 
            # if (length(left) == 1){
            #     out <- out[[1]]
            # }
            
            return(ext(out))
            
        }
    	if (!trim) {
            return(ext(stringi::stri_extract_all_regex(text.var, pattern)))
    	}
    	return(ext(lapply(stringi::stri_extract_all_regex(text.var, pattern), Trim)))
    }

    out <- gsub(pattern, replacement, text.var, perl = TRUE, ...)
    if (trim) out <- Trim(out)
    if (clean) out <- clean(out)
    out
}

rm_between_quote <- function(x, y){
    switch(y,
        `'` = rm_between_single_quote(x),
        `"` = rm_between_double_quote(x), 
        stop("not a quote boundary")
    )
}

rm_between_double_quote <- function(x){
        lapply(rm_default(
            x, 
            pattern = '"[^"]*"', 
            extract=TRUE
        ), function(y){
                gsub('^"|"$', '', y) 
            }
        )
}

rm_between_single_quote <- function(x){
        lapply(rm_default(
            x, 
            pattern = "'[^']*'", 
            extract=TRUE
        ), function(y){
                gsub("^'|'$", '', y) 
            }
        )
}

rm_between_subber <- function(left, right, include.markers, dictionary, fixed = fixed) {
    
    pattern <- c("@rm_between", "@rm_between2")[2 -  as.numeric(include.markers)]

    if (isTRUE(fixed)){
        left <- .mgsub(.specchars , paste0("\\", .specchars), left)
        right <- .mgsub(.specchars , paste0("\\", .specchars), right)
    }
    
    reg_check_sprintf2(pattern, dictionary = dictionary, left, right)
}

.specchars <- c(".", "|", "(", ")", "[", "]", "{", "}", "^", "$", "*", "+", "?")


#' @include utils.R
#' @export
#' @rdname rm_between
rm_between_multiple <- function(text.var, left, right, fixed = TRUE, 
    trim = TRUE, clean = TRUE, replacement = "", extract = FALSE, 
    include.markers = FALSE, merge =TRUE) {

    if (extract) {
        return(.genXtract(text.var, left = left, right = right, 
            with=include.markers, merge = merge, fixed = fixed))
    }

    out <- .genX(text.var, left = left, right = right, replacement=replacement, 
        fixed = fixed)

    if (trim) out <- Trim(out)
    if (clean) {
        out <- gsub("\\s+([.!?])", "\\1", clean(out), perl=TRUE)
    }
    out
}



.genX <- 
function (text.var, left, right, missing = NULL, names = FALSE, replacement="", 
    fixed = FALSE) {
    
    if (length(left) != length(right)) {
        stop("left and right must be equal length") 
    }

    lside <- rside <- "[ ]*"

    if (isTRUE(fixed)){
        specchar <- c(".", "|", "(", ")", "[", "{", "^", "$", "*", "+", "?")
        left <- .mgsub(specchar, paste0("\\", specchar), left, fixed = TRUE)
        right <- .mgsub(specchar, paste0("\\", specchar), right, fixed = TRUE)
    }
    FUN <- function(left, right, text.var, missing, names, replace) {
        X <- sapply(text.var, function(x) gsub(paste0(lside, left, ".+?", right, rside), replace, x))
        names(X) <- NULL
        X
    }
    invisible(lapply(seq_along(left), function(i) {
        text.var <<- FUN(left[i], right[i], text.var = text.var, 
            names = names, replace=replacement)
    }))
    text.var
}


.genXtract <-
function(text.var, left, right, with = FALSE, merge = TRUE, fixed = FALSE){
    
    if (length(left) != length(right)) {
        stop("left and right must be equal length") 
    }
    
    LN <- left
    RN <- right
    
    if (isTRUE(fixed)){
        specchar <- c(".", "|", "(", ")", "[", "{", "^", "$", "*", "+", "?")
        left <- .mgsub(specchar, paste0("\\", specchar), left, fixed = TRUE)
        right <- .mgsub(specchar, paste0("\\", specchar), right, fixed = TRUE)
    }
    FUN <- function(left, right, text.var, with){   
        fmt <- if (with) {
            "(%s).*?(%s)"
        } else {
            "(?<=%s).*?(?=%s)"
        }
        re <- sprintf(fmt, as.character(left), as.character(right))
        if(length(text.var)==1){
            unlist(regmatches(text.var, gregexpr(re, text.var, perl=TRUE)))
        }else{  
            regmatches(text.var, gregexpr(re, text.var, perl=TRUE)) 
        }
    }
    out <- invisible(lapply(seq_along(left), function(i) {
        FUN(left[i], right[i], text.var = text.var, with = with)
    }))
    names(out) <- paste(LN, " : ", RN)
    if (length(left) == 1) {
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
    ext(out)
} 

#' @export
#' @rdname rm_between
ex_between <- hijack(rm_between, extract=TRUE)

#' @export
#' @rdname rm_between
ex_between_multiple <- hijack(rm_between_multiple, extract=TRUE)
