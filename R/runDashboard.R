#' Lancement du dashboard WhiteApp R Shiny
#'
#' \code{runDashboard} sert à lancer le serveur Shiny.
#'
#' @export
runDashboard <- function() {
  appDir <- system.file("inst/dashboard", package = "WhiteAppRShiny")
  if (appDir == "") {
    stop("Could not find `dashboard` directory. Try re-installing `WhiteAppRShiny`.",
      call. = FALSE
    )
  }

  shiny::runApp(
    appDir,
    display.mode = "normal",
    port = 8000,
    launch.browser = TRUE
  )
}
