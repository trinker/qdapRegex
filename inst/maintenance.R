#========
# BUILD
#========
source("inst/build.R")

#==========================
# Run unit tests
#==========================
devtools::test()

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
build_site(pkg="C:/Users/trinker/GitHub/qdapTools", launch = FALSE)

#STEP 2: reshape index
path <- "inst/web"
path2 <- file.path(path, "/index.html")
rdme <- "C:/Users/trinker/GitHub/qdapTools/inst/extra_statdoc/readme.R"
library(acc.roxygen2); library(qdap);
extras <- qcv("hash_look", "%l%", "%l+%", "sec2hms", "%hl%", 
	"%hl+%",  "%lc%", "%lc+%")

drops <- qcv(lookup.character, lookup.data.frame, lookup.list, lookup.matrix, 
	hash_e, lookup.factor, lookup.numeric,v_outer.data.frame, v_outer.list, v_outer.matrix)

expand_statdoc(path2, to.icon = extras, readme = rdme, drop=drops)

x <- readLines(path2)
x[grepl("<h2>Authors</h2>", x)] <- paste(c("<h2>Author</h2>", 
    rep("<h2>Contributor</h2>", 3)),
    c("Tyler W. Rinker", "Dason Kurkiewicz", "Bryan Goodrich", "Kirill M&uuml;ller"))

cat(paste(x, collapse="\n"), file=path2)


#STEP 3: move to trinker.guthub
library(reports)
file <- "C:/Users/trinker/GitHub/trinker.github.com/"
incoming <- file.path(file, "qdapTools_dev")
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
build_site(pkg="C:/Users/trinker/GitHub/qdapTools")

#STEP 2: reshape index
path <- "inst/web"
path2 <- file.path(path, "/index.html")
rdme <- "C:/Users/trinker/GitHub/qdapTools/inst/extra_statdoc/readme.R"
library(acc.roxygen2); #library(qdap);
extras <- qcv("hash_look", "%l%", "%l+%", "sec2hms", "%hl%", 
	"%hl+%",  "%lc%", "%lc+%")

drops <- qcv(lookup.character, lookup.data.frame, lookup.list, lookup.matrix, 
	hash_e, lookup.factor, lookup.numeric,v_outer.data.frame, v_outer.list, v_outer.matrix)

expand_statdoc(path2, to.icon = extras, readme = rdme, drop=drops)

x <- readLines(path2)
x[grepl("<h2>Authors</h2>", x)] <- paste(c("<h2>Author</h2>", 
    rep("<h2>Contributor</h2>", 3)),
    c("Tyler W. Rinker", "Dason Kurkiewicz", "Bryan Goodrich", "Kirill M&uuml;ller"))

cat(paste(x, collapse="\n"), file=path2)


#STEP 3: move to trinker.guthub
library(reports)
file <- "C:/Users/trinker/GitHub/trinker.github.com/"
incoming <- file.path(file, "qdapTools")
delete(incoming)
file.copy(path, file, TRUE, TRUE)
file.rename(file.path(file, "web"), incoming)
## delete(path)

#==========================
# NEWS new version
#==========================
x <- c("BUG FIXES", "NEW FEATURES", "MINOR FEATURES", "IMPROVEMENTS", "CHANGES")
cat(paste(x, collapse = "\n\n"), file="clipboard")




