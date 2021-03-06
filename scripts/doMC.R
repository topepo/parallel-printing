logger <- function(i) {
  cat("cat", i, "\n")
  message("message ", i)
  cli::cli_alert_info("cli_alert_info {i}")
  invisible(NULL)
}

# ------------------------------------------------------------------------------

library(foreach)

# ------------------------------------------------------------------------------

res <- foreach(i = 1:2, .packages = "cli") %dopar% logger(i)

# ------------------------------------------------------------------------------

library(doMC)
registerDoMC(cores = 4)
# ------------------------------------------------------------------------------

res <- foreach(i = 1:2, .packages = "cli") %dopar% logger(i)

# ------------------------------------------------------------------------------

options(width = 100)
sessioninfo::session_info()
