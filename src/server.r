args <- commandArgs(trailingOnly = TRUE)

langserver_library <- args[1]

options("langserver_library" = langserver_library)
rls_lib <- getOption("langserver_library")
.libPaths(new = c(rls_lib, .libPaths()))
loadNamespace("languageserver", lib.loc = rls_lib)
languageserver::run()
