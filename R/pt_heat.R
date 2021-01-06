#' Patient pheatmaps
#'
#' This function accepts a numeric matrix (typically features as rows,
#' and samples as columns) list of patient prefixes and plots heatmaps
#' for data by patient.
#'
#' To add column & row metadata with color specifications, these can
#' be supplied as optional parameters.  Metadata annotations must be
#' stored as data frames with rownames that correspond with matrix rownames.
#'
#' @param matrix numerix matrix
#' @param prefixes list of prefixes (see get_prefix)
#' @param colannotation dataframe with column annotation metadata
#' @param rowannotation dataframe with row annotation metadata
#' @param colors list of hex color values (see pheatmap(annotation_colors))
#' @param options string of comma separated pheatmap options to pass (e.g. cluster_rows, scale...)
#' @keywords MEP
#' @export
#' @examples
#' get_prefix(colnames(RPKM_m), sep="-", HMP= TRUE)

pt_heat <- function(matrix_input, prefixes, rowmeta=NULL, colmeta=NULL, meta_colors=NULL, param_string = NULL){

  # create argument list
  args <- NULL
  arguments <- NULL
  if(!is.null(rowmeta)){
    args[length(args)+1] <- "annotation_row = rowmeta"
  }
  if(!is.null(colmeta)){
    args[length(args)+1] <- "annotation_col = colmeta"
  }
  if(!is.null(meta_colors)){
    args[length(args)+1] <- "annotation_colors = meta_colors"
  }
  if(!is.null(param_string)){
    args[length(args)+1] <- param_string
  }
    arguments <- paste(args, collapse=", ")
  # print(arguments)

  # make heatmaps
  for(prefix in prefixes){
    matrix_prefix <- matrix_input %>% dplyr::select(starts_with(prefix))
    pheatmap(matrix_prefix)

  }
}


# pt_heat <- function(matrix, prefixes, colannotation, rowannotation, colors, options){
#   for(prefix in prefixes){
#     matrix_prefix <- matrix %>% select(startsWith(prefix))
#     pheatmap(matrix_prefix,
#               annotation_row = rowannotation,
#               annotation_col = colannotation,
#               annotation_colors = colors)}}
