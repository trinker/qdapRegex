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
function (pattern, replacement, text.var, fixed = TRUE, trim = TRUE, 
    order.pattern = fixed, ...) {

    if (fixed && order.pattern) {
        ord <- rev(order(nchar(pattern)))
        pattern <- pattern[ord]
        if (length(replacement) != 1) replacement <- replacement[ord]
    }
    if (length(replacement) == 1) replacement <- rep(replacement, length(pattern))
   
    for (i in seq_along(pattern)){
        text.var <- gsub(pattern[i], replacement[i], text.var, fixed = fixed, ...)
    }

    if (trim) text.var <- gsub("\\s+", " ", gsub("^\\s+|\\s+$", "", text.var, 
        perl=TRUE), perl=TRUE)
    text.var
}




## check if regexes is in dictionary
reg_check <- function(pattern, dictionary, backup = qdapRegex::regex_usa,
    backup2 = qdapRegex::regex_supplement) {

    if(inherits(pattern, "escape")) return(pattern)

    pattern <- gsub("^@ex_", "@rm_", pattern)	
    if (substring(pattern, 1, 4) == "@rm_") {
    	  if (is.null(dictionary)) dictionary <- backup
        reglook <- dictionary[[substring(pattern, 2)]]
        if (!is.null(reglook)) return(reglook)
    } 
    if (substring(pattern, 1, 1) == "@") {
        reglook <- backup2[[substring(pattern, 2)]]
        if (!is.null(reglook)) return(reglook)
    } 	
    pattern

}

## check if regexes is in dictionary and sprintf the n
reg_check_sprintf <- function(pattern, dictionary, n, 
    backup = qdapRegex::regex_usa) {

    if (is.null(dictionary)) dictionary <- backup

    pattern <- gsub("^@ex_", "@rm_", pattern)	
    if (substring(pattern, 1, 4) == "@rm_") {
        reglook <- dictionary[[substring(pattern, 2)]]
        if (!is.null(reglook)) {
            pattern <- reglook
        }
    } 
    sprintf(pattern, n)

}


## check if regexes is in dictionary and sprintf left right
reg_check_sprintf2 <- function(pattern, dictionary, ...,
    backup = qdapRegex::regex_usa) {

    if (is.null(dictionary)) dictionary <- backup
	
    pattern <- gsub("^@ex_", "@rm_", pattern)
    if (substring(pattern, 1, 4) == "@rm_") {
        reglook <- dictionary[[substring(pattern, 2)]]
        if (!is.null(reglook)) {
            pattern <- reglook
        }
    } 
    sprintf(pattern, ...)

}

## Hijack a function
## see: http://stackoverflow.com/a/25366322/1000343
hijack <- function(FUN, ...){

    .FUN <- FUN

    args <- list(...)
    invisible(lapply(seq_along(args), function(i) {
        formals(.FUN)[[names(args)[i]]] <<- args[[i]]
    }))

    .FUN
}

## Function to visualize regex dictionaries
examine_regex <- function(dictionary = qdapRegex::regex_usa){
    lapply(seq_along(dictionary), function(i){
        message(sprintf("\nHere's the regex for `%s`:\n\n  %s", names(dictionary)[i], 
            dictionary[[i]]), "\n\nDo you want to view it?")
        ans <- utils::menu(c("Yes", "No"))
        if (ans == "2") return(NULL) 
        open <- TRUE
        if (grepl("\\(\\?\\<[=!]", dictionary[[i]], perl=TRUE)) {
            warning(immediate. = TRUE, paste("Pattern contains a Lookbehind and is not",
                "viewable to the Java based `www.regexper.com`\n\n", "Setting `open = FALSE`"))
            utils::flush.console(); Sys.sleep(1); open <- FALSE
        } 
        explain(dictionary[[i]], open=open)
    })
}

## Make list into extracted class
ext <- function(x){
    if(!any(class(x) %in% "list")) return(x)
    class(x) <- c("extracted", class(x)) 
    x
}



