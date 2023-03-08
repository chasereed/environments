
options(repos=c(
  "https://mc-stan.org/r-packages/",
  "https://cloud.r-project.org/"
))

install.packages(c(
  "BH",
  "cmdstanr"
), dependencies = TRUE)

cmdstanr::install_cmdstan()

install.packages(c("coda", "mvtnorm", "devtools", "loo", "dagitty", "shape"))
devtools::install_github("rmcelreath/rethinking")
