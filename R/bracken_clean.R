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

bracken_clean <- function(data, min_abund=0.01, frac_or_num="frac"){

  # filter taxa by minimum abundance & trim "_frac" suffix
  if(frac_or_num=="frac"){

    # select just taxonomy fraction and taxon name columns
    Slim_Data <- data %>%
      select(-c(taxonomy_id, taxonomy_lvl)) %>%
      select(-matches("_num"))

    Slim_step2 <- Slim_Data %>%
      filter_at(vars(ends_with("_frac")), any_vars(. >= min_abund)) %>%  #<----- minimum abundance to adjust
      column_to_rownames(var="name") %>%
      rename_at(.vars = vars(ends_with("_frac")),
                .funs = funs(sub("_frac$", "", .)))
  }

  # select & trim "_num" suffix
  if(frac_or_num=="num"){

    Slim_Data <- data %>%
      select(-c(taxonomy_id, taxonomy_lvl)) %>%
      select(-matches("_frac"))

    Slim_step2 <- Slim_Data %>%
      column_to_rownames(var="name") %>%
      rename_at(.vars = vars(ends_with("_num")),
                .funs = funs(sub("_num$", "", .)))
  }

  # return filtered data frame
  return(Slim_step2)
}
