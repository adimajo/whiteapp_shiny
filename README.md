![R package](https://github.com/adimajo/whiteapp_shiny/workflows/R%20package/badge.svg)
[![Build Status](https://app.travis-ci.com/adimajo/whiteapp_shiny.svg?token=opB6ydhp1rfhZkQiU4AY&branch=master)](https://app.travis-ci.com/adimajo/whiteapp_shiny)[![Coverage status](https://codecov.io/gh/adimajo/whiteapp_shiny/branch/master/graph/badge.svg)](https://codecov.io/github/adimajo/whiteapp_shiny?branch=master)

# WhiteApp R Shiny

The `WhiteApp` package / shiny app is a template of a simple Shiny app which displays current versions of R and installed packages. All functions necessary to the app are created in an R package to keep things tidy and well documented (thus using the standard tools for R packages), making the Shiny ui / server scripts merely executors of functions defined in the `WhiteApp` package. The template ships with a Gitlab CI pipeline (which lints the code, builds the package, document it, runs CRAN checks, tests, computes test coverage, checks on rhub on different platforms as well as on Sonarqube, builds a docker container and deploys it), a Github Actions pipeline (which lints, documents and upload the documentation as github page, checks the package, computes tests and coverage, checks on rhbub for different platforms, builds a docker container and uploads it to Github), and a Travis pipeline (for elegant display of code coverage). 

## Using the Gitlab CI pipeline

## Using the Github Actions pipeline

### Secrets

Two Github Secrets need to be set.

APP_TOKEN: the App, or Personal Token, to push the docs to the pages branch.

RHUB_TOKEN: the token associated with the package's maintainer's email address, validated via `rhub::validate_email()`.

## Using the Gitlab CI pipeline

### Variables

## Using the Travis pipeline


## Installation

### R environment

This projects uses **R 4.0** and **renv**.

Dependencies are stated in the DESCRIPTION file, as well as, with their versions, in `renv.lock`.

To use this template and / or make contributions, you should install `renv` (e.g. via `install.packages('renv')`) which will in turn automatically install packages from `renv.lock` by sourcing `renv/activate.R`.

If this didn't go well, use `renv::restore()`.

### Installation "locale" sans internet

#### Dependencies

All dependencies are downloaded into the `renv/library` folder, which allows for installation on an internet-free machine (provided ~identical configuration, i.e. same R version same architecture if there are compiled packages, etc.).

#### R-portable

It is also possible to get a portable version of R, [downloadable from Sourceforge](https://sourceforge.net/projects/rportable/).
