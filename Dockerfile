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

RUN addgroup --system shiny && adduser --system --ingroup shiny shiny

COPY ./renv.lock .
COPY ./inst .
COPY ./R .
COPY ./DESCRIPTION .

RUN Rscript -e "options(renv.consent = TRUE);renv::restore(lockfile = 'renv.lock')"

RUN Rscript -e "install.packages('devtools')"

RUN Rscript -e "devtools::install()"

RUN chown shiny:shiny -R .

USER shiny

EXPOSE 8000

CMD ["R", "-e", "WhiteAppRShiny::runDashboard()"]
