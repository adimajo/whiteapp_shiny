FROM docker-remote.registry.saas.cagip.group.gca/rocker/shiny:4.0.5

RUN apt-get update && apt-get install -y --no-install-recommends \
git-core \
libssl-dev \
libcurl4-gnutls-dev \
curl \
libsodium-dev \
libxml2-dev \
libicu-dev && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV _R_SHLIB_STRIP_=true

RUN install2.r remotes renv

RUN mkdir whiteapp

COPY ./.Rbuildignore whiteapp/
# COPY ./.Rprofile whiteapp/
# COPY ./renv.lock whiteapp/
COPY ./inst whiteapp/
COPY ./R whiteapp/
COPY ./DESCRIPTION whiteapp/

# RUN Rscript -e "options(renv.consent = TRUE);renv::restore(lockfile = 'renv.lock')"

RUN Rscript -e "install.packages('devtools')"

RUN ls -al whiteapp

RUN R CMD build whiteapp

RUN R CMD INSTALL *.tar.gz

EXPOSE 8000

CMD ["R", "-e", "WhiteAppRShiny::runDashboard()"]
