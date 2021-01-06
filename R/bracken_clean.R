#' Clean Bracken
#'
#' This function accepts a bracken summary file from the bracken python script
#' and returns a cleaned data frame for further analyses.
#'
#' @param data input data (can be piped from readR etc.)
#' @param min_abund option adjust minimum abundance (default 0.01)
#' @keywords MEP
#' @export
#' @examples
#' bracken_clean(data = "bracken_s")
#' data %>% bracken_clean(min_abund=0.05)

bracken_clean <- function(data, min_abund=0.01){

    # select just taxonomy fraction and taxon name columns
    Slim_Data <- data %>%
      select(-c(taxonomy_id, taxonomy_lvl)) %>%
      select(-matches("_num"))

    # filter taxa by minimum abundance & trim "_frac" suffix
    Slim_above_min_abundance <- Slim_Data %>%
      filter_at(vars(ends_with("_frac")), any_vars(. >= min_abund)) %>%  #<----- minimum abundance to adjust
      column_to_rownames(var="name") %>%
      rename_at(.vars = vars(ends_with("_frac")),
                .funs = funs(sub("_frac$", "", .)))

    # return filtered data frame
    return(Slim_above_min_abundance)
  }
