

options(repos=c(
  "https://mc-stan.org/r-packages/",
  "https://cloud.r-project.org/"
))

install.packages(c(
  "rstan",
  "cmdstanr"
), dependencies = TRUE)

cmdstanr::install_cmdstan()

IRkernel::installspec(user = FALSE)

install.packages(c("coda", "mvtnorm", "devtools", "loo", "dagitty", "shape"))
devtools::install_github("rmcelreath/rethinking")