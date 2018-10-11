#!/bin/bash

if [[ $target_platform =~ linux.* ]] || [[ $target_platform == win-32 ]] || [[ $target_platform == win-64 ]] || [[ $target_platform == osx-64 ]]; then
  export DISABLE_AUTOBREW=1
  mv DESCRIPTION DESCRIPTION.old
  grep -v '^Priority: ' DESCRIPTION.old > DESCRIPTION
  $R CMD INSTALL -d --configure-vars="CC=$CC; CFLAGS= " --build .
else
  mkdir -p $PREFIX/lib/R/library/Matching
  mv * $PREFIX/lib/R/library/Matching
fi
