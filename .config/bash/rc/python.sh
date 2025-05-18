#!/bin/bash

function pymkvenv {
    local path="${1:-.venv}"
    python -m venv "$path" && source "$path/bin/activate"
}

function pyloadenv {
    local path="${1:-.venv}"
    source "$path/bin/activate"
}

# fancy new features < vim bindings
# see https://peps.python.org/pep-0762/
export PYTHON_BASIC_REPL=1
