ui <-
  shiny::fluidPage(
    shiny::titlePanel(div(
      column(width = 6, h2("Whiteapp R Shiny")),
      column(width = 6, tags$img(src = "logo_gro.png"))
    ),
    windowTitle = "Whiteapp R Shiny"
    ),
    shiny::mainPanel(
      shiny::tags$hr(),
      shiny::headerPanel("R version"),
      shiny::tableOutput("R_version"),
      shiny::tags$hr(),
      shiny::headerPanel("Whiteapp version"),
      shiny::textOutput("package_versions"),
      shiny::tags$hr(),
      shiny::headerPanel("Session information"),
      shiny::tableOutput("SessionInfo")
    )
  )
