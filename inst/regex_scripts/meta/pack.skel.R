R_USER <-  switch(Sys.info()[["user"]],
    Tyler = "C:/Users/Tyler",
    trinker = "C:/Users/trinker",
    message("Computer name not found")
)

pack.skel <- 
function(..., loc = file.path(R_USER, "Desktop")){
    x <- substitute(...())
    Trim <- function (x) gsub("\\s+$", "", x)
    z <- Trim(unlist(lapply(x, function(y) as.character(y))))
    package.skeleton(name = "temp", list = z, envir =  .GlobalEnv, path = loc)
}
cat("pack.skel Loaded!")



transfer_data <- function(dat.loc = file.path(R_USER, "Desktop/temp/data"),
    pack.loc = file.path(R_USER, sprintf("GitHub/%s/data", basename(getwd())))){
    
    fls <- dir(dat.loc)
    fls2 <- dir(pack.loc)    
    lapply(file.path(pack.loc, fls2[fls2 %in% fls]), reports::delete)
    file.copy(
        file.path(dat.loc, dir(dat.loc)),
        pack.loc
    )
    reports::delete(dat.loc)
    message("File Transfered")
}




