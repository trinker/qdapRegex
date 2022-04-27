temp_dir <-  tempdir()

pack.skel <- function(..., loc = temp_dir){
    x <- substitute(...())
    Trim <- function (x) gsub("\\s+$", "", x)
    z <- Trim(unlist(lapply(x, function(y) as.character(y))))
    package.skeleton(name = "temp", list = z, envir =  .GlobalEnv, path = loc)
}
cat("pack.skel Loaded!")


delete <- function(file = NULL) {
    x <- if (is.null(file)) {
        menu(dir())
    } else {
        file
    }
    unlink(x, recursive = TRUE, force = FALSE)
}

transfer_data <- function(dat.loc = file.path(temp_dir, "temp/data"),
    pack.loc = 'data'){
    
    fls <- dir(dat.loc)
    fls2 <- dir(pack.loc)    
    lapply(file.path(pack.loc, fls2[fls2 %in% fls]), delete)
    file.copy(
        file.path(dat.loc, dir(dat.loc)),
        pack.loc
    )
    
    delete(dirname(dat.loc))
    message("File Transfered")
}




