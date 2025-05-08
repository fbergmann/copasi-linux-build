#!/bin/env bash

if [ ! -d "copasi-dependencies" ]; then
    git clone https://github.com/copasi/copasi-dependencies.git
fi

# change into copasi-dependencies and update 
pushd copasi-dependencies
git pull --rebase
popd
