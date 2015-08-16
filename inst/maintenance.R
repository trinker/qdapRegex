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

#==========================
# UPDATE VERSION
#==========================
update_version()

#========================
#staticdocs dev version
#========================
#packages
pacman::p_load_gh("hadley/testthat", "hadley/staticdocs")
pacman::p_load(highlight)
if (!pacman::p_exists(acc.roxygen2, TRUE)) {
    pacman::p_install_gh("trinker/acc.roxygen2")
}

#STEP 1: create static doc  
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


extras <- qdap::qcv("%|%", "rm_twitter_url", "rm_white_bracket", "rm_white_colon", 
	"rm_white_comma", "rm_white_endmark", "rm_white_lead", "rm_white_trail", 
	"rm_white_lead_trail", "rm_white_multiple", "rm_white_punctuation", "L", 
	"U", "as_numeric", "as_numeric2", "rm_transcript_time", "as_time", "as_time2")
## drops <- qcv()
acc.roxygen2::expand_statdoc(path2, to.icon = extras, readme = rdme)

#x <- readLines(path2)
#x[grepl("<h2>Authors</h2>", x)] <- paste(c("<h2>Author</h2>", 
#    rep("<h2>Contributor</h2>", 1)),
#    c("Tyler W. Rinker", "Stackoverflow's hwnd"))

#cat(paste(x, collapse="\n"), file=path2)


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

library(reports)
file <- file.path(R_USER, "GitHub/trinker.github.com/")
# incoming <- file.path(file, "qdapRegex")
delete(incoming)
file.copy(path, file, TRUE, TRUE)
file.rename(file.path(file, "web"), incoming)
## delete(path)

#==========================
# NEWS new version
#==========================
x <- c("BUG FIXES", "NEW FEATURES", "MINOR FEATURES", "IMPROVEMENTS", "CHANGES")
cat(paste(x, collapse = "\n\n"), file="clipboard")




