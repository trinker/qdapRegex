## Remove Leading/Trailing White Space
## 
## Remove leading/trailing white space.
Trim <-
function (x) gsub("^\\s+|\\s+$", "", x)


## Remove Escaped Characters
## 
## Preprocess data to remove escaped characters
clean <-
function(text.var) {
    gsub("\\s+", " ", gsub("\\\\r|\\\\n|\\n|\\\\t", " ", text.var))
}

## Multiple gsub
## 
## multigsub - A wrapper for \code{\link[base]{gsub}} that takes a vector 
## of search terms and a vector or single value of replacements.
.mgsub <-
function(pattern, replacement = NULL, text.var, leadspace = FALSE, 
    trailspace = FALSE, fixed = TRUE, trim = TRUE, order.pattern = fixed, ...){

    if (leadspace | trailspace) {
        replacement <- spaste(replacement, trailing = trailspace, 
            leading = leadspace)
    }

    ## replaces the larger n character words first
    if (fixed && order.pattern) {
        if (!is.null(replacement) && length(replacement) > 1) {
            replacement <- replacement[rev(order(nchar(pattern)))]
        }
        pattern <- pattern[rev(order(nchar(pattern)))]
    }

    key <- data.frame(pat=pattern, rep=replacement, 
        stringsAsFactors = FALSE)

    msubs <-function(K, x, trim, ...){
        sapply(seq_len(nrow(K)), function(i){
                x <<- gsub(K[i, 1], K[i, 2], x, fixed = fixed, ...)
            }
        )
        if (trim) x <- gsub(" +", " ", x)
        return(x)
    }

    if (trim) {
        x <- Trim(msubs(K=key, x=text.var, trim = trim, ...))
    } else {    
        x <- msubs(K=key, x=text.var, trim = trim, ...)
    }

    return(x)
}

## Add Leading/Trailing Spaces
## 
## Adds trailing and/or leading spaces to a vector of terms.
spaste <- 
function(terms, trailing = TRUE, leading = TRUE){
    if (leading) {
        s1 <- " "
    } else {
        s1 <- ""
    }
    if (trailing) {
        s2 <- " "
    } else {
        s2 <- ""
    }
    pas <- function(x) paste0(s1, x, s2)
    if (is.list(terms)) {
        z <- lapply(terms, pas)
    } else {
        z <- pas(terms)
    }
    return(z)
}

## default qdapRegex function template
rm_default <- function(text.var, trim = TRUE, clean = TRUE, pattern, 
	replacement = "", extract = FALSE, 
	dictionary = getOption("regex.library"), ...) {

	pattern <- reg_check(pattern = pattern, dictionary = dictionary)
	
    if (extract) {
        return(regmatches(text.var, gregexpr(pattern, text.var, perl=TRUE)))
    }

    out <- gsub(pattern, replacement, text.var, ...)
    if (trim) out <- Trim(out)
    if (clean) out <- clean(out)
    out
}

## check if regexes is in dictionary
reg_check <- function(pattern, dictionary, backup = qdapRegex::regex_usa) {

	if (is.null(dictionary)) dictionary <- backup
	
    if (substring(pattern, 1, 4) == "@rm_") {
        reglook <- dictionary[[substring(pattern, 2)]]
        if (!is.null(reglook)) return(reglook)
    } 
    pattern

}

## check if regexes is in dictionary and sprintf the n
reg_check_sprintf <- function(pattern, dictionary, n, 
    backup = qdapRegex::regex_usa) {

    if (is.null(dictionary)) dictionary <- backup
	
    if (substring(pattern, 1, 4) == "@rm_") {
        reglook <- dictionary[[substring(pattern, 2)]]
        if (!is.null(reglook)) {
            pattern <- reglook
        }
    } 
    sprintf(pattern, n)

}

