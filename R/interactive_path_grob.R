#' @title Create interactive path grob
#'
#' @description
#' The grob is based on \code{\link[grid]{pathGrob}}.
#' See the documentation for that function for more details.
#'
#' @param ... arguments passed to base function,
#' plus any of the \code{\link{interactive_parameters}}.
#' @return An interactive grob object.
#' @inheritSection interactive_parameters Details for interactive_*_grob functions
#' @seealso \code{\link{girafe}}
#' @export
interactive_path_grob <- function(...) {
  grob_interactive(grid::pathGrob, ...)
}

#' @export
drawDetails.interactive_path_grob <- function(x, recording) {
  dsvg_tracer_on()
  do.call(grid.path, x[grob_argnames(x = x, grob = grid::pathGrob)])
  ids <- dsvg_tracer_off()
  if (length(ids) > 0) {
    # if pathId is specified use that (polygons with holes for example)
    if (!is.null(x$pathId)) {
      posid = which(!duplicated(x$pathId))
    } else {
      if (is.null(x$id)) {
        x$id <- rep(1, length(x$x))
      }
      posid = which(!duplicated(x$id))
    }
    interactive_attr_toxml(x = x, ids = ids, rows = posid)
  }
  invisible()
}
