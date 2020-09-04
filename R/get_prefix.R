#' Get prefixes
#'
#' This function accepts a list of characters and returns
#' a list of unique prefixes.
#'
#' @param names list of names to pull prefixes
#' @param sep character string to split names (e.g. "-")
#' @param HMP option to add HMP prefix SRS to list if HMP=TRUE, defaults to HMP=FALSE.
#' @keywords MEP
#' @export
#' @examples
#' get_prefix(colnames(RPKM_m), sep="-")
#' get_prefix(colnames(RPKM_m), sep="-", HMP= TRUE)

get_prefix <- function(names, sep="-", HMP=FALSE){
  for(i in seq(1, length(names))){
    if(str_detect(names[[i]], "PM")){
      name <- names[[i]]
      #      print(name)
      names[[i]] <- str_split(name, sep, simplify = TRUE)[[1]]
    }
    if(HMP==TRUE){
      if(str_detect(names[[i]], "SRS")){
        names[[i]] <- "SRS"
      }
    }
  }
  prefixes <- names %>% unique()
  return(prefixes)
}
