# qdapRegex



[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/0.1.0/inactive.svg)](https://www.repostatus.org/#inactive)
[![Coverage Status](https://coveralls.io/repos/trinker/qdapRegex/badge.svg)](https://coveralls.io/github/trinker/qdapRegex)

  
![](tools/qdapRegex_logo/r_qdapRegex.png)

[qdapRegex](https://CRAN.R-project.org/package=qdapRegex) is a collection of regular expression tools associated with the **qdap** package that may be useful outside of the context of discourse analysis.  Tools include removal/extraction/replacement of abbreviations, dates, dollar amounts, email addresses, hash tags, numbers, percentages, citations, person tags, phone numbers, times, and zip codes.  Functions that remove/replace are prefixed with `rm_`.  Each of these functions has an extraction counterpart prefixed with `ex_`.



The **qdapRegex** package does not aim to compete with string manipulation packages such as [**stringr**](https://CRAN.R-project.org/package=stringr) or [**stringi**](https://CRAN.R-project.org/package=stringi) but is meant to provide access to canned, common regular expression patterns that can be used within **qdapRegex**, with **R**'s own regular expression functions, or add on string manipulation packages such as **stringr** and **stringi**.

The functions in **qdapRegex** work on a dictionary system.  The current implementation defaults to a United States flavor of canned regular expressions.  Users may submit proposed region specific regular expression dictionaries that contain the same fields as the [`regex_usa`](https://trinker.github.io/qdapRegex/regex_usa.html) data set or improvements to regular expressions in current dictionaries. Please submit proposed regional regular expression dictionaries via: https://github.com/trinker/qdapRegex/issues

## Educational

The **qdapRegex** package serves a dual purpose of being both functional and educational.  While the canned regular expressions are useful in and of themselves they also serve as a platform for understanding regular expressions in the context of meaningful, purposeful usage.  In the same way I learned guitar while trying to mimic Eric Clapton, not by learning scales and theory, some folks may enjoy an approach of learning regular expressions in a more pragmatic, experiential interaction.  Users are encouraged to look at the regular expressions being used ([`?regex_usa`](https://trinker.github.io/qdapRegex/regex_usa.html) and [`?regex_supplement`](https://trinker.github.io/qdapRegex/regex_supplement.html) are the default regular expression dictionaries used by **qdapRegex**) and unpack how they work.  I have found slow repeated exposures to information in a purposeful context results in acquired knowledge.  

The following regular expressions sites were very helpful to my own regular expression education:

1. [Regular-Expression.info](https://www.regular-expressions.info/tutorial.html)    
2. [Rex Egg](https://www.rexegg.com/)    
3. [Regular Expressions as used in R](https://stat.ethz.ch/R-manual/R-devel/library/base/html/regex.html)    
4. [Debuggex (Visualizing Regex)](https://www.debuggex.com)    

Being able to discuss and ask questions is also important to learning...in this case regular expressions.  I have found the following forums extremely helpful to learning about regular expressions:

1. [stackoverflow](https://stackoverflow.com/)  +  [Posting Guidelines](https://trinker.github.io/stackoverflow/)

## Installation

To download the development version of qdapRegex:

Download the [zip ball](https://github.com/trinker/qdapRegex/zipball/master) or [tar ball](https://github.com/trinker/qdapRegex/tarball/master), decompress and run `R CMD INSTALL` on it, or use the **pacman** package to install the development version:
```r
if (!require("pacman")) install.packages("pacman")
pacman::p_load_gh("trinker/qdapRegex")
```


## Contact

You are welcome to:
* submit suggestions and bug-reports at: <https://github.com/trinker/qdapRegex/issues>
* send a pull request on: <https://github.com/trinker/qdapRegex/>
* compose a friendly e-mail to: <tyler.rinker@gmail.com>

## Examples

The following examples demonstrate some of the functionality of **qdapRegex**.


```r
library(qdapRegex)
```

### Extract Citations

```r
w <- c("Hello World (V. Raptor, 1986) bye (Foo, 2012, pp. 1-2)",
    "Narcissism is not dead (Rinker, 2014)",
    "The R Core Team (2014) has many members.",
    paste("Bunn (2005) said, \"As for elegance, R is refined, tasteful, and",
        "beautiful. When I grow up, I want to marry R.\""),
    "It is wrong to blame ANY tool for our own shortcomings (Baer, 2005).",
    "Wickham's (in press) Tidy Data should be out soon.",
    "Rinker's (n.d.) dissertation not so much.",
    "I always consult xkcd comics for guidance (Foo, 2012; Bar, 2014).",
    "Uwe Ligges (2007) says, \"RAM is cheap and thinking hurts\"",
    "Silly (Bar, 2014) stuff is what Bar (2014, 2012) said."
)

ex_citation(w)
```

```
## [[1]]
## [1] "V. Raptor, 1986" "Foo, 2012"      
## 
## [[2]]
## [1] "Rinker, 2014"
## 
## [[3]]
## [1] "The R Core Team (2014)"
## 
## [[4]]
## [1] "Bunn (2005)"
## 
## [[5]]
## [1] "Baer, 2005"
## 
## [[6]]
## [1] "Wickham's (in press)"
## 
## [[7]]
## [1] "Rinker's (n.d.)"
## 
## [[8]]
## [1] "Foo, 2012" "Bar, 2014"
## 
## [[9]]
## [1] "Uwe Ligges (2007)"
## 
## [[10]]
## [1] "Bar, 2014"        "Bar (2014, 2012)"
```

```r
as_count(ex_citation(w))
```

```
##             Author     Year n
## 7              Bar     2014 3
## 6              Foo     2012 2
## 2             Baer     2005 1
## 5              Bar     2012 1
## 3             Bunn     2005 1
## 8           Rinker     2014 1
## 11          Rinker     n.d. 1
## 9  The R Core Team     2014 1
## 4       Uwe Ligges     2007 1
## 1        V. Raptor     1986 1
## 10         Wickham in press 1
```

### Extract Twitter Hash Tags, Name Tags, & URLs


```r
x <- c("@hadley I like #rstats for #ggplot2 work.",
    "Difference between #magrittr and #pipeR, both implement pipeline operators for #rstats:
        http://renkun.me/r/2014/07/26/difference-between-magrittr-and-pipeR.html @timelyportfolio",
    "Slides from great talk: @ramnath_vaidya: Interactive slides from Interactive Visualization
        presentation #user2014. http://ramnathv.github.io/user2014-rcharts/#1"
)

ex_hash(x)
```

```
## [[1]]
## [1] "#rstats"  "#ggplot2"
## 
## [[2]]
## [1] "#magrittr" "#pipeR"    "#rstats"  
## 
## [[3]]
## [1] "#user2014"
```

```r
ex_tag(x)
```

```
## [[1]]
## [1] "@hadley"
## 
## [[2]]
## [1] "@timelyportfolio"
## 
## [[3]]
## [1] "@ramnath_vaidya"
```

```r
ex_url(x)
```

```
## [[1]]
## [1] NA
## 
## [[2]]
## [1] "http://renkun.me/r/2014/07/26/difference-between-magrittr-and-pipeR.html"
## 
## [[3]]
## [1] "http://ramnathv.github.io/user2014-rcharts/#1"
```

### Extract Bracketed Text


```r
y <- c("I love chicken [unintelligible]!", 
    "Me too! (laughter) It's so good.[interrupting]",
    "Yep it's awesome {reading}.", "Agreed. {is so much fun}")

ex_bracket(y)
```

```
## [[1]]
## [1] "unintelligible"
## 
## [[2]]
## [1] "laughter"     "interrupting"
## 
## [[3]]
## [1] "reading"
## 
## [[4]]
## [1] "is so much fun"
```

```r
ex_curly(y)
```

```
## [[1]]
## [1] NA
## 
## [[2]]
## [1] NA
## 
## [[3]]
## [1] "reading"
## 
## [[4]]
## [1] "is so much fun"
```

```r
ex_round(y)
```

```
## [[1]]
## [1] NA
## 
## [[2]]
## [1] "laughter"
## 
## [[3]]
## [1] NA
## 
## [[4]]
## [1] NA
```

```r
ex_square(y)
```

```
## [[1]]
## [1] "unintelligible"
## 
## [[2]]
## [1] "interrupting"
## 
## [[3]]
## [1] NA
## 
## [[4]]
## [1] NA
```

### Extract Numbers


```r
z <- c("-2 is an integer.  -4.3 and 3.33 are not.",
    "123,456 is a lot more than -.2",
    "hello world -.q")
rm_number(z)
```

```
## [1] "is an integer. and are not." "is a lot more than"         
## [3] "hello world -.q"
```

```r
ex_number(z)
```

```
## [[1]]
## [1] "-2"   "-4.3" "3.33"
## 
## [[2]]
## [1] "123,456" "-.2"    
## 
## [[3]]
## [1] NA
```

```r
as_numeric(ex_number(z))
```

```
## [[1]]
## [1] -2.00 -4.30  3.33
## 
## [[2]]
## [1] 123456.0     -0.2
## 
## [[3]]
## [1] NA
```

### Extract Times


```r
x <- c(
    "I'm getting 3:04 AM just fine, but...",
    "for 10:47 AM I'm getting 0:47 AM instead.",
    "no time here",
    "Some time has 12:04 with no AM/PM after it",
    "Some time has 12:04 a.m. or the form 1:22 pm"
)
ex_time(x)
```

```
## [[1]]
## [1] "3:04"
## 
## [[2]]
## [1] "10:47" "0:47" 
## 
## [[3]]
## [1] NA
## 
## [[4]]
## [1] "12:04"
## 
## [[5]]
## [1] "12:04" "1:22"
```

```r
as_time(ex_time(x))
```

```
## [[1]]
## [1] "00:03:04.0"
## 
## [[2]]
## [1] "00:10:47.0" "00:00:47.0"
## 
## [[3]]
## [1] NA
## 
## [[4]]
## [1] "00:12:04.0"
## 
## [[5]]
## [1] "00:12:04.0" "00:01:22.0"
```

```r
as_time(ex_time(x), as.POSIXlt = TRUE)
```

```
## [[1]]
## [1] "2017-11-27 00:03:04 EST"
## 
## [[2]]
## [1] "2017-11-27 00:10:47 EST" "2017-11-27 00:00:47 EST"
## 
## [[3]]
## [1] NA
## 
## [[4]]
## [1] "2017-11-27 00:12:04 EST"
## 
## [[5]]
## [1] "2017-11-27 00:12:04 EST" "2017-11-27 00:01:22 EST"
```

### Remove Non-Words & N Character Words


```r
x <- c(
    "I like 56 dogs!",
    "It's seventy-two feet from the px290.",
    NA,
    "What",
    "that1is2a3way4to5go6.",
    "What do you*% want?  For real%; I think you'll see.",
    "Oh some <html>code</html> to remove"
)

rm_non_words(x)
```

```
## [1] "I like dogs"                                 
## [2] "It's seventy two feet from the px"           
## [3] NA                                            
## [4] "What"                                        
## [5] "that is a way to go"                         
## [6] "What do you want For real I think you'll see"
## [7] "Oh some html code html to remove"
```

```r
rm_nchar_words(rm_non_words(x), "1,2")
```

```
## [1] "like dogs"                              
## [2] "It's seventy two feet from the"         
## [3] NA                                       
## [4] "What"                                   
## [5] "that way"                               
## [6] "What you want For real think you'll see"
## [7] "some html code html remove"
```
