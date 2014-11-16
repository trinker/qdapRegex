# qdapRegex

[![Build Status](https://travis-ci.org/trinker/qdapRegex.png?branch=master)](https://travis-ci.org/trinker/qdapRegex)
[![DOI](https://zenodo.org/badge/5398/trinker/qdapRegex.png)](http://dx.doi.org/10.5281/zenodo.11284)

<img src="inst/qdapRegex_logo/r_qdapRegex.png" width="45%">      
[qdapRegex](http://trinker.github.com/qdapRegex_dev) is a collection of regular expression tools associated with the **qdap** package that may be useful outside of the context of discourse analysis.  Tools include removal/extraction/replacement of abbreviations, dates, dollar amounts, email addresses, hash tags, numbers, percentages, person tags, phone numbers, times, and zip codes.


The **qdapRegex** package does not aim to compete with string manipulation packages such as [**stringr**](http://cran.r-project.org/web/packages/stringr/index.html) or [**stringi**](http://cran.r-project.org/web/packages/stringi/index.html) but is meant to provide access to canned, common regular expression patterns that can be used within **qdapRegex**, with **R**'s own regular expression functions, or add on string manipulation packages such as **stringr** and **stringi**.

The functions in **qdapRegex** work on a dictionary system.  The current implementation defaults to a United States flavor of canned regular expressions.  Users may submit proposed region specific regular expression dictionaries that contain the same fields as the [`regex_usa`](http://trinker.github.io/qdapRegex/regex_usa.html) data set or improvements to regular expressions in current dictionaries. Please submit proposed regional regular expression dictionaries via: https://github.com/trinker/qdapRegex/issues

## Educational

The **qdapRegex** package serves a dual purpose of being both functional and educational.  While the canned regular expressions are useful in and of themselves they also serve as a platform for understanding regular expressions in the context of meaningful, purposeful usage.  In the same way I learned guitar while trying to mimic Eric Clapton, not by learning scales and theory, some folks may enjoy an approach of learning regular expressions in a more pragmatic, experiential interaction.  Users are encouraged to look at the regular expressions being used ([`?regex_usa`](http://trinker.github.io/qdapRegex/regex_usa.html) and [`?regex_supplement`](http://trinker.github.io/qdapRegex/regex_supplement.html) are the default regular expression dictionaries used by **qdapRegex**) and unpack how they work.  I have found slow repeated exposures to information in a purposeful context results in acquired knowledge.  

The following regular expressions sites were very helpful to my own regular expression education:

1. [Regular-Expression.info](http://www.regular-expressions.info/tutorial.html)    
2. [Rex  Egg](http://www.rexegg.com/)    
3. [Regular Expressions as used in R](https://stat.ethz.ch/R-manual/R-devel/library/base/html/regex.html)

Being able to discuss and ask questions is also important to learning...in this case regular expressions.  I have found the following forums extremely helpful to learning about regular expressions:

1. [Talk Stats](http://www.talkstats.com/)  +  [Posting Guidelines](http://www.talkstats.com/showthread.php/14960-Forum-Guidelines-Smart-posting-behavior-pays-off)    
2. [stackoverflow](http://stackoverflow.com/)  +  [Posting Guidelines](http://stackoverflow.com/help/how-to-ask)

## Installation

To download the development version of qdapRegex:

Download the [zip ball](https://github.com/trinker/qdapRegex/zipball/master) or [tar ball](https://github.com/trinker/qdapRegex/tarball/master), decompress and run `R CMD INSTALL` on it, or use the **devtools** package to install the development version:

```r
# install.packages("devtools")

library(devtools)
install_github("trinker/qdapRegex")
```

## Help

- [Web Page](http://trinker.github.com/qdapRegex/)     
- [Package PDF Help Manual](https://dl.dropboxusercontent.com/u/61803503/qdapRegex.pdf)   

## Contact

You are welcome to:
* submit suggestions and bug-reports at: <https://github.com/trinker/qdapRegex/issues>
* send a pull request on: <https://github.com/trinker/qdapRegex/>
* compose a friendly e-mail to: <tyler.rinker@gmail.com>

