args <- commandArgs(trailingOnly = TRUE)

langserver_library <- args[1]
ref <- args[2]

options(langserver_library = langserver_library)
options(langserver_quiet = FALSE)
options(repos = list(CRAN = "http://cran.rstudio.com/"))
rls_lib <- getOption("langserver_library")
.libPaths(new = rls_lib)
did_install_remotes <- FALSE
tryCatch(
  expr = {
    library("remotes")
  },
  error = function(e) {
    install.packages("remotes", lib = rls_lib, dependencies = TRUE)
    loadNamespace("remotes", lib.loc = rls_lib)
    did_install_remotes <- TRUE
  }
)

# We set force = TRUE because this command will error if languageserversetup is
# already installed (even if it's at a different library location).
remotes::install_github("jozefhajnala/languageserversetup", lib = rls_lib, force = TRUE)
if (did_install_remotes) {
  remove.packages("remotes", lib = rls_lib)
}

loadNamespace("languageserversetup", lib.loc = rls_lib)
languageserversetup::languageserver_install(
  fullReinstall = FALSE,
  confirmBeforeInstall = FALSE,
  strictLibrary = TRUE,
  ref = ref
)
library("languageserver", lib.loc = rls_lib)
