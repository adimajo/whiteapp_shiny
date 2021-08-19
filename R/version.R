#' Versions de R
#'
#' \code{find_R_version} finds the R version of the current session.
#'
#' @export
find_R_version <- function() {
  return(as.data.frame(c(R.version)))
}

#' Versions des packages du WhiteApp R Shiny
#'
#' \code{find_packages_versions} finds the version of this package.
#'
#' @export
find_packages_versions <- function() {
  return(paste(utils::packageVersion("WhiteAppRShiny")))
}

#' Session Info
#'
#' \code{find_session_info} outputs SessionInfo.
#'
#' @export
find_session_info <- function() {
  si <- sessioninfo::session_info()
  return(data.frame(
    Package = si$packages$package,
    Version = si$packages$loadedversion
  ))
}
