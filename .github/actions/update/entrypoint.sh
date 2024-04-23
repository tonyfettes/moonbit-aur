#!/usr/bin/env sh

cp -r /github/workspace /build

(cd /build/workspace/ && {
  makepkg
  updpkgsums
  makepkg
  rm core.zip
  updpkgsums
  makepkg
  cp PKGBUILD /github/workspace/
  makepkg --printsrcinfo > .SRCINFO
  cp .SRCINFO /github/workspace/
})
