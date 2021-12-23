ARG DOCKER_REGISTRY_BIS

FROM ${DOCKER_REGISTRY_BIS}/rocker/shiny:4.0.5

RUN apt-get update && apt-get install -y --no-install-recommends \
git-core \
libssl-dev \
libcurl4-gnutls-dev \
curl \
libsodium-dev \
libxml2-dev \
libicu-dev && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV _R_SHLIB_STRIP_ true

RUN install2.r remotes renv

RUN mkdir whiteapp

COPY ./.Rbuildignore whiteapp/
COPY ./inst whiteapp/inst
COPY ./R whiteapp/R
COPY ./DESCRIPTION whiteapp/

RUN Rscript -e "install.packages('devtools')"

RUN Rscript -e "devtools::install_local('whiteapp')"

EXPOSE 8000

CMD ["Rscript", "-e", "WhiteAppRShiny::runDashboard()"]
