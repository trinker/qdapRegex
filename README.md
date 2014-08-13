# qdapRegex

[![Build Status](https://travis-ci.org/trinker/qdapRegex.png?branch=master)](https://travis-ci.org/trinker/qdapRegex)
[![DOI](https://zenodo.org/badge/5398/trinker/qdapRegex.png)](http://dx.doi.org/10.5281/zenodo.11243)

![qdapicon](https://dl.dropbox.com/u/61803503/qdapicon.png)   
[qdapRegex](http://trinker.github.com/qdapRegex_dev) is a collection of regular expression tools associated with the **qdap** package that may be useful outside of the context of discourse analysis.  Tools include removal/extraction/replacement of abbreviations, dates, dollar amounts, email addresses, hash tags, numbers, percentages, person tags, phone numbers, times, and zip codes.

The **qdapRegex** package does not aim to compete with string manipulation packages such as [**stringr**](http://cran.r-project.org/web/packages/stringr/index.html) or [**stringi**](http://cran.r-project.org/web/packages/stringi/index.html) but is meant to provide access to canned, common regular expression patterns that can be used within **qdapRegex**, with **R**'s own regular expression functions, or add on string manipulation packages such as **stringr** and **stringi**.

The functions in **qdapRegex** work on a dictionary system.  The current implementation defaults to a United States flavor of canned regular expressions.  Users may submit proposed region specific regular expression dictionaries that contain the same fields as the [`regex_usa`](http://trinker.github.io/qdapRegex/regex_usa.html) data set or improvements to regular expressions in current dictionaries. Please submit proposed regional regular expression dictionaries via: https://github.com/trinker/qdapRegex/

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

