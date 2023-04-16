# r-languageserver

Wrapper around [REditorSupport/languageserver](https://github.com/REditorSupport/languageserver) that:

1. installs the language server to an isolated library location, and
2. enables running the R language server as a standalone executable.

## Usage

### Installing

```sh
$ R --slave -f src/install.r <lib_loc> <ref>
```

### Running

```sh
$ r-languageserver
```

[modeline]: vim:tw=120:et:sw=4
