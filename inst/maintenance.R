#========
# BUILD
#========
source("inst/build.R")

#==========================
# Run unit tests
#==========================
devtools::test()

#==========================
# knit README.md
#==========================
knitr::knit2html("README.Rmd", output ='README.md'); reports::delete("README.html")

#==========================
# UPDATE NEWS
#==========================
update_news()

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
R_USER <-  switch(Sys.info()[["user"]],
    Tyler = "C:/Users/Tyler",
    trinker = "C:/Users/trinker",
    message("Computer name not found")
)

build_site(pkg=file.path(R_USER, "GitHub/qdapRegex"), launch = FALSE)

#STEP 2: reshape index
R_USER <-  switch(Sys.info()[["user"]],
    Tyler = "C:/Users/Tyler",
    trinker = "C:/Users/trinker",
    message("Computer name not found")
)
path <- "inst/web"
path2 <- file.path(path, "/index.html")
rdme <- "inst/extra_statdoc/readme.R"
library(acc.roxygen2); library(qdap);
extras <- qcv("%|%", "rm_twitter_url", "rm_white_bracket", "rm_white_colon", 
	"rm_white_comma", "rm_white_endmark", "rm_white_lead", "rm_white_trail", 
	"rm_white_lead_trail", "rm_white_multiple", "rm_white_punctuation", "L", 
	"U")
## drops <- qcv()
expand_statdoc(path2, to.icon = extras, readme = rdme)

x <- readLines(path2)
x[grepl("<h2>Authors</h2>", x)] <- paste(c("<h2>Author</h2>", 
    rep("<h2>Contributor</h2>", 1)),
    c("Tyler W. Rinker", "Stackoverflow's hwnd"))

cat(paste(x, collapse="\n"), file=path2)


#STEP 3: move to trinker.guthub
library(reports)
file <- file.path(R_USER, "GitHub/trinker.github.com/")
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
library(highlight);  library(staticdocs); 

#STEP 1: create static doc  
#right now examples are FALSE in the future this will be true
#in the future qdap2 will be the go to source
R_USER <-  switch(Sys.info()[["user"]],
    Tyler = "C:/Users/Tyler",
    trinker = "C:/Users/trinker",
    message("Computer name not found")
)

build_site(pkg=file.path(R_USER, "GitHub/qdapRegex"), launch = FALSE)

#STEP 2: reshape index
path <- "inst/web"
path2 <- file.path(path, "/index.html")
rdme <- "inst/extra_statdoc/readme.R"
library(acc.roxygen2); library(qdap);
extras <- qcv("%|%", "rm_twitter_url", "rm_white_bracket", "rm_white_colon", 
    "rm_white_comma", "rm_white_endmark", "rm_white_lead", "rm_white_trail", 
	"rm_white_lead_trail", "rm_white_multiple", "rm_white_punctuation", "L", 
	"U")
## drops <- qcv()
expand_statdoc(path2, to.icon = extras, readme = rdme)

x <- readLines(path2)
x[grepl("<h2>Authors</h2>", x)] <- paste(c("<h2>Author</h2>", 
    rep("<h2>Contributor</h2>", 1)),
    c("Tyler W. Rinker", "Stackoverflow's hwnd"))

cat(paste(x, collapse="\n"), file=path2)


#STEP 3: move to trinker.guthub
library(reports)
file <- file.path(R_USER, "GitHub/trinker.github.com/")
#incoming <- file.path(file, "qdapRegex")
delete(incoming)
file.copy(path, file, TRUE, TRUE)
file.rename(file.path(file, "web"), incoming)
## delete(path)

#==========================
# NEWS new version
#==========================
x <- c("BUG FIXES", "NEW FEATURES", "MINOR FEATURES", "IMPROVEMENTS", "CHANGES")
cat(paste(x, collapse = "\n\n"), file="clipboard")




