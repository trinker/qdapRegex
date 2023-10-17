#' Remove/Replace/Extract White Space
#' 
#' \code{rm_white} - Remove multiple white space (> 1 becomes a single white 
#' space), white space before a comma, white space before a single or 
#' consecutive combination of a colon, semicolon, or endmark (period, question 
#' mark, or exclamation point), white space after a left bracket ("\{", "(", "[") 
#' or before a right bracket ("\}", ")", "]"), leading or trailing white space.
#' 
#' @param text.var The text variable.
#' @param trim logical.  If \code{TRUE} removes leading and trailing white 
#' spaces.
#' @param clean trim logical.  If \code{TRUE} extra white spaces and escaped 
#' character will be removed.
#' @param pattern A character string containing a regular expression (or 
#' character string for \code{fixed = TRUE}) to be matched in the given 
#' character vector.  Default, \code{@@rm_dollar} uses the 
#' \code{rm_dollar} regex from the regular expression dictionary from 
#' the \code{dictionary} argument.
#' @param replacement Replacement for matched \code{pattern}.
#' @param extract logical.  If \code{TRUE} the dollar strings are extracted into a 
#' list of vectors.
#' @param dictionary A dictionary of canned regular expressions to search within 
#' if \code{pattern} begins with \code{"@@rm_"}.
#' @param \dots Other arguments passed to \code{\link[base]{gsub}}.
#' @return Returns a character string with extra white space removed.
#' @keywords percent
#' @family rm_ functions
#' @include utils.R
#' @export
#' @rdname rm_white
#' @seealso \code{\link[base]{gsub}},
#' \code{\link[stringi]{stri_extract_all_regex}}
#' @examples
#' x <-  c(" There is ( $5.50 ) for , me . ", " that's [ 45.6% ] of! the pizza !", 
#'     "     14% is { $26  } or $25.99 ?", "Oh ;  here's colon : Yippee !")
#'
#' rm_white(x)
#' rm_white_bracket(x)
#' rm_white_colon(x)
#' rm_white_comma(x)
#' rm_white_endmark(x)
#' rm_white_lead(x)
#' rm_white_trail(x)
#' rm_white_lead_trail(x)
#' rm_white_multiple(x)
#' rm_white_punctuation(x)
rm_white <- hijack(rm_default, pattern = "@rm_white", clean = FALSE, trim = FALSE)

#' @export
#' @rdname rm_white
ex_white <- hijack(rm_white, extract=TRUE)



#' Remove/Replace/Extract White Space
#' 
#' \code{rm_white_bracket} - Remove white space after a left bracket ("\{", "(", "[") 
#' or before a right bracket ("\}", ")", "]").
#' 
#' @include utils.R
#' @export
#' @rdname rm_white
rm_white_bracket <- hijack(rm_default, pattern = "@rm_white_bracket")


#' @export
#' @rdname rm_white
ex_white_bracket <- hijack(rm_white_bracket, extract=TRUE)


#' Remove/Replace/Extract White Space
#' 
#' \code{rm_white_colon} - Remove white space before a single or consecutive 
#' combination of a colon, semicolon.
#' 
#' @include utils.R
#' @export
#' @rdname rm_white
rm_white_colon <- hijack(rm_default, pattern = "@rm_white_colon")

#' @export
#' @rdname rm_white
ex_white_colon <- hijack(rm_white_colon, extract=TRUE)


#' Remove/Replace/Extract White Space
#' 
#' \code{rm_white_comma} - Remove white space before a comma.
#' 
#' @include utils.R
#' @export
#' @rdname rm_white
rm_white_comma <- hijack(rm_default, pattern = "@rm_white_comma")


#' @export
#' @rdname rm_white
ex_white_comma <- hijack(rm_white_comma, extract=TRUE)



#' Remove/Replace/Extract White Space
#' 
#' \code{rm_white_endmark} - Remove white space before endmark(s) (".", "?", "!").
#' 
#' @include utils.R
#' @export
#' @rdname rm_white
#' @author \code{rm_white_endmark}/\code{rm_white_punctuation} - \href{https://stackoverflow.com}{stackoverflow}'s hwnd and Tyler Rinker <tyler.rinker@@gmail.com>. 
#' @references The \code{rm_white_endmark}/\code{rm_white_punctuation} regular expression was taken from: 
#' \url{https://stackoverflow.com/a/25464921/1000343}
rm_white_endmark <- hijack(rm_default, pattern = "@rm_white_endmark")


#' @export
#' @rdname rm_white
ex_white_endmark <- hijack(rm_white_endmark, extract=TRUE)




#' Remove/Replace/Extract White Space
#' 
#' \code{rm_white_lead} - Remove leading white space.
#' 
#' @include utils.R
#' @export
#' @rdname rm_white
rm_white_lead <- hijack(rm_default, pattern = "@rm_white_lead", clean = FALSE, 
	trim = FALSE)

#' @export
#' @rdname rm_white
ex_white_lead <- hijack(rm_white_lead, extract=TRUE)



#' Remove/Replace/Extract White Space
#' 
#' \code{rm_white_lead_trail} - Remove leading or trailing white space.
#' 
#' @include utils.R
#' @export
#' @rdname rm_white
rm_white_lead_trail <- hijack(rm_default, pattern = "@rm_white_lead_trail", 
	clean = FALSE, trim = FALSE)

#' @export
#' @rdname rm_white
ex_white_lead_trail <- hijack(rm_white_lead_trail, extract=TRUE)




#' Remove/Replace/Extract White Space
#' 
#' \code{rm_white_trail} - Remove trailing white space.
#' 
#' @include utils.R
#' @export
#' @rdname rm_white
rm_white_trail <- hijack(rm_default, pattern = "@rm_white_trail", 
	clean = FALSE, trim = FALSE)

#' @export
#' @rdname rm_white
ex_white_trail <- hijack(rm_white_trail, extract=TRUE)




#' Remove/Replace/Extract White Space
#' 
#' \code{rm_white_multiple} - Remove multiple white space (> 1 becomes a single 
#' white space).
#' 
#' @include utils.R
#' @export
#' @rdname rm_white
rm_white_multiple <- hijack(rm_default, pattern = "@rm_white_multiple")

#' @export
#' @rdname rm_white
ex_white_multiple <- hijack(rm_white_multiple, extract=TRUE)



#' Remove/Replace/Extract White Space
#' 
#' \code{rm_white_punctuation} - Remove multiple white space before a comma, white 
#' space before a single or consecutive combination of a colon, semicolon, or 
#' endmark (period, question mark, or exclamation point).
#' 
#' @include utils.R
#' @export
#' @rdname rm_white
rm_white_punctuation <- hijack(rm_default, pattern = "@rm_white_punctuation") 

#' @export
#' @rdname rm_white
ex_white_punctuation <- hijack(rm_white_punctuation, extract=TRUE)


