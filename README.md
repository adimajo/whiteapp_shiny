![R package](https://github.com/adimajo/whiteapp_shiny/workflows/R%20package/badge.svg)
[![Travis build status](https://travis-ci.org/adimajo/whiteapp_shiny.svg?branch=master)](https://travis-ci.org/adimajo/whiteapp_shiny)
[![Coverage status](https://codecov.io/gh/adimajo/whiteapp_shiny/branch/master/graph/badge.svg)](https://codecov.io/github/adimajo/whiteapp_shiny?branch=master)

# WhiteApp R Shiny

<!-- badges: start -->
<!-- badges: end -->

Le package `WhiteApp` est un template BootStrap pour déploiement d'une chaîne CI/CD pour projet Flask (Python).

## Installation

### Environnement R

Le projet utilise **R 4.0** dans un container Docker.

Le projet utilise également **renv**.

L'ensemble des dépendances R sont listées dans le fichier `renv.lock`.
Les dépendances sont a priori installées automatiquement du fait du script
`renv/activate.R` qui est chargé à l'ouverture du projet (voir `.Rprofile`).
Si l'installation ne s'est pas déroulée correctement, celles-ci peuvent être 
installées à l'aide de `renv::restore()`, après avoir
installé `renv` via `install.packages('renv')`.

### Installation "locale" sans internet

#### Dépendances

L'ensemble des dépendances du projet, afin de les porter ensuite 
sur une machine qui disposerait d'un accès limité à internet, sont dans le dossier `renv/library`.
Attention, ces packages sont donnés pour une version de R, et possiblement, si des packages nécessitant
une compilation ont été téléchargés, une architecture.

#### R-portable

Il est possible d'y associer une version portable de R, [téléchargeable sur
internet](https://sourceforge.net/projects/rportable/).

#### Script

On trouve dans le répertoire `scripts/` un script R qui spécifie que la librairie
`renv` est celle à utiliser, charge le package, et lance l'application, de même
qu'un script .bat qui pointe vers le dossier R-portable préalablement téléchargé
et lance le scrit R susmentionné.
