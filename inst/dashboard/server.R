server <- function(input, output, session) {
  output$R_version <- shiny::renderTable(WhiteAppRShiny::find_R_version())
  output$package_versions <- shiny::renderText(
    WhiteAppRShiny::find_packages_versions())
  output$SessionInfo <- shiny::renderTable({
    WhiteAppRShiny::find_session_info()
  })
}
