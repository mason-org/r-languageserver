#!/usr/bin/env bash

set -euo pipefail

FORCE=0

while getopts "f" opt; do
  case $opt in
    f)
      FORCE=1
      ;;
  esac
done

VERSION=${VERSION:-""}

if [[ -z $VERSION ]]; then
    VERSION=$(gh release view --repo REditorSupport/languageserver --json tagName -q .tagName)
fi

if [[ $FORCE != 1 ]] && gh release view "$VERSION"; then
    echo "Release $VERSION already exists."
    exit 0
fi

if [[ -n $GITHUB_ACTOR ]]; then
  git config --local user.email "${GITHUB_ACTOR}"
  git config --local user.name "${GITHUB_ACTOR}@users.noreply.github.com"
fi

git tag -f -a -m "$VERSION" "$VERSION"
git push -f origin "refs/tags/${VERSION}"
if ! gh release view "$VERSION"; then
    gh release create "$VERSION" --generate-notes
fi
