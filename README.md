When using parallel processing (via `foreach`), there are some inconsistencies how/if output is printed during execution. These inconsistencies are across

 * the terminal or IDE
 * how the parallel backends are registered (i.e. `doPar` vs `doFuture`)
 * operating systems

`scripts` has R code for this function:

```r
logger <- function(i) {
  cat("cat", i, "\n")
  message("message ", i)
  cli::cli_alert_info("cli_alert_info {i}")
  invisible(NULL)
}
```

To reproduce these scripts, the following packages are needed:


```r
c("cli", "foreach", "doMC", "doSNOW", "doFuture", "doMPI", "doParallel", "sessioninfo")
```

The development version of `cli`, as of 9/2019, was used. Use `devtools:::install_github("r-lib/cli")` to obtain this. 

Some of these packages need additional software outside of R. Each script prints the versions used for each package. 

## Currrent Results

Tested on macOS and Windows 10 so far:

* No output in terminal or RStudio IDE: MPI, multicore (`doParallel`), sockets (`doParallel`), SNOW (`doSNOW`)

* Output in terminal but not RStudio IDE: multicore (`doMC`), 

* Output in terminal and RStudio IDE: multicore (`doFuture`)<sup>1</sup>,  multicore (`doParallel` + `doFuture`)<sup>1</sup>, MPI (`doFuture`)<sup>1</sup>, sockets (`doParallel` + `doFuture`)<sup>1</sup>, SNOW (`doSNOW` + `doFuture`)<sup>2</sup>



<sup>1</sup> But `cli` output not produced in either

<sup>2</sup> But `cli` output not produced RStudio IDE