#========
# BUILD
#========
source("inst/build.R")

#==========================
# Run unit tests
#==========================
devtools::test()

#==========================
# Regex data set
#==========================
regex_usa <- list(
    rm_abbreviation = "([A-Za-z][\\.]\\s*){1,}([A-Za-z][\\.])",
    rm_between = "(%s).*?(%s)",
    rm_between2 = "(?<=%s).*?(?=%s)",	
    rm_caps = "(\\b[A-Z]{2,}\\b)", 
    rm_city_state = "([A-Z][\\w-]*(\\s+[A-Z][\\w-]*)+),\\s*([A-Z]{2})\\b|(\\b[A-Za-z]+),\\s*([A-Z]{2})\\b",
    rm_city_state_zip = "([A-Z][\\w-]*(\\s+[A-Z][\\w-]*)+),\\s*([A-Z]{2})\\s*(?<!\\d)\\d{5}(?:[ -]\\d{4})?\\b|(\\b[A-Za-z]+),\\s*([A-Z]{2})\\s*(?<!\\d)\\d{5}(?:[ -]\\d{4})?\\b",
    rm_date = "\\d{0,2}/\\d{2}/(?:\\d{4}|\\d{2})?|\\d{0,2}-\\d{2}-(?:\\d{4}|\\d{2})?|\\d{0,2}\\.\\d{2}\\.(?:\\d{4}|\\d{2})?", 
    rm_date2 = "(\\b)([A-Za-z]{3,9})(\\s+)([0-9][0-9]*)(,)(\\s+)([0-9]{4})",
    rm_date3 = "[0-9]{4}-[0-9]{2}-[0-9]{2}",
    rm_date4 = "\\d{0,2}/\\d{2}/(?:\\d{4}|\\d{2})?|\\d{0,2}-\\d{2}-(?:\\d{4}|\\d{2})?|\\d{0,2}\\.\\d{2}\\.(?:\\d{4}|\\d{2})?|(\\b)([A-Za-z]{3,9})(\\s+)([0-9][0-9]*)(,)(\\s+)([0-9]{4})|[0-9]{4}-[0-9]{2}-[0-9]{2}",
    rm_dollar = "\\$\\(?[0-9.]+\\)?", 
    rm_email = "([_+a-z0-9-]+(\\.[_+a-z0-9-]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)*(\\.[a-z]{2,14}))", 
    rm_emoticon = ">?[:;=8XB]{1}[-~+o^]?[|\")(&gt;DO>{pP3/]+|</?3|XD+|D:<|x[-~+o^]?[|\")(&gt;DO>{pP3/]+",
    rm_endmark = "[\\!\\*\\.\\?\\|]+$",
    rm_endmark2 = "[\\!\\.\\?]+$",
    rm_endmark3 = "[\\!\\*\\.\\;\\?\\|\\:]+$",	
    rm_hash = "(?<!/)#\\w+", 
    rm_nchar_words = "(?<![\\w'])(?:'?\\w'?){%s}(?![\\w'])",
    rm_nchar_words2 = "(?<![\\w'])([\\w']){%s}(?![\\w'])",
    rm_number = "-0?\\.\\d*[1-9]|-*[1-9](?:\\d{0,2})(?:,\\d{3})*(?:\\.\\d*[1-9])?|0?\\.\\d*[1-9]|0", 
    rm_percent = "\\(?[0-9.]+\\)?%", 
    rm_phone = "(?:(?:\\+?1\\s*(?:[.-]\\s*)?)?(?:\\(\\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\\s*\\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\\s*(?:[.-]\\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\\s*(?:[.-]\\s*)?([0-9]{4})(?:\\s*(?:#|x\\.?|ext\\.?|extension)\\s*(\\d+))?", 
    rm_tag = "(?<![@\\w])@([a-z0-9_]+)\\b", 
    rm_tag2 = "(?<![@\\w])@([a-z0-9_]{1,15})\\b",  
    rm_title_name = "(((Dr|Mr|Mrs|Ms|dr|mr|mrs|ms)(\\.))|(Miss|Mizz|mizz))(\\s+)([A-Za-z]+)(\\s[A-Z][A-Za-z]*\\b)*",
    rm_time = "\\d{0,2}:\\d{2}(?:[:.]\\d+)?", 
    rm_twitter_url = "(https?://t\\.co[^ ]*)|(t\\.co[^ ]*)",	
    rm_url = "(http[^ ]*)|(ftp[^ ]*)|(www\\.[^ ]*)", 
    rm_url2 = "(((https?|ftps?)://)|(www\\.))(-\\.)?([^\\s/?\\.#-]+\\.?)+(/[^\\s]*)?",
    rm_url3 = "(https?|ftps?)://(-\\.)?([^\\s/?\\.#-]+\\.?)+(/[^\\s]*)?",
    rm_white = "^\\s+|\\s+$|(\\s+)(?=[,]|[\\;\\:]+)|\\s(?=[.!?][0-9])(*SKIP)(*F)|(\\s+)(?=[.!?]+)(?<=[^\\d])|(\\s+)(?=[\\)\\]\\}])|(?<=[\\(\\[\\{])(\\s+)|(\\s+)(?=[\\s])",
    rm_white_bracket = "(\\s+)(?=[\\)\\]\\}])|(?<=[\\(\\[\\{])(\\s+)",
    rm_white_colon= "(\\s+)(?=[\\:\\;]+)",
    rm_white_comma = "(\\s+)(?=,)",
    rm_white_endmark = "\\s(?=[.!?][0-9])(*SKIP)(*F)|(\\s+)(?=[.!?]+)(?<=[^\\d])",	
    rm_white_lead = "^\\s+",
    rm_white_lead_trail = "^\\s+|\\s+$",
    rm_white_multiple = "(\\s+)(?=[\\s])",	
    rm_white_punctuation = "\\s(?=[.!?][0-9])(*SKIP)(*F)|(\\s+)(?=[.!?]+)(?<=[^\\d])|(\\s+)(?=[,]|[\\;\\:]+)",
    rm_white_trail = "\\s+$",	
    rm_zip = "(?<!\\d)\\d{5}(?:[ -]\\d{4})?\\b"
)

regex_supplement <- list(
    after_a = "(?<=\\b(an|An)\\s)(\\w+)|(?<=\\b(a|A)\\s)(\\w+)",
    after_the = "(?<=\\b(the|The)\\s)(\\w+)",
    after_ = "(?<=\\b(%s|%s)\\s)(\\w+)",  
    before_ = "\\w+?(?= ((%s|%s)\\b))",
    hexadecimal = "#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})",
    ip_address = "\\b\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\b",
    thousands_separator = "(\\d)(?:(?=\\d+(?=[^\\d.]))(?=(?:[0-9]{3})+\\b)|(?=\\d+(?=\\.))(?=(?:[0-9]{3})+(?=\\.)))",
    time_12_hours = "(1[012]|[1-9]):[0-5][0-9](\\s?)(am|pm)",
    white_after_comma = "(?!\\s+),(?=\\D)",	
    version = "(?<=\\b(v|version)\\s?)([0-9]+)\\.([0-9]+)\\.([0-9]+)(?:\\.([0-9]+))?\\b",
    version2 = "\\b(v(ersion)*\\s*)([0-9]+)\\.([0-9]+)\\.([0-9]+)(?:\\.([0-9]+))?\\b"
)

#  pack.skel(regex_usa, regex_supplement)

#========================
#staticdocs dev version
#========================
#packages
# library(devtools); install_github("staticdocs", "hadley")
# install_github("acc.roxygen2", "trinker");install.packages("rstudioapi")
library(highlight);  library(staticdocs); 

#STEP 1: create static doc  
#right now examples are FALSE in the future this will be true
#in the future qdap2 will be the go to source
build_site(pkg="C:/Users/trinker/GitHub/qdapRegex", launch = FALSE)

#STEP 2: reshape index
path <- "inst/web"
path2 <- file.path(path, "/index.html")
rdme <- "C:/Users/trinker/GitHub/qdapRegex/inst/extra_statdoc/readme.R"
library(acc.roxygen2); library(qdap);
extras <- qcv("%|%", "rm_twitter_url")
## drops <- qcv()
expand_statdoc(path2, to.icon = extras, readme = rdme)

x <- readLines(path2)
x[grepl("<h2>Authors</h2>", x)] <- paste(c("<h2>Author</h2>", 
    rep("<h2>Contributor</h2>", 1)),
    c("Tyler W. Rinker", "Stackoverflow's hwnd"))

cat(paste(x, collapse="\n"), file=path2)


#STEP 3: move to trinker.guthub
library(reports)
file <- "C:/Users/trinker/GitHub/trinker.github.com/"
incoming <- file.path(file, "qdapRegex_dev")
delete(incoming)
file.copy(path, file, TRUE, TRUE)
file.rename(file.path(file, "web"), incoming)
## delete(path)
#==========================
#staticdocs current version
#==========================
#packages
# library(devtools); install_github("staticdocs", "hadley")
# install_github("acc.roxygen2", "trinker"); install.packages("rstudioapi")
library(highlight);library(staticdocs); 

#STEP 1: create static doc  
#right now examples are FALSE in the future this will be true
#in the future qdap2 will be the go to source
build_site(pkg="C:/Users/trinker/GitHub/qdapRegex", launch = FALSE)

#STEP 2: reshape index
path <- "inst/web"
path2 <- file.path(path, "/index.html")
rdme <- "C:/Users/trinker/GitHub/qdapRegex/inst/extra_statdoc/readme.R"
library(acc.roxygen2); library(qdap);
## extras <- qcv("")
## drops <- qcv()
## expand_statdoc(path2,  readme = rdme)
readme_statdoc(path2, rdme, path2)

x <- readLines(path2)
x[grepl("<h2>Authors</h2>", x)] <- paste(c("<h2>Author</h2>", 
    rep("<h2>Contributor</h2>", 1)),
    c("Tyler W. Rinker", "Stackoverflow's hwnd"))

cat(paste(x, collapse="\n"), file=path2)


#STEP 3: move to trinker.guthub
library(reports)
file <- "C:/Users/trinker/GitHub/trinker.github.com/"
incoming <- file.path(file, "qdapRegex_dev")
delete(incoming)
file.copy(path, file, TRUE, TRUE)
file.rename(file.path(file, "web"), incoming)
## delete(path)

#==========================
# NEWS new version
#==========================
x <- c("BUG FIXES", "NEW FEATURES", "MINOR FEATURES", "IMPROVEMENTS", "CHANGES")
cat(paste(x, collapse = "\n\n"), file="clipboard")




