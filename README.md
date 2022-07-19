[![R Shiny docker](https://github.com/adimajo/whiteapp_shiny/actions/workflows/r-shiny.yml/badge.svg)](https://github.com/adimajo/whiteapp_shiny/actions/workflows/r-shiny.yml)
[![Build Status](https://app.travis-ci.com/adimajo/whiteapp_shiny.svg?token=opB6ydhp1rfhZkQiU4AY&branch=master)](https://app.travis-ci.com/adimajo/whiteapp_shiny)
[![pipeline status](https://gitlab.com/adimajo/whiteapp_shiny/badges/master/pipeline.svg)](https://gitlab.com/adimajo/whiteapp_shiny/-/commits/master)

[![Coverage status](https://codecov.io/gh/adimajo/whiteapp_shiny/branch/master/graph/badge.svg)](https://codecov.io/github/adimajo/whiteapp_shiny?branch=master)
[![coverage report](https://gitlab.com/adimajo/whiteapp_shiny/badges/master/coverage.svg)](https://gitlab.com/adimajo/whiteapp_shiny/-/commits/master)

# WhiteApp R Shiny

The `WhiteApp` package / shiny app is a template of a simple Shiny app which displays current versions of R and installed packages. All functions necessary to the app are created in an R package to keep things tidy and well documented (thus using the standard tools for R packages), making the Shiny ui / server scripts merely executors of functions defined in the `WhiteApp` package. The template ships with a Gitlab CI pipeline (which lints the code, builds the package, documents it, runs CRAN checks, tests, computes test coverage, checks on rhub on different platforms as well as on Sonarqube, builds a docker container and deploys it), a Github Actions pipeline (which lints, documents and upload the documentation as github page, checks the package, computes tests and coverage, checks on rhbub for different platforms, builds a docker container and uploads it to Github), and a Travis pipeline (for elegant display of code coverage). 

## Sonarcloud

If you want to leverage the static code analysis (and nice display!) provided by Sonarcloud, link your Github account
to Sonarcloud at [sonarcloud.io](https://sonarcloud.io/).

## Using the Github Actions pipeline

Nothing to do! If you import your project in Sonarcloud, it will automatically trigger its analysis at each push
(see "SonarCloud Automatic Analysis" under Administration > Analysis Method).

### Secrets

One Github Secret needs to be set:

RHUB_TOKEN: the token associated with the package's maintainer's email address, validated via `rhub::validate_email()`.

## Using the Gitlab CI pipeline

### Variables

Set the following environment variables in Gitlab's UI under Settings > CI/CD. These are not hardcoded into the pipeline
since I use the same pipeline at Crédit Agricole S.A. with our own instances of Gitlab, Gitlab runners, Sonar, etc.

If you wish to deploy on Dockerhub, you should have a repository set up with the same name as your repository.

- `CURRENT_TAG`: the tag of an available public Gitlab runner, e.g. `docker`
- `PYPI_REMOTE`: the URL to your favorite PyPi remote, e.g. `https://pypi.org/simple`
- `SONAR_HOST_URL`: `https://sonarcloud.io/`
- `SONAR_TOKEN`: you can obtain this token by logging in to [sonarcloud.io](https://sonarcloud.io/) and generating a key.
- `DOCKER_CI_REGISTRY`: the Docker registry on which to upload the image, e.g. index.docker.io or registry.gitlab.com
- `DOCKER_CI_REGISTRY_USER`: your registry username, e.g. Gitlab or Dockerhub username
- `DOCKER_CI_REGISTRY_PASSWORD`: your registry password (or access token), e.g. Gitlab or Dockerhub username

## Using the Travis pipeline

Connect to [app.travis-ci.com](https://app.travis-ci.com/) and [app.codecov.io](https://app.codecov.io) to connect your repo.

The pipeline installs devtools, the dependencies of the application, documents it, checks it, computes code coverage
and sends it to [app.codecov.io](https://app.codecov.io) to display it nicely on this README.

## Installation

### R environment

This projects uses **R 4.0** and **renv**.

Dependencies are stated in the DESCRIPTION file, as well as, with their versions, in `renv.lock`.

To use this template and / or make contributions, you should install `renv` (e.g. via `install.packages('renv')`) which will in turn automatically install packages from `renv.lock` by sourcing `renv/activate.R`.

If this didn't go well, use `renv::restore()`.

### "Local" installation w.o. internet access

#### Dependencies

All dependencies are downloaded into the `renv/library` folder, which allows for installation on an internet-free machine (provided ~identical configuration, i.e. same R version same architecture if there are compiled packages, etc.).

#### R-portable

It is also possible to get a portable version of R, [downloadable from Sourceforge](https://sourceforge.net/projects/rportable/).

## Disclaimer

Supported by Groupe Crédit Agricole; analyses and opinions of the author(s) expressed in this work are their own.
